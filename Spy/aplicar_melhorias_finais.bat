@echo off
echo ========================================
echo   APLICANDO MELHORIAS FINAIS
echo ========================================

echo 1. Corrigindo login...
venv\Scripts\activate && python corrigir_senha_definitivo.py

echo.
echo 2. Coletando arquivos estaticos...
venv\Scripts\activate && python manage.py collectstatic --noinput

echo.
echo ========================================
echo   MELHORIAS APLICADAS!
echo ========================================
echo.
echo NOVIDADES:
echo - Logo SVG embutida (sempre funciona)
echo - Navbar com efeitos 3D e animacoes
echo - Icones com sombras e brilhos
echo - Efeitos de hover melhorados
echo - Design consistente login/sistema
echo.
echo CREDENCIAIS:
echo Usuario: Admin
echo Senha: admin123
echo.
echo OU
echo.
echo Usuario: admin
echo Senha: 123456
echo.
echo Iniciando servidor...
echo Acesse: http://192.168.0.97:8000
echo.

venv\Scripts\activate && python manage.py runserver 192.168.0.97:8000