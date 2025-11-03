@echo off
echo ========================================
echo    IROD SPY - BUILD APK COM DOCKER
echo ========================================
echo.

:: Verificar se Docker está instalado
docker --version >nul 2>&1
if errorlevel 1 (
    echo ERRO: Docker nao encontrado!
    echo Instale Docker Desktop primeiro
    echo https://www.docker.com/products/docker-desktop
    pause
    exit /b 1
)

:: Navegar para diretório do projeto
cd /d "%~dp0"
echo Diretorio: %CD%

:: Limpar containers anteriores
echo.
echo [1/4] Limpando containers anteriores...
docker container prune -f
docker image prune -f

:: Construir imagem Docker
echo.
echo [2/4] Construindo imagem Docker...
docker build -t irod-spy-builder .

:: Executar build do APK
echo.
echo [3/4] Gerando APK (pode demorar 15-30 min)...
docker run --rm -v "%CD%":/app irod-spy-builder

:: Verificar resultado
echo.
echo [4/4] Verificando resultado...
if exist "bin\*.apk" (
    echo.
    echo ========================================
    echo    APK GERADO COM SUCESSO!
    echo ========================================
    echo.
    dir bin\*.apk
    echo.
    echo Para instalar: adb install bin\nome-arquivo.apk
) else (
    echo.
    echo ERRO: APK nao foi gerado
    echo Verifique os logs do Docker
)

pause