@echo off
echo 🚂 CONFIGURANDO RAILWAY PARA GERAR APK
echo =====================================

echo.
echo 📦 PASSO 1: Verificando Railway CLI...
railway --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Railway CLI não encontrado!
    echo.
    echo 📥 INSTALANDO RAILWAY CLI...
    echo Baixe e instale de: https://railway.app/cli
    echo.
    echo Ou use npm:
    echo npm install -g @railway/cli
    echo.
    pause
    exit /b 1
)

echo ✅ Railway CLI encontrado!

echo.
echo 🔐 PASSO 2: Login no Railway...
railway login

if %errorlevel% neq 0 (
    echo ❌ Erro no login
    pause
    exit /b 1
)

echo.
echo 📁 PASSO 3: Inicializando projeto...
railway init

echo.
echo 🚀 PASSO 4: Fazendo deploy (gerando APK)...
railway up

echo.
echo 📋 PASSO 5: Verificando logs...
railway logs

echo.
echo 🎉 PROCESSO CONCLUÍDO!
echo.
echo 📱 PRÓXIMOS PASSOS:
echo 1. Acesse o dashboard do Railway
echo 2. Vá na aba "Deployments"
echo 3. Baixe os logs para encontrar o APK
echo 4. Ou use: railway logs para ver o resultado

pause