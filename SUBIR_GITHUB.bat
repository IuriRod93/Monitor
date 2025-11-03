@echo off
echo 🚀 SUBINDO ARQUIVOS ESSENCIAIS PARA GITHUB
echo ==========================================

echo 📁 Configurando repositório...
git init
git remote remove origin 2>nul
git remote add origin https://github.com/IuriRod93/spy-mobile-apk.git

echo 📦 Adicionando arquivos essenciais...
git add main.py
git add buildozer.spec
git add Dockerfile.codespaces
git add build-apk.sh
git add devcontainer.json
git add docker-compose.yml
git add requirements.txt
git add README_GITHUB.md

echo 💾 Fazendo commit...
git commit -m "🚀 APK Builder - Codespaces + Docker ready"

echo 📤 Enviando para GitHub...
git branch -M main
git push -u origin main --force

echo.
echo ✅ CONCLUÍDO!
echo 🔗 https://github.com/IuriRod93/spy-mobile-apk
echo.
echo 📋 PRÓXIMOS PASSOS:
echo 1. Acesse o repositório
echo 2. Code → Codespaces → Create codespace
echo 3. Execute: build-apk
echo 4. Aguarde 25 minutos
echo 5. Baixe APK da pasta bin/
echo.
pause