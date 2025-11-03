@echo off
echo ========================================
echo   APLICANDO NOVO DESIGN
echo ========================================

echo 1. Criando logo SVG...
venv\Scripts\activate && python criar_logo_simples.py

echo.
echo 2. Coletando arquivos estaticos...
venv\Scripts\activate && python manage.py collectstatic --noinput

echo.
echo 3. Resolvendo login...
venv\Scripts\activate && python resolver_login_definitivo.py

echo.
echo ========================================
echo   NOVO DESIGN APLICADO!
echo ========================================
echo.
echo MELHORIAS:
echo - Interface igual ao login (glassmorphism)
echo - Logo com fallback automatico
echo - Design moderno e responsivo
echo - Cores consistentes
echo - Efeitos visuais aprimorados
echo.
echo CREDENCIAIS:
echo Usuario: admin
echo Senha: 123456
echo.
echo Iniciando servidor...
echo Acesse: http://192.168.0.97:8000
echo.

venv\Scripts\activate && python manage.py runserver 192.168.0.97:8000