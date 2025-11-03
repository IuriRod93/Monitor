@echo off
echo ========================================
echo   SETUP COMPLETO - SISTEMA SPY
echo ========================================

echo Passo 1: Configurando Django...
cd Spy
python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --noinput

echo.
echo Passo 2: Criando superusuario (se necessario)...
echo Digite 'n' se ja existe um superusuario
python manage.py createsuperuser

echo.
echo Passo 3: Configurando app Android...
cd ..\Spy-mobile

echo Instalando dependencias Python...
pip install --user buildozer cython kivy requests plyer

echo.
echo Verificando buildozer...
python -c "import buildozer; print('Buildozer OK')"

echo.
echo ========================================
echo   SETUP CONCLUIDO
echo ========================================
echo.
echo PROXIMOS PASSOS:
echo.
echo 1. Para iniciar o servidor Django:
echo    cd Spy
echo    python manage.py runserver 0.0.0.0:8000
echo.
echo 2. Para gerar APK Android:
echo    cd Spy-mobile
echo    build-android.bat
echo.
echo 3. Acesse o painel web em:
echo    http://localhost:8000
echo.
echo 4. Configure o IP do servidor no arquivo:
echo    Spy-mobile\main.py (linha DJANGO_IP)
echo.
pause