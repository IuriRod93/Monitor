#!/bin/bash
set -e

echo "🚀 INICIANDO GERAÇÃO DE APK NO DOCKER"
echo "====================================="

# Verificar se arquivos existem
if [ ! -f "main.py" ]; then
    echo "❌ Arquivo main.py não encontrado!"
    exit 1
fi

if [ ! -f "buildozer.spec" ]; then
    echo "❌ Arquivo buildozer.spec não encontrado!"
    exit 1
fi

# Configurar variáveis de ambiente
export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_NDK_HOME=/opt/android-ndk-r25b
export NDK_HOME=/opt/android-ndk-r25b
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:/opt/android-sdk/cmdline-tools/latest/bin:/opt/android-sdk/platform-tools

echo "✅ Ambiente configurado"
echo "📱 Iniciando build do APK..."

# Gerar APK
buildozer android debug

# Verificar se APK foi gerado
if [ -f "bin/*.apk" ]; then
    echo "🎉 APK gerado com sucesso!"
    ls -la bin/
    
    # Copiar APK para pasta de saída
    mkdir -p /app/output
    cp bin/*.apk /app/output/SpyMobile.apk
    
    echo "✅ APK copiado para /app/output/SpyMobile.apk"
else
    echo "❌ Erro: APK não foi gerado"
    exit 1
fi

echo "🎯 Processo concluído!"