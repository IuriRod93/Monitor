@echo off
echo ========================================
echo   ATUALIZANDO MODELOS DO DJANGO
echo ========================================

echo Gerando migracoes...
python manage.py makemigrations

echo.
echo Aplicando migracoes...
python manage.py migrate

echo.
echo Coletando arquivos estaticos...
python manage.py collectstatic --noinput

echo.
echo ========================================
echo   ATUALIZACAO CONCLUIDA
echo ========================================
echo.
echo Para testar o servidor:
echo python manage.py runserver 0.0.0.0:8000
echo.
pause