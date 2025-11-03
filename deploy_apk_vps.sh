#!/bin/bash

# 📱 SCRIPT AUTOMÁTICO PARA GERAR APK NA VPS
# Execute: bash deploy_apk_vps.sh

# Configurações
VPS_HOST='147.79.111.118'
VPS_USER='root'
PROJECT_DIR='/opt/spy-monitor/Monitoramento/Spy-mobile'

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}🚀 INICIANDO DEPLOY DO APK PARA VPS${NC}"
echo -e "${YELLOW}VPS: $VPS_HOST${NC}"
echo -e "${YELLOW}Usuário: $VPS_USER${NC}"
echo ""

# Verificar se arquivos existem
if [ ! -d "Spy-mobile" ]; then
    echo -e "${RED}❌ Diretório Spy-mobile não encontrado!${NC}"
    exit 1
fi

# Compactar projeto
echo -e "${YELLOW}📦 Compactando projeto Spy-mobile...${NC}"
tar -czf spy-mobile.tar.gz Spy-mobile/

# Upload para VPS
echo -e "${YELLOW}📤 Enviando para VPS...${NC}"
scp spy-mobile.tar.gz $VPS_USER@$VPS_HOST:/tmp/

# Executar setup na VPS
echo -e "${YELLOW}🔧 Executando setup na VPS...${NC}"
ssh $VPS_USER@$VPS_HOST 'bash -s' << 'EOF'
# Script remoto
cd /tmp
tar -xzf spy-mobile.tar.gz
mv Spy-mobile /opt/spy-monitor/Monitoramento/Spy-mobile 2>/dev/null || mkdir -p /opt/spy-monitor/Monitoramento/Spy-mobile && mv Spy-mobile/* /opt/spy-monitor/Monitoramento/Spy-mobile/
cd /opt/spy-monitor/Monitoramento/Spy-mobile

# Instalar dependências
apt update -qq
apt install -y python3-pip openjdk-8-jdk git unzip wget build-essential
pip3 install buildozer kivy[base] cython requests plyer

# Configurar Android SDK
mkdir -p ~/android-sdk/cmdline-tools
cd ~/android-sdk/cmdline-tools
wget -q https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
unzip -q commandlinetools-linux-8512546_latest.zip
mv cmdline-tools/* latest/ 2>/dev/null || true
rm commandlinetools-linux-8512546_latest.zip

# Configurar ambiente
export ANDROID_HOME=~/android-sdk
export ANDROID_SDK_ROOT=~/android-sdk
export PATH=$PATH:~/android-sdk/cmdline-tools/latest/bin
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Aceitar licenças
yes | sdkmanager --licenses

# Instalar componentes
sdkmanager "platform-tools" "platforms;android-30" "build-tools;30.0.3"

# Gerar APK
cd /opt/spy-monitor/Monitoramento/Spy-mobile
echo "🔥 Iniciando build do APK..."
buildozer android debug

# Verificar resultado
if [ -f bin/*.apk ]; then
    echo "✅ APK gerado com sucesso!"
    ls -la bin/
else
    echo "❌ Erro na geração do APK"
    exit 1
fi
EOF

# Baixar APK
echo -e "${YELLOW}📥 Baixando APK gerado...${NC}"
scp $VPS_USER@$VPS_HOST:/opt/spy-monitor/Monitoramento/Spy-mobile/bin/*.apk ./SpyMobile.apk 2>/dev/null || echo "APK não encontrado"

# Limpar arquivos temporários
rm -f spy-mobile.tar.gz
ssh $VPS_USER@$VPS_HOST 'rm -f /tmp/spy-mobile.tar.gz'

echo -e "${GREEN}🎉 PROCESSO CONCLUÍDO!${NC}"
if [ -f SpyMobile.apk ]; then
    echo -e "${GREEN}📱 APK baixado: $(pwd)/SpyMobile.apk${NC}"
else
    echo -e "${RED}❌ APK não foi baixado${NC}"
fi
