#!/bin/bash
echo "🚀 GERANDO APK NO GITHUB CODESPACES"
echo "==================================="

# Verificar se estamos no Codespaces
if [ -z "$CODESPACES" ]; then
    echo "⚠️  Este script é para GitHub Codespaces"
    echo "Execute em: https://github.com/codespaces"
    exit 1
fi

echo "✅ Executando no GitHub Codespaces"
echo "📁 Workspace: $GITHUB_WORKSPACE"

# Instalar dependências do sistema
echo "📦 Instalando dependências do sistema..."
sudo apt update -qq
sudo apt install -y openjdk-8-jdk unzip wget git build-essential libffi-dev libssl-dev

# Instalar dependências Python
echo "🐍 Instalando dependências Python..."
pip3 install --user buildozer==1.4.0 kivy==2.1.0 requests cython==0.29.33

# Configurar Java
echo "☕ Configurando Java..."
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.bashrc

# Criar diretório Android SDK
echo "📱 Baixando Android SDK..."
mkdir -p ~/android-sdk
cd ~/android-sdk

# Baixar Android SDK Command Line Tools
wget -q https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
unzip -q commandlinetools-linux-8512546_latest.zip
mkdir -p cmdline-tools/latest
mv cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true
rm commandlinetools-linux-8512546_latest.zip

# Configurar variáveis de ambiente
echo "⚙️ Configurando variáveis de ambiente..."
export ANDROID_HOME=~/android-sdk
export ANDROID_SDK_ROOT=~/android-sdk
export PATH=$PATH:~/android-sdk/cmdline-tools/latest/bin:~/android-sdk/platform-tools

# Adicionar ao bashrc
echo "export ANDROID_HOME=~/android-sdk" >> ~/.bashrc
echo "export ANDROID_SDK_ROOT=~/android-sdk" >> ~/.bashrc
echo "export PATH=\$PATH:~/android-sdk/cmdline-tools/latest/bin:~/android-sdk/platform-tools" >> ~/.bashrc

# Aceitar licenças do Android SDK
echo "📋 Aceitando licenças do Android SDK..."
yes | sdkmanager --licenses

# Instalar componentes necessários
echo "🔧 Instalando componentes do Android SDK..."
sdkmanager "platforms;android-30" "build-tools;30.0.3" "platform-tools"

# Voltar para o diretório do projeto
cd /workspaces/*/

# Verificar se arquivos necessários existem
if [ ! -f "main.py" ]; then
    echo "❌ Arquivo main.py não encontrado!"
    echo "Certifique-se de ter feito upload dos arquivos para o repositório"
    exit 1
fi

if [ ! -f "buildozer.spec" ]; then
    echo "❌ Arquivo buildozer.spec não encontrado!"
    echo "Certifique-se de ter feito upload dos arquivos para o repositório"
    exit 1
fi

echo "✅ Arquivos encontrados!"

# Mostrar informações do ambiente
echo "📊 Informações do ambiente:"
echo "Java: $(java -version 2>&1 | head -n 1)"
echo "Python: $(python3 --version)"
echo "Buildozer: $(buildozer --version)"
echo "Espaço em disco: $(df -h . | tail -n 1)"

# Gerar APK
echo ""
echo "🔥 INICIANDO GERAÇÃO DO APK..."
echo "⏰ Tempo estimado: 20-25 minutos"
echo "☕ Vá tomar um café e aguarde..."
echo ""

# Executar buildozer
buildozer android debug

# Verificar se APK foi gerado
echo ""
echo "🔍 Verificando resultado..."

if ls bin/*.apk 1> /dev/null 2>&1; then
    echo "🎉 APK GERADO COM SUCESSO!"
    echo ""
    echo "📱 Informações do APK:"
    ls -lh bin/*.apk
    echo ""
    echo "📋 COMO BAIXAR:"
    echo "1. Clique na pasta 'bin' no explorador de arquivos"
    echo "2. Clique no arquivo .apk"
    echo "3. Clique em 'Download' no menu"
    echo ""
    echo "📱 INSTALAÇÃO:"
    echo "1. Transfira o APK para seu Android"
    echo "2. Habilite 'Fontes desconhecidas' nas configurações"
    echo "3. Instale o APK normalmente"
    echo ""
    echo "✅ PROCESSO CONCLUÍDO COM SUCESSO!"
else
    echo "❌ ERRO: APK não foi gerado"
    echo ""
    echo "🔧 POSSÍVEIS SOLUÇÕES:"
    echo "1. Execute: buildozer android clean"
    echo "2. Execute: buildozer android debug --verbose"
    echo "3. Verifique os logs acima para erros específicos"
    echo ""
    echo "📋 LOGS DETALHADOS:"
    echo "Verifique o arquivo .buildozer/android/platform/build-*/build.log"
fi

echo ""
echo "🎯 Script finalizado!"
echo "💻 GitHub Codespaces - Ambiente de desenvolvimento na nuvem"