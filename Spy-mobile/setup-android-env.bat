@echo off
echo ========================================
echo   CONFIGURAR AMBIENTE ANDROID - WINDOWS
echo ========================================
echo.

:: Criar diretórios necessários
echo [1/6] Criando diretorios...
if not exist "C:\android-dev" mkdir "C:\android-dev"
cd /d "C:\android-dev"

:: Baixar Android SDK Command Line Tools
echo.
echo [2/6] Baixando Android SDK...
echo Baixe manualmente de: https://developer.android.com/studio#command-tools
echo Extraia em: C:\android-dev\cmdline-tools\latest\
echo.
pause

:: Configurar variáveis de ambiente
echo.
echo [3/6] Configurando variaveis de ambiente...
set ANDROID_HOME=C:\android-dev
set PATH=%ANDROID_HOME%\cmdline-tools\latest\bin;%ANDROID_HOME%\platform-tools;%PATH%

:: Instalar componentes Android
echo.
echo [4/6] Instalando componentes Android...
sdkmanager "platform-tools" "platforms;android-30" "build-tools;30.0.3"

:: Baixar e configurar Java JDK
echo.
echo [5/6] Configurando Java JDK...
echo Baixe Java JDK 11 de: https://adoptium.net/
echo Instale em: C:\Program Files\Java\jdk-11
echo.
pause

:: Verificar instalação
echo.
echo [6/6] Verificando instalacao...
java -version
adb version

echo.
echo ========================================
echo   CONFIGURACAO CONCLUIDA!
echo ========================================
echo.
echo Agora execute: build-apk-windows.bat
pause