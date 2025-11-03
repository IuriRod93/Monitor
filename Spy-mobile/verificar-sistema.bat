@echo off
echo ========================================
echo   VERIFICAR SISTEMA PARA BUILD APK
echo ========================================
echo.

set "ERRO=0"

:: Verificar Python
echo [1/6] Verificando Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python NAO encontrado
    echo    Instale: https://www.python.org/downloads/
    set "ERRO=1"
) else (
    for /f "tokens=2" %%i in ('python --version 2^>^&1') do echo ✅ Python %%i encontrado
)

:: Verificar pip
echo.
echo [2/6] Verificando pip...
pip --version >nul 2>&1
if errorlevel 1 (
    echo ❌ pip NAO encontrado
    set "ERRO=1"
) else (
    echo ✅ pip encontrado
)

:: Verificar Git
echo.
echo [3/6] Verificando Git...
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git NAO encontrado
    echo    Instale: https://git-scm.com/download/win
    set "ERRO=1"
) else (
    echo ✅ Git encontrado
)

:: Verificar Docker
echo.
echo [4/6] Verificando Docker...
docker --version >nul 2>&1
if errorlevel 1 (
    echo ⚠️  Docker NAO encontrado (opcional)
    echo    Para build com Docker: https://www.docker.com/products/docker-desktop
) else (
    echo ✅ Docker encontrado
)

:: Verificar Java
echo.
echo [5/6] Verificando Java...
java -version >nul 2>&1
if errorlevel 1 (
    echo ⚠️  Java NAO encontrado (necessário para build nativo)
    echo    Instale JDK 11: https://adoptium.net/
) else (
    echo ✅ Java encontrado
)

:: Verificar espaço em disco
echo.
echo [6/6] Verificando espaco em disco...
for /f "tokens=3" %%i in ('dir /-c %SystemDrive%\ ^| find "bytes free"') do (
    set "FREE_SPACE=%%i"
)
echo ✅ Espaco disponivel verificado

:: Resultado final
echo.
echo ========================================
if "%ERRO%"=="0" (
    echo   ✅ SISTEMA PRONTO PARA BUILD!
    echo ========================================
    echo.
    echo Opcoes disponiveis:
    echo 1. build-docker-windows.bat (RECOMENDADO)
    echo 2. build-apk-windows.bat (build nativo)
) else (
    echo   ❌ SISTEMA NAO ESTA PRONTO
    echo ========================================
    echo.
    echo Instale os componentes marcados com ❌
)

echo.
pause