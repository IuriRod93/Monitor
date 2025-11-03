@echo off
echo ========================================
echo    IROD SPY - BUILD APK WINDOWS
echo ========================================
echo.

:: Verificar se Python está instalado
python --version >nul 2>&1
if errorlevel 1 (
    echo ERRO: Python nao encontrado!
    echo Instale Python 3.8+ primeiro
    pause
    exit /b 1
)

:: Navegar para diretório do projeto
cd /d "%~dp0"
echo Diretorio atual: %CD%

:: Instalar/atualizar dependências
echo.
echo [1/5] Instalando dependencias...
pip install --upgrade pip
pip install buildozer cython kivy kivymd plyer requests pillow

:: Verificar se buildozer.spec existe
if not exist "buildozer-social.spec" (
    echo ERRO: buildozer-social.spec nao encontrado!
    pause
    exit /b 1
)

:: Limpar builds anteriores
echo.
echo [2/5] Limpando builds anteriores...
if exist ".buildozer" rmdir /s /q ".buildozer"
if exist "bin" rmdir /s /q "bin"

:: Configurar variáveis de ambiente
echo.
echo [3/5] Configurando ambiente...
set JAVA_HOME=C:\Program Files\Java\jdk-11.0.16
set ANDROID_HOME=C:\Users\%USERNAME%\AppData\Local\Android\Sdk
set PATH=%JAVA_HOME%\bin;%ANDROID_HOME%\tools;%ANDROID_HOME%\platform-tools;%PATH%

:: Inicializar buildozer
echo.
echo [4/5] Inicializando buildozer...
buildozer android clean

:: Gerar APK
echo.
echo [5/5] Gerando APK...
echo Isso pode demorar 10-20 minutos...
buildozer -v android debug --spec buildozer-social.spec

:: Verificar se APK foi gerado
if exist "bin\*.apk" (
    echo.
    echo ========================================
    echo    APK GERADO COM SUCESSO!
    echo ========================================
    echo.
    echo Localização: %CD%\bin\
    dir bin\*.apk
    echo.
    echo Para instalar no dispositivo:
    echo adb install bin\nome-do-arquivo.apk
) else (
    echo.
    echo ========================================
    echo    ERRO AO GERAR APK!
    echo ========================================
    echo Verifique os logs acima para detalhes
)

echo.
pause