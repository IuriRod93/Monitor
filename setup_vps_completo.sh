#!/bin/bash
# Script completo para configurar VPS e gerar APK

echo "🚀 CONFIGURAÇÃO COMPLETA DA VPS PARA APK"
echo "========================================="

# 1. Atualizar sistema
echo "📦 Atualizando sistema..."
sudo apt update && sudo apt upgrade -y

# 2. Instalar dependências
echo "🔧 Instalando dependências..."
sudo apt install -y python3 python3-pip python3-venv openjdk-8-jdk git unzip wget build-essential python3-setuptools

# 3. Instalar python3-distutils via pip
echo "📦 Instalando distutils..."
pip3 install setuptools

# 4. Criar ambiente virtual Python
echo "🐍 Criando ambiente virtual..."
cd /opt/spy-monitor/Monitoramento
python3 -m venv venv
source venv/bin/activate

# 5. Instalar distutils no ambiente virtual
echo "📦 Instalando distutils no venv..."
pip install setuptools

# 6. Instalar buildozer e kivy
echo "📦 Instalando buildozer e kivy..."
pip install --upgrade pip
pip install buildozer kivy[base] cython requests plyer

# 7. Configurar Android SDK
echo "🔧 Configurando Android SDK..."
mkdir -p ~/android-sdk/cmdline-tools
cd ~/android-sdk

# 8. Baixar Android SDK
echo "📥 Baixando Android SDK..."
wget -q https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
unzip -o -q commandlinetools-linux-8512546_latest.zip
mv cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true
rm commandlinetools-linux-8512546_latest.zip

# 9. Configurar variáveis de ambiente
echo "⚙️ Configurando variáveis..."
export ANDROID_HOME=~/android-sdk
export ANDROID_SDK_ROOT=~/android-sdk
export PATH=$PATH:~/android-sdk/cmdline-tools/latest/bin
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Salvar variáveis no .bashrc
echo 'export ANDROID_HOME=~/android-sdk' >> ~/.bashrc
echo 'export ANDROID_SDK_ROOT=~/android-sdk' >> ~/.bashrc
echo 'export PATH=$PATH:~/android-sdk/cmdline-tools/latest/bin' >> ~/.bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc

# 10. Aceitar licenças
echo "📋 Aceitando licenças..."
yes | ~/android-sdk/cmdline-tools/latest/bin/sdkmanager --licenses >/dev/null 2>&1

# 11. Instalar componentes Android
echo "📦 Instalando componentes Android..."
~/android-sdk/cmdline-tools/latest/bin/sdkmanager "platform-tools" "platforms;android-30" "build-tools;30.0.3" >/dev/null 2>&1

# 12. Verificar instalação
echo "✅ Verificando instalação..."
~/android-sdk/cmdline-tools/latest/bin/sdkmanager --list_installed

# 13. Ir para diretório do projeto
cd /opt/spy-monitor/Monitoramento/Spy-mobile

# 14. Ativar ambiente virtual
source ../venv/bin/activate

# 15. Gerar APK
echo "🔥 Gerando APK..."
buildozer android debug

# 16. Verificar resultado
if [ -f bin/*.apk ]; then
    echo "✅ APK GERADO COM SUCESSO!"
    ls -la bin/
    echo ""
    echo "📱 APK localizado em: /opt/spy-monitor/Monitoramento/Spy-mobile/bin/"
    echo "📥 Para baixar: scp root@147.79.111.118:/opt/spy-monitor/Monitoramento/Spy-mobile/bin/*.apk ./"
else
    echo "❌ FALHA NA GERAÇÃO DO APK"
    echo "Verifique os logs em .buildozer/android/platform/build/build.log"
fi

echo "🎉 CONFIGURAÇÃO CONCLUÍDA!"
