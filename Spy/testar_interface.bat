@echo off
echo ========================================
echo   TESTANDO NOVA INTERFACE
echo ========================================

echo Criando superusuario...
venv\Scripts\activate && python criar_superuser.py

echo.
echo Coletando arquivos estaticos...
venv\Scripts\activate && python manage.py collectstatic --noinput

echo.
echo ========================================
echo   INTERFACE ATUALIZADA!
echo ========================================
echo.
echo Login: admin
echo Senha: admin123
echo.
echo Melhorias aplicadas:
echo - Login moderno sem navbar
echo - Navbar responsivo e elegante
echo - Header redesenhado
echo - Efeitos visuais aprimorados
echo.
echo Iniciando servidor...
echo Acesse: http://192.168.0.97:8000
echo.

venv\Scripts\activate && python manage.py runserver 192.168.0.97:8000