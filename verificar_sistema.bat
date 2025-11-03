@echo off
echo ========================================
echo   VERIFICACAO COMPLETA DO SISTEMA
echo ========================================
echo.

cd Spy

echo 1. Verificando banco de dados...
venv\Scripts\activate && python manage.py showmigrations

echo.
echo 2. Limpando IMEIs...
venv\Scripts\activate && python limpar_imeis.py

echo.
echo 3. Testando URLs...
venv\Scripts\activate && python manage.py check

echo.
echo 4. Coletando arquivos estaticos...
venv\Scripts\activate && python manage.py collectstatic --noinput

echo.
echo ========================================
echo   SISTEMA PRONTO PARA USO
echo ========================================
echo.
echo Para iniciar o servidor:
echo testar_servidor.bat
echo.
echo URL: http://192.168.0.97:8000
echo.
pause