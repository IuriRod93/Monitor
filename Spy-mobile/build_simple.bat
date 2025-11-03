@echo off
echo ========================================
echo Metodo Simples - Gerando APK
echo ========================================

echo.
echo Instalando python-for-android...
pip install python-for-android

echo.
echo Criando diretorio de build...
if not exist "build" mkdir build
cd build

echo.
echo Baixando Android SDK e NDK...
echo NOTA: Isso pode demorar alguns minutos...

echo.
echo Gerando APK...
p4a apk --private ../. --package=org.example.spymobile --name="Spy Mobile" --version=0.1 --bootstrap=sdl2 --requirements=python3,kivy,pyjnius,requests --permissions=INTERNET,ACCESS_FINE_LOCATION,ACCESS_COARSE_LOCATION,READ_CONTACTS,READ_SMS,READ_CALL_LOG,READ_EXTERNAL_STORAGE,WRITE_EXTERNAL_STORAGE --arch=armeabi-v7a --icon=../icons/logo.png

echo.
echo ========================================
echo Build concluido!
echo ========================================
echo.
echo Verifique a pasta dist/ para o APK gerado
cd ..
pause