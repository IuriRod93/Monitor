@echo off
echo Instalando dependencias...
pip install buildozer cython kivy

echo Verificando buildozer...
where buildozer >nul 2>&1
if %errorlevel% neq 0 (
    echo Buildozer nao encontrado no PATH, tentando caminho do usuario...
    set BUILDOZER_PATH=%APPDATA%\Python\Python313\Scripts\buildozer.exe
    if exist "%BUILDOZER_PATH%" (
        echo Buildozer encontrado em: %BUILDOZER_PATH%
    ) else (
        echo Buildozer nao encontrado. Tentando instalar globalmente...
        pip install --user buildozer
        set BUILDOZER_PATH=%APPDATA%\Python\Python313\Scripts\buildozer.exe
    )
) else (
    set BUILDOZER_PATH=buildozer
)

echo Gerando APK...
"%BUILDOZER_PATH%" android debug

if %errorlevel% equ 0 (
    echo APK gerado com sucesso em bin/
) else (
    echo Erro ao gerar APK
)
pause