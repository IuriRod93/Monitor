@echo off
echo 🚀 CONECTANDO E CONFIGURANDO VPS
echo ================================

echo 📡 Conectando na VPS: 147.79.111.118
echo 🔑 Senha: Irod-ti93#12#13

echo.
echo 📋 COMANDOS PARA EXECUTAR NA VPS:
echo ================================
echo.
echo 1. Fazer upload do script:
echo    scp deploy_vps_completo.sh root@147.79.111.118:/root/
echo.
echo 2. Conectar via SSH:
echo    ssh root@147.79.111.118
echo.
echo 3. Executar na VPS:
echo    chmod +x /root/deploy_vps_completo.sh
echo    /root/deploy_vps_completo.sh
echo.
echo 4. Aguardar instalação (5-10 minutos)
echo.
echo 5. Testar:
echo    curl http://147.79.111.118/api/test/
echo.

pause

echo.
echo 🔄 Executando comandos automaticamente...

echo 📤 Fazendo upload do script...
scp deploy_vps_completo.sh root@147.79.111.118:/root/

if %ERRORLEVEL% EQU 0 (
    echo ✅ Upload concluído!
    echo.
    echo 🔗 Conectando e executando...
    ssh root@147.79.111.118 "chmod +x /root/deploy_vps_completo.sh && /root/deploy_vps_completo.sh"
) else (
    echo ❌ Erro no upload. Execute manualmente:
    echo    scp deploy_vps_completo.sh root@147.79.111.118:/root/
    echo    ssh root@147.79.111.118
    echo    chmod +x /root/deploy_vps_completo.sh
    echo    /root/deploy_vps_completo.sh
)

echo.
echo ✅ CONFIGURAÇÃO CONCLUÍDA!
echo 🌐 Django rodando em: http://147.79.111.118
echo 🔑 Login: admin / admin123
echo 📡 API: http://147.79.111.118/api/test/

pause