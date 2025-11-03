@echo off
echo ========================================
echo Configurando ambiente para build APK
echo ========================================

echo.
echo 1. Instalando dependencias Python...
pip install buildozer cython

echo.
echo 2. Verificando se WSL esta instalado...
wsl --version
if %errorlevel% neq 0 (
    echo WSL nao encontrado. Instalando WSL...
    wsl --install -d Ubuntu
    echo.
    echo IMPORTANTE: Reinicie o computador apos a instalacao do WSL
    echo Depois execute este script novamente.
    pause
    exit /b 1
)

echo.
echo 3. Configurando WSL para build...
wsl sudo apt update
wsl sudo apt install -y python3-pip python3-venv git zip unzip openjdk-8-jdk autoconf libtool pkg-config zlib1g-dev libncurses5-dev libncursesw5-dev libtinfo5 cmake libffi-dev libssl-dev

echo.
echo 4. Instalando buildozer no WSL...
wsl pip3 install --user buildozer cython

echo.
echo 5. Configurando variaveis de ambiente...
wsl echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
wsl echo 'export ANDROIDAPI=30' >> ~/.bashrc
wsl echo 'export NDKAPI=21' >> ~/.bashrc

echo.
echo ========================================
echo Configuracao concluida!
echo ========================================
echo.
echo Para gerar o APK, execute:
echo build_apk.bat
echo.
pause