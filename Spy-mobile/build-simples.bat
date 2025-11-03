@echo off
echo ========================================
echo    IROD SPY - BUILD APK SIMPLES
echo ========================================
echo.

cd /d "C:\Users\Iuri\Desktop\Projetos\Monitoramento\Spy-mobile"

echo [1/3] Limpando builds anteriores...
if exist ".buildozer" rmdir /s /q ".buildozer"
if exist "bin" rmdir /s /q "bin"

echo.
echo [2/3] Construindo com Docker...
docker build -t irod-spy .

echo.
echo [3/3] Gerando APK...
docker run --rm -v "%CD%":/app -w /app irod-spy

echo.
if exist "bin\*.apk" (
    echo ✅ APK GERADO COM SUCESSO!
    dir bin\*.apk
) else (
    echo ❌ Erro ao gerar APK
)

pause