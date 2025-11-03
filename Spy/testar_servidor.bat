@echo off
echo ========================================
echo   TESTANDO SERVIDOR DJANGO
echo ========================================
echo.
echo Limpando IMEIs...
venv\Scripts\activate && python limpar_imeis.py

echo.
echo Iniciando servidor em 192.168.0.97:8000...
echo.
echo Acesse: http://192.168.0.97:8000
echo.
venv\Scripts\activate && python manage.py runserver 192.168.0.97:8000