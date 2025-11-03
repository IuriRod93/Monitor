@echo off
echo ========================================
echo   CORRIGINDO PROBLEMAS DE SESSAO
echo ========================================

echo 1. Testando configuracoes atuais...
venv\Scripts\activate && python testar_sessao.py

echo.
echo 2. Resetando usuario e sessoes...
venv\Scripts\activate && python resetar_usuario.py

echo.
echo 3. Limpando cache de sessoes...
venv\Scripts\activate && python manage.py clearsessions

echo.
echo 4. Coletando arquivos estaticos...
venv\Scripts\activate && python manage.py collectstatic --noinput

echo.
echo ========================================
echo   TESTE DE LOGIN
echo ========================================
echo.
echo CREDENCIAIS:
echo Usuario: Admin
echo Senha: Admin123
echo.
echo PASSOS PARA TESTAR:
echo 1. Acesse: http://192.168.0.97:8000
echo 2. Faca login com as credenciais acima
echo 3. Teste todos os links do menu
echo.
echo Iniciando servidor...

venv\Scripts\activate && python manage.py runserver 192.168.0.97:8000