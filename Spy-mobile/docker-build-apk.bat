@echo off
echo ========================================
echo    DOCKER BUILD APK - IROD SPY
echo ========================================
echo.

cd /d "C:\Users\Iuri\Desktop\Projetos\Monitoramento\Spy-mobile"

echo Verificando Docker...
docker --version
if errorlevel 1 (
    echo ERRO: Docker nao esta funcionando
    echo 1. Abra Docker Desktop manualmente
    echo 2. Aguarde inicializar completamente
    echo 3. Execute este script novamente
    pause
    exit /b 1
)

echo.
echo Limpando builds anteriores...
if exist "bin" rmdir /s /q "bin"
docker system prune -f

echo.
echo Construindo imagem Docker...
docker build -t irod-spy .

echo.
echo Gerando APK (15-30 minutos)...
docker run --rm -v "%CD%":/app irod-spy

echo.
echo Verificando resultado...
if exist "bin\*.apk" (
    echo.
    echo ========================================
    echo    APK GERADO COM SUCESSO!
    echo ========================================
    dir bin\*.apk
    echo.
    echo Para instalar: adb install bin\nome-arquivo.apk
) else (
    echo.
    echo ========================================
    echo    ERRO NO BUILD
    echo ========================================
    echo Verifique se Docker Desktop esta funcionando
)

pause