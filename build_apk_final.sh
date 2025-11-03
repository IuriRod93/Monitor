#!/bin/bash

# Script FINAL para gerar APK na VPS Ubuntu
# Versão simplificada e robusta
# Execute: bash build_apk_final.sh

echo "🚀 GERADOR FINAL DE APK - VPS UBUNTU"
echo "===================================="

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Função para executar comandos
run_cmd() {
    echo -e "${YELLOW}Executando: $1${NC}"
    if eval "$1"; then
        echo -e "${GREEN}✅ Sucesso${NC}"
        return 0
    else
        echo -e "${RED}❌ Falhou: $1${NC}"
        return 1
    fi
}

# Verificar se estamos na pasta correta
if [ ! -d "Spy-mobile" ]; then
    echo -e "${RED}❌ Execute na pasta raiz do projeto!${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Pasta do projeto encontrada${NC}"

# Instalar Python 3.9 se necessário
echo -e "${YELLOW}🐍 Verificando Python...${NC}"
if ! command -v python3.9 &> /dev/null; then
    echo "Instalando Python 3.9..."
    run_cmd "apt update -y"
    run_cmd "apt install -y software-properties-common"
    run_cmd "add-apt-repository ppa:deadsnakes/ppa -y"
    run_cmd "apt update"
    run_cmd "apt install -y python3.9 python3.9-venv python3.9-dev"
    run_cmd "update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1"
fi

# Criar ambiente virtual limpo
echo -e "${YELLOW}🔧 Criando ambiente virtual...${NC}"
run_cmd "rm -rf ~/apk_build_env"
run_cmd "python3 -m venv ~/apk_build_env"
source ~/apk_build_env/bin/activate

# Instalar dependências
echo -e "${YELLOW}📦 Instalando dependências...${NC}"
run_cmd "pip install --upgrade pip setuptools wheel"
run_cmd "pip install buildozer==1.5.0 kivy==2.1.0 cython==0.29.36 requests plyer"

# Instalar Java 8
echo -e "${YELLOW}☕ Instalando Java 8...${NC}"
run_cmd "apt install -y openjdk-8-jdk"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Configurar Android SDK
echo -e "${YELLOW}📱 Configurando Android SDK...${NC}"
export ANDROID_HOME=~/android-sdk
export ANDROID_SDK_ROOT=~/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# Baixar SDK se necessário
if [ ! -d "$ANDROID_HOME" ]; then
    echo "📥 Baixando Android SDK..."
    run_cmd "mkdir -p $ANDROID_HOME/cmdline-tools/latest"
    cd $ANDROID_HOME
    run_cmd "wget -q https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip"
    run_cmd "unzip -q commandlinetools-linux-8512546_latest.zip"
    run_cmd "cp -r cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true"
    run_cmd "rm -f commandlinetools-linux-8512546_latest.zip"
    cd -
fi

# Aceitar licenças
echo -e "${YELLOW}📋 Aceitando licenças...${NC}"
run_cmd "yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses >/dev/null 2>&1 || true"

# Instalar componentes
echo -e "${YELLOW}📦 Instalando componentes Android...${NC}"
run_cmd "$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager 'platform-tools' 'platforms;android-30' 'build-tools;30.0.3' >/dev/null 2>&1 || true"

# Entrar na pasta do app
cd Spy-mobile

# Limpar builds anteriores
echo -e "${YELLOW}🧹 Limpando builds anteriores...${NC}"
run_cmd "rm -rf .buildozer bin"

# Modificar buildozer.spec para compatibilidade
echo -e "${YELLOW}⚙️ Ajustando configurações...${NC}"
sed -i 's/requirements = python3,kivy==2.1.0,requests,plyer/requirements = python3,kivy==2.1.0,requests,plyer/' buildozer.spec

# Build APK
echo -e "${GREEN}🔥 GERANDO APK...${NC}"
echo -e "${YELLOW}⏰ Este processo pode levar 20-40 minutos...${NC}"
echo -e "${YELLOW}☕ Vá tomar um café!${NC}"

if run_cmd "buildozer android debug"; then
    # Verificar APK
    if [ -f "bin/*.apk" ]; then
        run_cmd "cp bin/*.apk ../spy-mobile.apk"
        echo -e "${GREEN}🎉 APK GERADO COM SUCESSO!${NC}"
        echo -e "${GREEN}📱 Localização: $(pwd)/../spy-mobile.apk${NC}"
        echo -e "${GREEN}✅ PROCESSO CONCLUÍDO!${NC}"
        exit 0
    else
        echo -e "${RED}❌ APK não encontrado${NC}"
        exit 1
    fi
else
    echo -e "${RED}❌ Falha na geração do APK${NC}"
    exit 1
fi
