@echo off
echo ========================================
echo   INICIANDO SISTEMA SPY COMPLETO
echo ========================================

echo 1. Limpando IMEIs...
venv\Scripts\activate && python limpar_imeis.py

echo.
echo 2. Corrigindo templates...
venv\Scripts\activate && python corrigir_templates.py

echo.
echo 3. Criando superusuario...
venv\Scripts\activate && python criar_superuser.py

echo.
echo 4. Coletando arquivos estaticos...
venv\Scripts\activate && python manage.py collectstatic --noinput

echo.
echo ========================================
echo   SISTEMA PRONTO!
echo ========================================
echo.
echo Login: admin
echo Senha: admin123
echo.
echo Iniciando servidor em 192.168.0.97:8000...
echo Acesse: http://192.168.0.97:8000
echo.

venv\Scripts\activate && python manage.py runserver 192.168.0.97:8000