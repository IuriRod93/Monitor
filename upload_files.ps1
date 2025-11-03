Write-Host "🚀 SUBINDO ARQUIVOS PARA GITHUB" -ForegroundColor Green
Write-Host "===============================" -ForegroundColor Green

# Verificar se Git está instalado
try {
    git --version | Out-Null
    Write-Host "✅ Git encontrado" -ForegroundColor Green
} catch {
    Write-Host "❌ Git não encontrado. Instale de: https://git-scm.com" -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit 1
}

# Inicializar repositório
Write-Host "`n📁 Configurando repositório..." -ForegroundColor Yellow
git init
git remote remove origin 2>$null
git remote add origin https://github.com/IuriRod93/spy-mobile-apk.git

# Adicionar arquivos essenciais
Write-Host "`n📦 Adicionando arquivos..." -ForegroundColor Yellow
$files = @(
    "main.py",
    "buildozer.spec", 
    "Dockerfile.codespaces",
    "build-apk.sh",
    "devcontainer.json",
    "docker-compose.yml",
    "requirements.txt",
    "README_GITHUB.md"
)

foreach ($file in $files) {
    if (Test-Path $file) {
        git add $file
        Write-Host "✅ $file adicionado" -ForegroundColor Green
    } else {
        Write-Host "⚠️ $file não encontrado" -ForegroundColor Yellow
    }
}

# Commit
Write-Host "`n💾 Fazendo commit..." -ForegroundColor Yellow
git commit -m "🚀 Setup completo APK Builder - Codespaces + Docker"

# Push
Write-Host "`n📤 Enviando para GitHub..." -ForegroundColor Yellow
git branch -M main
git push -u origin main --force

Write-Host "`n🎉 CONCLUÍDO!" -ForegroundColor Green
Write-Host "🔗 Repositório: https://github.com/IuriRod93/spy-mobile-apk" -ForegroundColor Cyan
Write-Host "`n📋 PRÓXIMOS PASSOS:" -ForegroundColor Yellow
Write-Host "1. Acesse o repositório no GitHub"
Write-Host "2. Clique em Code → Codespaces → Create codespace"
Write-Host "3. Execute: build-apk"
Write-Host "4. Aguarde 25 minutos"
Write-Host "5. Baixe o APK da pasta bin/"

Read-Host "`nPressione Enter para finalizar"