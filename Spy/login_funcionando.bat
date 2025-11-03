@echo off
echo ========================================
echo   CORRIGINDO LOGIN DEFINITIVAMENTE
echo ========================================

echo 1. Corrigindo senhas dos usuarios...
venv\Scripts\activate && python corrigir_senha_definitivo.py

echo.
echo 2. Limpando sessoes antigas...
venv\Scripts\activate && python manage.py clearsessions

echo.
echo 3. Coletando arquivos estaticos...
venv\Scripts\activate && python manage.py collectstatic --noinput

echo.
echo ========================================
echo   LOGIN CORRIGIDO!
echo ========================================
echo.
echo CREDENCIAIS QUE FUNCIONAM:
echo.
echo OPCAO 1:
echo Usuario: Admin
echo Senha: admin123
echo.
echo OPCAO 2:
echo Usuario: admin  
echo Senha: 123456
echo.
echo IMPORTANTE: Use exatamente essas credenciais!
echo.
echo Iniciando servidor...
echo Acesse: http://192.168.0.97:8000
echo.

venv\Scripts\activate && python manage.py runserver 192.168.0.97:8000