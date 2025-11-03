@echo off
echo ========================================
echo   TESTE DE CONEXAO
echo ========================================
echo.
echo Testando conectividade...
echo.

echo 1. Ping para o proprio IP:
ping -n 2 192.168.0.97

echo.
echo 2. Testando porta 8000:
netstat -an | findstr :8000

echo.
echo 3. Verificando firewall (se necessario):
echo Execute como administrador para verificar firewall:
echo netsh advfirewall firewall add rule name="Django Server" dir=in action=allow protocol=TCP localport=8000

echo.
echo ========================================
echo   INFORMACOES DE REDE
echo ========================================
echo.
echo IP configurado no app: 192.168.0.97
echo Porta: 8000
echo URL completa: http://192.168.0.97:8000
echo.
echo Para testar no navegador:
echo http://192.168.0.97:8000
echo.
pause