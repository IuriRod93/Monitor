#!/bin/bash

# 🚀 SCRIPT DE CONFIGURAÇÃO DO SERVIDOR DJANGO NA VPS
# Execute como root: chmod +x setup_vps.sh && ./setup_vps.sh

set -e

echo "🚀 CONFIGURANDO SERVIDOR DJANGO NA VPS..."
echo "=========================================="

# Atualizar sistema
echo "📦 Atualizando sistema..."
apt update && apt upgrade -y

# Instalar Docker e Docker Compose
echo "🐳 Instalando Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
rm get-docker.sh

# Instalar Docker Compose
echo "📋 Instalando Docker Compose..."
curl -L "https://github.com/docker/compose/releases/download/v2.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Criar diretório do projeto
echo "📁 Criando diretório do projeto..."
mkdir -p /opt/spy-monitor
cd /opt/spy-monitor

# Criar certificado SSL auto-assinado
echo "🔒 Criando certificado SSL..."
mkdir -p ssl
openssl req -x509 -newkey rsa:4096 -keyout ssl/key.pem -out ssl/cert.pem -days 365 -nodes -subj "/C=BR/ST=SP/L=SaoPaulo/O=SpyMonitor/CN=147.79.111.118"

# Configurar firewall
echo "🔥 Configurando firewall..."
ufw allow ssh
ufw allow 80
ufw allow 443
ufw --force enable

echo "✅ Configuração básica concluída!"
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo "1. Faça upload do projeto Django para /opt/spy-monitor/"
echo "2. Execute: docker-compose up -d"
echo "3. Acesse: https://147.79.111.118"
echo ""
echo "🔧 Comandos úteis:"
echo "- Ver logs: docker-compose logs -f"
echo "- Reiniciar: docker-compose restart"
echo "- Parar: docker-compose down"
