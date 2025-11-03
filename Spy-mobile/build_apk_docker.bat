@echo off
echo ========================================
echo Gerando APK usando Docker
echo ========================================

echo.
echo Verificando se Docker esta instalado...
docker --version
if %errorlevel% neq 0 (
    echo Docker nao encontrado!
    echo Instale o Docker Desktop para Windows primeiro.
    echo Download: https://www.docker.com/products/docker-desktop
    pause
    exit /b 1
)

echo.
echo Construindo imagem Docker...
docker build -t spy-mobile-builder .

echo.
echo Executando build do APK...
echo ATENCAO: Este processo pode demorar 30-60 minutos na primeira vez
docker run --rm -v "%cd%":/app spy-mobile-builder

echo.
echo ========================================
echo Build concluido!
echo ========================================
echo.
echo O APK foi gerado na pasta bin/
dir bin\*.apk
echo.
pause