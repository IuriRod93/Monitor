@echo off
echo ========================================
echo   CORRIGIR DOCKER E GERAR APK
echo ========================================
echo.

cd /d "C:\Users\Iuri\Desktop\Projetos\Monitoramento\Spy-mobile"

echo [1/5] Parando Docker Desktop...
taskkill /f /im "Docker Desktop.exe" 2>nul
timeout /t 5

echo.
echo [2/5] Iniciando Docker Desktop...
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
echo Aguardando Docker inicializar...
timeout /t 30

echo.
echo [3/5] Testando Docker...
docker --version
if errorlevel 1 (
    echo ERRO: Docker nao iniciou corretamente
    echo Tente reiniciar manualmente o Docker Desktop
    pause
    exit /b 1
)

echo.
echo [4/5] Limpando containers antigos...
docker system prune -f

echo.
echo [5/5] Construindo APK com Docker...
docker build -t irod-spy-builder .
docker run --rm -v "%CD%":/app -w /app irod-spy-builder

echo.
if exist "bin\*.apk" (
    echo APK GERADO COM SUCESSO!
    dir bin\*.apk
) else (
    echo Falha no build - verifique logs
)

pause