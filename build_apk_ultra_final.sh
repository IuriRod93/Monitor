#!/bin/bash

# Script ULTRA FINAL - Versão mais simples possível
# Execute: bash build_apk_ultra_final.sh

echo "🚀 SCRIPT ULTRA FINAL - APK SIMPLIFICADO"
echo "========================================"

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
run_cmd "rm -rf ~/apk_env"
run_cmd "python3 -m venv ~/apk_env"
source ~/apk_env/bin/activate

# Instalar dependências com versões mais antigas
echo -e "${YELLOW}📦 Instalando dependências...${NC}"
run_cmd "pip install --upgrade pip==21.3.1 setuptools==58.0.4 wheel==0.37.1"
run_cmd "pip install buildozer==1.4.0 kivy==2.0.0 cython==0.29.24 requests plyer"

# Verificar se buildozer foi instalado corretamente
if ! command -v buildozer &> /dev/null; then
    echo -e "${RED}❌ Buildozer não encontrado, tentando instalar novamente...${NC}"
    run_cmd "pip install --force-reinstall buildozer==1.4.0"
fi

# Instalar Java 8
echo -e "${YELLOW}☕ Instalando Java 8...${NC}"
run_cmd "apt install -y openjdk-8-jdk"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Configurar Android SDK com versões mais antigas
echo -e "${YELLOW}📱 Configurando Android SDK...${NC}"
export ANDROID_HOME=~/android-sdk-old
export ANDROID_SDK_ROOT=~/android-sdk-old
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# Baixar SDK antigo se necessário
if [ ! -d "$ANDROID_HOME" ]; then
    echo "📥 Baixando Android SDK antigo..."
    run_cmd "mkdir -p $ANDROID_HOME/cmdline-tools/latest"
    cd $ANDROID_HOME
    # SDK mais antigo e compatível
    run_cmd "wget -q https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip"
    run_cmd "unzip -q commandlinetools-linux-6609375_latest.zip"
    run_cmd "cp -r cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true"
    run_cmd "rm -f commandlinetools-linux-6609375_latest.zip"
    cd -
fi

# Aceitar licenças
echo -e "${YELLOW}📋 Aceitando licenças...${NC}"
run_cmd "yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses >/dev/null 2>&1 || true"

# Instalar componentes antigos
echo -e "${YELLOW}📦 Instalando componentes Android antigos...${NC}"
run_cmd "$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager 'platform-tools' 'platforms;android-29' 'build-tools;29.0.3' >/dev/null 2>&1 || true"

# Entrar na pasta do app
cd Spy-mobile

# Limpar builds anteriores
echo -e "${YELLOW}🧹 Limpando builds anteriores...${NC}"
run_cmd "rm -rf .buildozer bin"

# Modificar buildozer.spec para versões antigas
echo -e "${YELLOW}⚙️ Ajustando configurações...${NC}"
sed -i 's/requirements = python3,kivy==2.1.0,requests,plyer/requirements = python3,kivy==2.0.0,requests,plyer/' buildozer.spec
sed -i 's/android.ndk = 23b/android.ndk = 21b/' buildozer.spec
sed -i 's/android.sdk = 29/android.sdk = 28/' buildozer.spec

# Build APK com configurações mais simples
echo -e "${GREEN}🔥 GERANDO APK SIMPLIFICADO...${NC}"
echo -e "${YELLOW}⏰ Este processo pode levar 15-25 minutos...${NC}"
echo -e "${YELLOW}☕ Vá tomar um café!${NC}"

# Tentar build com configurações mínimas
if run_cmd "buildozer android debug --verbose"; then
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
    echo -e "${YELLOW}Tentando abordagem alternativa...${NC}"

    # Tentar com configurações ainda mais simples
    echo -e "${YELLOW}🔄 Tentando com configurações mínimas...${NC}"

    # Modificar spec para configurações mínimas
    sed -i 's/android.archs = arm64-v8a, armeabi-v7a/android.archs = armeabi-v7a/' buildozer.spec
    sed -i 's/android.api = 30/android.api = 28/' buildozer.spec
    sed -i 's/android.minapi = 21/android.minapi = 19/' buildozer.spec

    if run_cmd "buildozer android debug"; then
        if [ -f "bin/*.apk" ]; then
            run_cmd "cp bin/*.apk ../spy-mobile.apk"
            echo -e "${GREEN}🎉 APK GERADO COM SUCESSO (modo compatibilidade)!${NC}"
            echo -e "${GREEN}📱 Localização: $(pwd)/../spy-mobile.apk${NC}"
            echo -e "${GREEN}✅ PROCESSO CONCLUÍDO!${NC}"
            exit 0
        fi
    fi

    echo -e "${RED}❌ Todas as tentativas falharam${NC}"
    exit 1
fi
