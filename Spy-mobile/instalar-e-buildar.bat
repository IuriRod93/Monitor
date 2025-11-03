@echo off
echo ========================================
echo   INSTALAR TUDO E GERAR APK - VSCODE
echo ========================================
echo.

cd /d "C:\Users\Iuri\Desktop\Projetos\Monitoramento\Spy-mobile"

echo [1/6] Instalando Git...
winget install --id Git.Git -e --source winget
refreshenv

echo.
echo [2/6] Instalando dependencias Python...
pip install --upgrade pip
pip install buildozer cython kivy kivymd plyer requests pillow

echo.
echo [3/6] Configurando buildozer...
if not exist "buildozer.spec" (
    buildozer init
)

echo.
echo [4/6] Limpando builds anteriores...
if exist ".buildozer" rmdir /s /q ".buildozer"
if exist "bin" rmdir /s /q "bin"

echo.
echo [5/6] Gerando APK (pode demorar 20-30 min)...
buildozer android debug --spec buildozer-social.spec

echo.
echo [6/6] Verificando resultado...
if exist "bin\*.apk" (
    echo ✅ APK GERADO COM SUCESSO!
    echo Localização: %CD%\bin\
    dir bin\*.apk
    echo.
    echo Para instalar no Android:
    echo adb install bin\nome-do-arquivo.apk
) else (
    echo ❌ Falha no build
    echo Verifique os logs acima
)

pause