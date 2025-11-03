@echo off
echo 🚀 SUBINDO ARQUIVOS PARA GITHUB
echo ===============================

echo 📁 Inicializando repositório...
git init
git remote add origin https://github.com/IuriRod93/spy-mobile-apk.git

echo 📦 Adicionando arquivos principais...
git add main.py
git add buildozer.spec
git add Dockerfile.codespaces
git add build-apk.sh
git add devcontainer.json
git add docker-compose.yml
git add requirements.txt
git add README_GITHUB.md
git add build-apk.yml

echo 💾 Fazendo commit...
git commit -m "🚀 Setup completo para gerar APK no Codespaces"

echo 📤 Enviando para GitHub...
git branch -M main
git push -u origin main

echo ✅ CONCLUÍDO! Acesse: https://github.com/IuriRod93/spy-mobile-apk
pause