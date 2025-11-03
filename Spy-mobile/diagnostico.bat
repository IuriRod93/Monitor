@echo off
echo ========================================
echo    DIAGNOSTICO DO AMBIENTE
echo ========================================

echo Versao do Python:
python --version

echo.
echo Versao do pip:
pip --version

echo.
echo Pacotes Python instalados (buildozer, kivy, cython):
pip list | findstr /i "buildozer kivy cython"

echo.
echo Procurando buildozer.exe:
echo Caminho 1: %APPDATA%\Python\Python313\Scripts\buildozer.exe
if exist "%APPDATA%\Python\Python313\Scripts\buildozer.exe" (
    echo [ENCONTRADO] %APPDATA%\Python\Python313\Scripts\buildozer.exe
) else (
    echo [NAO ENCONTRADO] %APPDATA%\Python\Python313\Scripts\buildozer.exe
)

echo.
echo Caminho 2: %APPDATA%\Python\Python312\Scripts\buildozer.exe
if exist "%APPDATA%\Python\Python312\Scripts\buildozer.exe" (
    echo [ENCONTRADO] %APPDATA%\Python\Python312\Scripts\buildozer.exe
) else (
    echo [NAO ENCONTRADO] %APPDATA%\Python\Python312\Scripts\buildozer.exe
)

echo.
echo Testando buildozer via PATH:
where buildozer >nul 2>&1
if %errorlevel% equ 0 (
    echo [ENCONTRADO] buildozer no PATH
    where buildozer
) else (
    echo [NAO ENCONTRADO] buildozer no PATH
)

echo.
echo Testando python -m buildozer:
python -m buildozer --version >nul 2>&1
if %errorlevel% equ 0 (
    echo [FUNCIONA] python -m buildozer
    python -m buildozer --version
) else (
    echo [NAO FUNCIONA] python -m buildozer
)

echo.
echo Conteudo da pasta Scripts do usuario:
if exist "%APPDATA%\Python\Python313\Scripts\" (
    echo Listando: %APPDATA%\Python\Python313\Scripts\
    dir "%APPDATA%\Python\Python313\Scripts\buildozer*" 2>nul
) else (
    echo Pasta nao existe: %APPDATA%\Python\Python313\Scripts\
)

echo.
echo ========================================
echo    FIM DO DIAGNOSTICO
echo ========================================
pause