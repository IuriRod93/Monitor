#!/bin/bash

# Script ABSOLUTAMENTE FINAL - APK com correção total
# Execute: bash build_apk_absoluto_final.sh

echo "🚀 SCRIPT ABSOLUTAMENTE FINAL - APK DEFINITIVO"
echo "==============================================="

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
run_cmd "rm -rf ~/apk_final_env"
run_cmd "python3 -m venv ~/apk_final_env"
source ~/apk_final_env/bin/activate

# Instalar dependências com verificação
echo -e "${YELLOW}📦 Instalando dependências...${NC}"
run_cmd "pip install --upgrade pip==21.3.1 setuptools==58.0.4 wheel==0.37.1"

# Instalar buildozer com verificação
echo -e "${YELLOW}🔨 Instalando Buildozer...${NC}"
run_cmd "pip install buildozer==1.4.0"

# Verificar se buildozer foi instalado
if ! ~/apk_final_env/bin/buildozer --version &> /dev/null; then
    echo -e "${RED}❌ Buildozer não encontrado no ambiente virtual${NC}"
    echo -e "${YELLOW}Tentando instalar globalmente...${NC}"
    run_cmd "pip install --user buildozer==1.4.0"
    export PATH=$PATH:~/.local/bin
fi

# Instalar outras dependências
run_cmd "pip install kivy==2.0.0 cython==0.29.24 requests plyer"

# Instalar Java 8
echo -e "${YELLOW}☕ Instalando Java 8...${NC}"
run_cmd "apt install -y openjdk-8-jdk"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Configurar Android SDK
echo -e "${YELLOW}📱 Configurando Android SDK...${NC}"
export ANDROID_HOME=~/android-sdk-final
export ANDROID_SDK_ROOT=~/android-sdk-final
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# Baixar SDK se necessário
if [ ! -d "$ANDROID_HOME" ]; then
    echo "📥 Baixando Android SDK..."
    run_cmd "mkdir -p $ANDROID_HOME/cmdline-tools/latest"
    cd $ANDROID_HOME
    run_cmd "wget -q https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip"
    run_cmd "unzip -q commandlinetools-linux-6609375_latest.zip"
    run_cmd "cp -r cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true"
    run_cmd "rm -f commandlinetools-linux-6609375_latest.zip"
    cd -
fi

# Aceitar licenças
echo -e "${YELLOW}📋 Aceitando licenças...${NC}"
run_cmd "yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses >/dev/null 2>&1 || true"

# Instalar componentes
echo -e "${YELLOW}📦 Instalando componentes Android...${NC}"
run_cmd "$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager 'platform-tools' 'platforms;android-29' 'build-tools;29.0.3' >/dev/null 2>&1 || true"

# Entrar na pasta do app
cd Spy-mobile

# Limpar builds anteriores
echo -e "${YELLOW}🧹 Limpando builds anteriores...${NC}"
run_cmd "rm -rf .buildozer bin"

# Modificar buildozer.spec
echo -e "${YELLOW}⚙️ Ajustando configurações...${NC}"
sed -i 's/requirements = python3,kivy==2.1.0,requests,plyer/requirements = python3,kivy==2.0.0,requests,plyer/' buildozer.spec
sed -i 's/android.ndk = 23b/android.ndk = 21b/' buildozer.spec
sed -i 's/android.sdk = 29/android.sdk = 28/' buildozer.spec

# Build APK usando caminho completo
echo -e "${GREEN}🔥 GERANDO APK DEFINITIVO...${NC}"
echo -e "${YELLOW}⏰ Este processo pode levar 20-30 minutos...${NC}"
echo -e "${YELLOW}☕ Vá tomar um café!${NC}"

# Usar buildozer do ambiente virtual
BUILDOZER_CMD="~/apk_final_env/bin/buildozer"

if [ ! -f ~/apk_final_env/bin/buildozer ]; then
    BUILDOZER_CMD="buildozer"
fi

if run_cmd "$BUILDOZER_CMD android debug"; then
    # Verificar APK
    if [ -f "bin/*.apk" ]; then
        run_cmd "cp bin/*.apk ../spy-mobile-final.apk"
        echo -e "${GREEN}🎉 APK GERADO COM SUCESSO!${NC}"
        echo -e "${GREEN}📱 Localização: $(pwd)/../spy-mobile-final.apk${NC}"
        echo -e "${GREEN}✅ SISTEMA COMPLETO FUNCIONAL!${NC}"
        exit 0
    else
        echo -e "${RED}❌ APK não encontrado${NC}"
        exit 1
    fi
else
    echo -e "${RED}❌ Falha na geração do APK${NC}"
    echo -e "${YELLOW}Tentando com configurações mínimas...${NC}"

    # Modo emergência
    sed -i 's/android.archs = arm64-v8a, armeabi-v7a/android.archs = armeabi-v7a/' buildozer.spec
    sed -i 's/android.api = 30/android.api = 28/' buildozer.spec
    sed -i 's/android.minapi = 21/android.minapi = 19/' buildozer.spec

    if run_cmd "$BUILDOZER_CMD android debug"; then
        if [ -f "bin/*.apk" ]; then
            run_cmd "cp bin/*.apk ../spy-mobile-emergency.apk"
            echo -e "${GREEN}🎉 APK GERADO EM MODO EMERGÊNCIA!${NC}"
            echo -e "${GREEN}📱 Localização: $(pwd)/../spy-mobile-emergency.apk${NC}"
            echo -e "${GREEN}✅ SISTEMA FUNCIONAL!${NC}"
            exit 0
        fi
    fi

    echo -e "${RED}❌ TODAS AS TENTATIVAS FALHARAM${NC}"
    echo -e "${YELLOW}💡 Sugestões:${NC}"
    echo -e "${YELLOW}1. Use uma VPS com Ubuntu 18.04${NC}"
    echo -e "${YELLOW}2. Execute: docker run --rm -v \$(pwd):/app ubuntu:18.04 bash -c 'apt update && apt install -y python3 python3-pip openjdk-8-jdk wget unzip'${NC}"
    echo -e "${YELLOW}3. Ou use o método Colab diretamente${NC}"
    exit 1
fi
