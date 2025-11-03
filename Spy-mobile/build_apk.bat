@echo off
echo ========================================
echo Gerando APK do Spy Mobile
echo ========================================

echo.
echo Copiando arquivos para WSL...
wsl mkdir -p ~/spy-mobile-build
wsl cp -r /mnt/c/Users/Iuri/Desktop/Projetos/Monitoramento/Spy-mobile/* ~/spy-mobile-build/

echo.
echo Navegando para diretorio do projeto...
wsl cd ~/spy-mobile-build

echo.
echo Iniciando build do APK...
echo ATENCAO: Este processo pode demorar 30-60 minutos na primeira vez
echo.
wsl cd ~/spy-mobile-build && ~/.local/bin/buildozer android debug

echo.
echo Copiando APK gerado de volta para Windows...
wsl cp ~/spy-mobile-build/bin/*.apk /mnt/c/Users/Iuri/Desktop/Projetos/Monitoramento/Spy-mobile/

echo.
echo ========================================
echo Build concluido!
echo ========================================
echo.
echo O APK foi gerado em:
echo C:\Users\Iuri\Desktop\Projetos\Monitoramento\Spy-mobile\
echo.
dir *.apk
echo.
pause