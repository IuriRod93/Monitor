@echo off
echo ========================================
echo   RESOLVENDO PROBLEMA DO BUILDOZER
echo ========================================

echo Passo 1: Desinstalando buildozer atual...
pip uninstall -y buildozer

echo.
echo Passo 2: Limpando cache do pip...
pip cache purge

echo.
echo Passo 3: Reinstalando buildozer com --force-reinstall...
pip install --user --force-reinstall buildozer

echo.
echo Passo 4: Verificando instalacao...
set BUILDOZER_PATH=%APPDATA%\Python\Python313\Scripts\buildozer.exe
if exist "%BUILDOZER_PATH%" (
    echo [SUCESSO] Buildozer instalado em: %BUILDOZER_PATH%
    echo Testando buildozer...
    "%BUILDOZER_PATH%" --version
) else (
    echo [ERRO] Buildozer ainda nao encontrado
    echo Tentando instalacao global...
    pip install buildozer
)

echo.
echo Passo 5: Adicionando ao PATH temporariamente...
set PATH=%APPDATA%\Python\Python313\Scripts;%PATH%

echo.
echo Passo 6: Testando buildozer no PATH...
where buildozer
buildozer --version

echo.
echo ========================================
echo   RESOLUCAO CONCLUIDA
echo ========================================
pause