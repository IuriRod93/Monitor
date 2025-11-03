@echo off
echo ========================================
echo   RESOLVENDO LOGIN DE FORMA SIMPLES
echo ========================================

echo 1. Fazendo debug completo...
venv\Scripts\activate && python debug_login.py

echo.
echo 2. Resolvendo problema definitivamente...
venv\Scripts\activate && python resolver_login_definitivo.py

echo.
echo 3. Verificando se funcionou...
venv\Scripts\activate && python debug_login.py

echo.
echo ========================================
echo   CREDENCIAIS SIMPLIFICADAS
echo ========================================
echo.
echo OPCAO 1:
echo Usuario: admin
echo Senha: 123456
echo.
echo OPCAO 2:
echo Usuario: Admin  
echo Senha: Admin123
echo.
echo Teste ambas as opcoes!
echo.
echo Iniciando servidor...
echo Acesse: http://192.168.0.97:8000
echo.

venv\Scripts\activate && python manage.py runserver 192.168.0.97:8000