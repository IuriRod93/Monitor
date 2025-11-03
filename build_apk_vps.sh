#!/bin/bash

# Script para gerar APK na VPS Ubuntu
# Execute: bash build_apk_vps.sh

echo "🚀 GERANDO APK NA VPS UBUNTU"
echo "============================"

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Verificar se estamos na pasta correta
if [ ! -f "Spy-mobile/main.py" ]; then
    echo -e "${RED}❌ Erro: Execute este script da pasta raiz do projeto (onde está Spy-mobile/)${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Pasta do projeto encontrada${NC}"

# Instalar dependências do sistema
echo -e "${YELLOW}📦 Instalando dependências do sistema...${NC}"
sudo apt update -qq
sudo apt install -y python3 python3-pip python3-setuptools openjdk-8-jdk git unzip wget build-essential ccache

# Instalar Python 3.9 (mais compatível)
echo -e "${YELLOW}🐍 Instalando Python 3.9...${NC}"
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install -y python3.9 python3.9-dev python3.9-venv
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1

# Criar ambiente virtual
echo -e "${YELLOW}🔧 Criando ambiente virtual...${NC}"
python3 -m venv ~/apk_env
source ~/apk_env/bin/activate

# Instalar buildozer e dependências
echo -e "${YELLOW}📦 Instalando buildozer e dependências...${NC}"
pip install --upgrade pip setuptools wheel
pip install buildozer kivy==2.1.0 cython requests plyer

# Configurar Android SDK
echo -e "${YELLOW}📱 Configurando Android SDK...${NC}"
export ANDROID_HOME=~/android-sdk
export ANDROID_SDK_ROOT=~/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# Baixar Android SDK se não existir
if [ ! -d "$ANDROID_HOME" ]; then
    echo -e "${YELLOW}📥 Baixando Android SDK...${NC}"
    mkdir -p $ANDROID_HOME/cmdline-tools/latest
    cd $ANDROID_HOME
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
    unzip -q commandlinetools-linux-8512546_latest.zip
    cp -r cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true
    rm -f commandlinetools-linux-8512546_latest.zip
fi

# Aceitar licenças
echo -e "${YELLOW}📋 Aceitando licenças Android...${NC}"
yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses >/dev/null 2>&1 || true

# Instalar componentes Android
echo -e "${YELLOW}📦 Instalando componentes Android...${NC}"
$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "platform-tools" "platforms;android-30" "build-tools;30.0.3" >/dev/null 2>&1 || true

# Configurar Java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Entrar na pasta do app
cd Spy-mobile

# Limpar builds anteriores
echo -e "${YELLOW}🧹 Limpando builds anteriores...${NC}"
rm -rf .buildozer bin

# Gerar APK
echo -e "${GREEN}🔥 GERANDO APK...${NC}"
echo -e "${YELLOW}⏰ Este processo pode levar 15-30 minutos...${NC}"
echo -e "${YELLOW}☕ Vá tomar um café!${NC}"

# Executar buildozer
buildozer android debug

# Verificar se APK foi gerado
if [ -f "bin/*.apk" ]; then
    echo -e "${GREEN}🎉 APK GERADO COM SUCESSO!${NC}"
    ls -la bin/
    echo -e "${GREEN}📱 APK localizado em: $(pwd)/bin/${NC}"

    # Copiar para pasta raiz
    cp bin/*.apk ../spy-mobile.apk
    echo -e "${GREEN}📋 APK copiado para: $(pwd)/../spy-mobile.apk${NC}"
else
    echo -e "${RED}❌ ERRO: APK não foi gerado${NC}"
    echo -e "${YELLOW}Verifique os logs acima para detalhes${NC}"
    exit 1
fi

echo -e "${GREEN}✅ PROCESSO CONCLUÍDO!${NC}"
echo -e "${GREEN}📱 APK pronto para download: spy-mobile.apk${NC}"
