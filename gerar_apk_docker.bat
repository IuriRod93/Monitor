@echo off
echo 🚀 GERANDO APK COM DOCKER
echo ========================

echo.
echo 📦 PASSO 1: Construindo imagem Docker...
docker build -t spy-mobile-builder .

if %errorlevel% neq 0 (
    echo ❌ Erro ao construir imagem Docker
    pause
    exit /b 1
)

echo.
echo 🔥 PASSO 2: Gerando APK (aguarde 20-30 minutos)...
docker run --rm -v "%cd%\output:/app/output" spy-mobile-builder

if %errorlevel% neq 0 (
    echo ❌ Erro na geração do APK
    pause
    exit /b 1
)

echo.
echo 🎉 APK GERADO COM SUCESSO!
echo 📁 Localização: %cd%\output\SpyMobile.apk

if exist "%cd%\output\SpyMobile.apk" (
    echo ✅ APK encontrado!
    dir "%cd%\output\SpyMobile.apk"
) else (
    echo ❌ APK não encontrado na pasta output
)

echo.
echo 📱 PRÓXIMOS PASSOS:
echo 1. Transfira o APK para seu Android
echo 2. Habilite "Fontes desconhecidas"
echo 3. Instale o APK normalmente

pause