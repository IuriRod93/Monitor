#!/bin/bash

echo "🐳 CONSTRUINDO APK VIA DOCKER"
echo "============================="

# Verificar se Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "❌ Docker não está instalado. Instalando..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker $USER
    echo "✅ Docker instalado. Faça logout e login novamente, depois execute o script novamente."
    exit 1
fi

# Construir imagem Docker
echo "🏗️ Construindo imagem Docker..."
docker build -t spy-mobile-builder .

# Executar build do APK
echo "🔥 Gerando APK..."
docker run --rm -v $(pwd):/app spy-mobile-builder

# Verificar se APK foi gerado
if [ -f "bin/*.apk" ]; then
    echo "✅ APK GERADO COM SUCESSO!"
    ls -la bin/
    echo ""
    echo "📱 APK localizado em: $(pwd)/bin/"
else
    echo "❌ FALHA NA GERAÇÃO DO APK"
    echo "Verifique os logs do Docker acima"
fi

echo "🎉 PROCESSO CONCLUÍDO!"
