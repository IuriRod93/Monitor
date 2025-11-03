@echo off
echo ========================================
echo   VERIFICACAO DE REQUISITOS ANDROID
echo ========================================

echo Verificando Python...
python --version
if %errorlevel% neq 0 (
    echo ERRO: Python nao encontrado!
    goto :end
)

echo.
echo Verificando pip...
pip --version
if %errorlevel% neq 0 (
    echo ERRO: pip nao encontrado!
    goto :end
)

echo.
echo Verificando Java...
java -version
if %errorlevel% neq 0 (
    echo AVISO: Java nao encontrado!
    echo Instale o OpenJDK 8 ou 11 para build Android
) else (
    echo Java OK
)

echo.
echo Verificando variaveis de ambiente...
if defined ANDROID_HOME (
    echo ANDROID_HOME: %ANDROID_HOME%
) else (
    echo AVISO: ANDROID_HOME nao definido
)

if defined ANDROID_SDK_ROOT (
    echo ANDROID_SDK_ROOT: %ANDROID_SDK_ROOT%
) else (
    echo AVISO: ANDROID_SDK_ROOT nao definido
)

echo.
echo Verificando buildozer...
set BUILDOZER_PATH=%APPDATA%\Python\Python313\Scripts\buildozer.exe
if exist "%BUILDOZER_PATH%" (
    echo Buildozer encontrado: %BUILDOZER_PATH%
    "%BUILDOZER_PATH%" --version
) else (
    echo Testando python -m buildozer...
    python -m buildozer --version
    if %errorlevel% neq 0 (
        echo ERRO: Buildozer nao encontrado!
    )
)

echo.
echo ========================================
echo   RECOMENDACOES PARA WINDOWS
echo ========================================
echo.
echo Para build Android no Windows, recomenda-se:
echo.
echo 1. Usar WSL (Windows Subsystem for Linux)
echo 2. Usar Docker com imagem Linux
echo 3. Usar uma VM Linux
echo 4. Usar GitHub Actions ou CI/CD online
echo.
echo O buildozer funciona melhor em ambiente Linux!
echo.

:end
pause