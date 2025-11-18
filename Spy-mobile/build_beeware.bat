@echo off
echo Iniciando build BeeWare APK leve no Windows...
echo.

cd /d %~dp0

REM Verificar se estamos no diretório correto
if not exist "pyproject.toml" (
    echo ERRO: pyproject.toml não encontrado. Execute este script dentro da pasta Spy-mobile.
    pause
    exit /b 1
)

echo Verificando dependências...
python -m pip install briefcase requests --quiet

echo.
echo Criando APK com BeeWare...
python -m briefcase create android

if %errorlevel% neq 0 (
    echo.
    echo ERRO: Falha na criação do APK.
    echo Verifique os logs acima para detalhes.
    pause
    exit /b 1
)

echo.
echo APK criado com sucesso!
echo Verifique a pasta android\gradle\app\build\outputs\apk\debug\ para o arquivo APK.
echo.
pause
