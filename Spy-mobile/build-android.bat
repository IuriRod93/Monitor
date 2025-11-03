@echo off
echo ========================================
echo    BUILD ANDROID APK - CORRIGIDO
echo ========================================

echo Verificando dependencias...
pip install --user buildozer cython kivy

echo.
echo Localizando buildozer...

REM Definir caminho do buildozer
set BUILDOZER_PATH=%APPDATA%\Python\Python313\Scripts\buildozer.exe

if exist "%BUILDOZER_PATH%" (
    echo [OK] Buildozer encontrado: %BUILDOZER_PATH%
) else (
    echo [ERRO] Buildozer nao encontrado!
    echo Reinstalando buildozer...
    pip uninstall -y buildozer
    pip install --user --force-reinstall buildozer
    
    if exist "%BUILDOZER_PATH%" (
        echo [OK] Buildozer reinstalado com sucesso
    ) else (
        echo [ERRO] Falha ao instalar buildozer
        pause
        exit /b 1
    )
)

echo.
echo Verificando buildozer.spec...
if not exist "buildozer.spec" (
    echo [ERRO] Arquivo buildozer.spec nao encontrado!
    echo Gerando buildozer.spec...
    "%BUILDOZER_PATH%" init
)

echo.
echo ========================================
echo INICIANDO BUILD DO APK
echo ========================================
echo Comando: "%BUILDOZER_PATH%" android debug
echo.

REM Executar o build
"%BUILDOZER_PATH%" android debug

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo ✓ APK GERADO COM SUCESSO!
    echo ========================================
    echo Localizacao: bin\*.apk
    echo.
    if exist "bin\*.apk" (
        dir bin\*.apk
    )
) else (
    echo.
    echo ========================================
    echo ✗ ERRO NO BUILD
    echo Codigo de erro: %errorlevel%
    echo ========================================
    echo.
    echo Possiveis solucoes:
    echo 1. Verifique se o Java JDK esta instalado
    echo 2. Verifique se o Android SDK esta configurado
    echo 3. Execute: buildozer android clean
    echo 4. Tente novamente
)

echo.
pause