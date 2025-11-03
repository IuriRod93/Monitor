# 🔄 SCRIPT SIMPLES PARA REINSTALAR WSL2
# Execute como Administrador: PowerShell -ExecutionPolicy Bypass -File wsl2_simples.ps1

Write-Host "🔄 REINSTALANDO WSL2 LIMPO" -ForegroundColor Green
Write-Host "=========================" -ForegroundColor Green

# Verificar se está executando como administrador
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "❌ Execute como Administrador!" -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit 1
}

Write-Host "`n📋 PASSO 1: Listando distribuições WSL existentes..." -ForegroundColor Yellow
wsl --list --verbose

Write-Host "`n🗑️ PASSO 2: Removendo distribuições WSL antigas..." -ForegroundColor Yellow
$distributions = @("Ubuntu", "Ubuntu-20.04", "Ubuntu-22.04", "Ubuntu-18.04", "Debian", "kali-linux")

foreach ($distro in $distributions) {
    try {
        $result = wsl --list --quiet 2>$null | Where-Object { $_ -match $distro }
        if ($result) {
            Write-Host "Removendo $distro..." -ForegroundColor Cyan
            wsl --unregister $distro 2>$null
        }
    } catch {
        # Ignorar erros se distribuição não existir
    }
}

Write-Host "`n🔧 PASSO 3: Desabilitando recursos WSL..." -ForegroundColor Yellow
dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /disable-feature /featurename:VirtualMachinePlatform /all /norestart

Write-Host "`n✅ Recursos WSL desabilitados!" -ForegroundColor Green
Write-Host "`n⚠️  REINICIE O COMPUTADOR AGORA!" -ForegroundColor Red
Write-Host "Após reiniciar, execute: wsl2_parte2.ps1" -ForegroundColor Yellow

# Criar script da parte 2
$parte2Content = @'
# 🔄 SCRIPT PARA REINSTALAR WSL2 - PARTE 2
Write-Host "🔄 REINSTALANDO WSL2 - PARTE 2" -ForegroundColor Green

if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "❌ Execute como Administrador!" -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit 1
}

Write-Host "`n🔧 Habilitando recursos WSL2..." -ForegroundColor Yellow
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Write-Host "`n📥 Baixando kernel WSL2..." -ForegroundColor Yellow
$kernelUrl = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
$kernelPath = "$env:TEMP\wsl_update_x64.msi"

try {
    Invoke-WebRequest -Uri $kernelUrl -OutFile $kernelPath -UseBasicParsing
    Write-Host "✅ Kernel baixado!" -ForegroundColor Green
    
    Write-Host "`n📦 Instalando kernel..." -ForegroundColor Yellow
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$kernelPath`" /quiet" -Wait
    Write-Host "✅ Kernel instalado!" -ForegroundColor Green
    
} catch {
    Write-Host "❌ Erro ao baixar. Baixe manualmente:" -ForegroundColor Red
    Write-Host $kernelUrl -ForegroundColor Yellow
}

Write-Host "`n⚙️ Configurando WSL2..." -ForegroundColor Yellow
wsl --set-default-version 2

Write-Host "`n📱 Instalando Ubuntu 22.04..." -ForegroundColor Yellow
wsl --install -d Ubuntu-22.04 --no-launch

Write-Host "`n✅ WSL2 INSTALADO!" -ForegroundColor Green
Write-Host "`n📋 PRÓXIMOS PASSOS:" -ForegroundColor Yellow
Write-Host "1. Reinicie o computador"
Write-Host "2. Abra 'Ubuntu 22.04' no menu iniciar"
Write-Host "3. Configure usuário e senha"
Write-Host "4. Execute os comandos de configuração"

Read-Host "`nPressione Enter para sair"
'@

$parte2Content | Out-File -FilePath "wsl2_parte2.ps1" -Encoding UTF8
Write-Host "`n📄 Script da parte 2 criado: wsl2_parte2.ps1" -ForegroundColor Green

Read-Host "`nPressione Enter para sair e REINICIE O COMPUTADOR"