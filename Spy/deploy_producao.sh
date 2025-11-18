#!/bin/bash

# 🚀 SCRIPT DE DEPLOY PARA PRODUÇÃO NA VPS
# Execute como root: chmod +x deploy_producao.sh && ./deploy_producao.sh

set -e

echo "🚀 DEPLOY DO SISTEMA SPY MONITOR PARA PRODUÇÃO"
echo "=============================================="

# Configurações
VPS_HOST='147.79.111.118'
VPS_USER='root'
PROJECT_DIR='/opt/spy-monitor'

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}📋 CONFIGURAÇÕES:${NC}"
echo -e "VPS: $VPS_HOST"
echo -e "Usuário: $VPS_USER"
echo -e "Diretório: $PROJECT_DIR"
echo ""

# Verificar se estamos no diretório correto
if [ ! -f "manage.py" ]; then
    echo -e "${RED}❌ Execute este script do diretório raiz do projeto Django (onde está manage.py)${NC}"
    exit 1
fi

# Compactar projeto
echo -e "${YELLOW}📦 Compactando projeto Django...${NC}"
tar -czf spy-django.tar.gz . --exclude='__pycache__' --exclude='*.pyc' --exclude='.git' --exclude='db.sqlite3'

# Upload para VPS
echo -e "${YELLOW}📤 Enviando para VPS...${NC}"
scp spy-django.tar.gz $VPS_USER@$VPS_HOST:/tmp/

# Executar deploy na VPS
echo -e "${YELLOW}🔧 Executando deploy na VPS...${NC}"
ssh $VPS_USER@$VPS_HOST 'bash -s' << 'EOF'
# Script remoto
set -e

PROJECT_DIR='/opt/spy-monitor'
BACKUP_DIR='/opt/spy-monitor-backup'

echo "📁 Preparando diretórios..."
mkdir -p $PROJECT_DIR
cd $PROJECT_DIR

# Backup do projeto atual (se existir)
if [ -f "manage.py" ]; then
    echo "💾 Criando backup..."
    mkdir -p $BACKUP_DIR
    tar -czf $BACKUP_DIR/backup-$(date +%Y%m%d-%H%M%S).tar.gz .
fi

# Extrair novo projeto
echo "📦 Extraindo novo projeto..."
tar -xzf /tmp/spy-django.tar.gz
rm /tmp/spy-django.tar.gz

# Instalar Docker e Docker Compose (se não estiver instalado)
if ! command -v docker &> /dev/null; then
    echo "🐳 Instalando Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    rm get-docker.sh
fi

if ! command -v docker-compose &> /dev/null; then
    echo "📋 Instalando Docker Compose..."
    curl -L "https://github.com/docker/compose/releases/download/v2.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi

# Configurar firewall
echo "🔥 Configurando firewall..."
ufw allow ssh
ufw allow 80
ufw allow 443
ufw --force enable

# Criar certificado SSL auto-assinado
echo "🔒 Criando certificado SSL..."
mkdir -p ssl
openssl req -x509 -newkey rsa:4096 -keyout ssl/key.pem -out ssl/cert.pem -days 365 -nodes -subj "/C=BR/ST=SP/L=SaoPaulo/O=SpyMonitor/CN=147.79.111.118"

# Parar containers existentes
echo "🛑 Parando containers existentes..."
docker-compose down || true

# Construir e iniciar serviços
echo "🏗️ Construindo e iniciando serviços..."
docker-compose up -d --build

# Aguardar serviços ficarem prontos
echo "⏳ Aguardando serviços ficarem prontos..."
sleep 30

# Verificar status dos containers
echo "📊 Verificando status dos containers..."
docker-compose ps

# Executar migrações (se necessário)
echo "🗄️ Executando migrações..."
docker-compose exec -T web python manage.py migrate --noinput || echo "Migrações já executadas"

# Coletar arquivos estáticos
echo "📄 Coletando arquivos estáticos..."
docker-compose exec -T web python manage.py collectstatic --noinput --clear

# Criar superusuário (opcional)
echo "👤 Criar superusuário? (s/n)"
read -t 10 create_superuser || create_superuser="n"
if [ "$create_superuser" = "s" ] || [ "$create_superuser" = "S" ]; then
    docker-compose exec web python manage.py createsuperuser
fi

# Verificar logs
echo "📋 Verificando logs..."
docker-compose logs --tail=20

echo ""
echo "✅ DEPLOY CONCLUÍDO COM SUCESSO!"
echo ""
echo "🌐 URLs de acesso:"
echo "HTTP:  http://147.79.111.118"
echo "HTTPS: https://147.79.111.118"
echo ""
echo "🔧 Comandos úteis:"
echo "Ver logs: docker-compose logs -f"
echo "Reiniciar: docker-compose restart"
echo "Parar: docker-compose down"
echo "Backup: docker-compose exec web python manage.py dumpdata > backup.json"
echo ""
echo "⚠️  IMPORTANTE: O certificado SSL é auto-assinado. Para produção, use um certificado válido."
EOF

# Limpar arquivo temporário local
rm -f spy-django.tar.gz

echo -e "${GREEN}🎉 DEPLOY CONCLUÍDO!${NC}"
echo -e "${GREEN}🌐 Acesse: https://147.79.111.118${NC}"
