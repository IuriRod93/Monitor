@echo off
echo ========================================
echo    SCRIPT DE BUILD CORRIGIDO
echo ========================================

echo Instalando dependencias...
pip install --user buildozer cython kivy

echo.
echo Procurando buildozer...

REM Tentar diferentes localizações do buildozer
set BUILDOZER_FOUND=0

REM Caminho 1: Scripts do usuário Python 3.13
set BUILDOZER_PATH1=%APPDATA%\Python\Python313\Scripts\buildozer.exe
if exist "%BUILDOZER_PATH1%" (
    echo Buildozer encontrado em: %BUILDOZER_PATH1%
    set BUILDOZER_CMD="%BUILDOZER_PATH1%"
    set BUILDOZER_FOUND=1
    goto :build
)

REM Caminho 2: Scripts do usuário Python 3.12
set BUILDOZER_PATH2=%APPDATA%\Python\Python312\Scripts\buildozer.exe
if exist "%BUILDOZER_PATH2%" (
    echo Buildozer encontrado em: %BUILDOZER_PATH2%
    set BUILDOZER_CMD="%BUILDOZER_PATH2%"
    set BUILDOZER_FOUND=1
    goto :build
)

REM Caminho 3: Scripts do usuário Python 3.11
set BUILDOZER_PATH3=%APPDATA%\Python\Python311\Scripts\buildozer.exe
if exist "%BUILDOZER_PATH3%" (
    echo Buildozer encontrado em: %BUILDOZER_PATH3%
    set BUILDOZER_CMD="%BUILDOZER_PATH3%"
    set BUILDOZER_FOUND=1
    goto :build
)

REM Caminho 4: Tentar pelo PATH
where buildozer >nul 2>&1
if %errorlevel% equ 0 (
    echo Buildozer encontrado no PATH
    set BUILDOZER_CMD=buildozer
    set BUILDOZER_FOUND=1
    goto :build
)

REM Caminho 5: Python -m buildozer
python -m buildozer --version >nul 2>&1
if %errorlevel% equ 0 (
    echo Buildozer encontrado via python -m
    set BUILDOZER_CMD=python -m buildozer
    set BUILDOZER_FOUND=1
    goto :build
)

if %BUILDOZER_FOUND% equ 0 (
    echo ERRO: Buildozer nao encontrado!
    echo Tentando reinstalar...
    pip uninstall -y buildozer
    pip install --user buildozer
    
    REM Tentar novamente após reinstalação
    set BUILDOZER_PATH1=%APPDATA%\Python\Python313\Scripts\buildozer.exe
    if exist "%BUILDOZER_PATH1%" (
        echo Buildozer reinstalado em: %BUILDOZER_PATH1%
        set BUILDOZER_CMD="%BUILDOZER_PATH1%"
        set BUILDOZER_FOUND=1
    ) else (
        echo ERRO: Nao foi possivel instalar o buildozer corretamente
        echo Verifique sua instalacao do Python
        pause
        exit /b 1
    )
)

:build
echo.
echo ========================================
echo Iniciando build do APK...
echo Comando: %BUILDOZER_CMD%
echo ========================================

%BUILDOZER_CMD% android debug

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo APK gerado com SUCESSO!
    echo Verifique a pasta bin/
    echo ========================================
) else (
    echo.
    echo ========================================
    echo ERRO ao gerar APK
    echo Codigo de erro: %errorlevel%
    echo ========================================
)

echo.
pause