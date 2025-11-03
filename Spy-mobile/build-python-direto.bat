@echo off
echo ========================================
echo    IROD SPY - BUILD PYTHON DIRETO
echo ========================================
echo.

cd /d "C:\Users\Iuri\Desktop\Projetos\Monitoramento\Spy-mobile"

echo [1/5] Instalando buildozer...
pip install --upgrade buildozer cython

echo.
echo [2/5] Instalando dependencias Kivy...
pip install kivy kivymd plyer requests pillow

echo.
echo [3/5] Limpando builds anteriores...
if exist ".buildozer" rmdir /s /q ".buildozer"
if exist "bin" rmdir /s /q "bin"

echo.
echo [4/5] Inicializando buildozer...
buildozer init

echo.
echo [5/5] Tentando build local...
echo AVISO: Build nativo no Windows tem limitacoes
echo Recomendamos usar Linux/WSL ou servico online
echo.
buildozer android debug --spec buildozer-social.spec

if exist "bin\*.apk" (
    echo ✅ APK GERADO!
    dir bin\*.apk
) else (
    echo ❌ Build falhou - use alternativa online
    echo.
    echo ALTERNATIVAS:
    echo 1. Google Colab (online)
    echo 2. GitHub Actions
    echo 3. WSL Ubuntu
)

pause