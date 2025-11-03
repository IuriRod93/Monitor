@echo off
echo ========================================
echo   INICIANDO SERVIDOR DJANGO
echo ========================================
echo.
echo IP do servidor: 192.168.0.97:8000
echo.
echo Acesse no navegador:
echo http://192.168.0.97:8000
echo ou
echo http://localhost:8000
echo.
echo ========================================

cd Spy
python manage.py runserver 192.168.0.97:8000