@echo off
echo ========================================
echo   CORRIGINDO PROBLEMAS DE LOGIN
echo ========================================

echo 1. Diagnosticando sistema atual...
venv\Scripts\activate && python diagnosticar_login.py

echo.
echo 2. Resetando usuario...
venv\Scripts\activate && python resetar_usuario.py

echo.
echo 3. Testando novamente...
venv\Scripts\activate && python diagnosticar_login.py

echo.
echo 4. Verificando configuracoes Django...
venv\Scripts\activate && python manage.py check

echo.
echo ========================================
echo   CREDENCIAIS ATUALIZADAS
echo ========================================
echo.
echo Usuario: Admin
echo Senha: Admin123
echo.
echo IMPORTANTE: Use exatamente essas credenciais!
echo - Usuario: Admin (com A maiusculo)
echo - Senha: Admin123 (com A maiusculo e numeros)
echo.
echo Iniciando servidor para teste...
echo Acesse: http://192.168.0.97:8000
echo.

venv\Scripts\activate && python manage.py runserver 192.168.0.97:8000