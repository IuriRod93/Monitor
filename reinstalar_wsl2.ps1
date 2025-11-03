# 🔄 SCRIPT PARA REINSTALAR WSL2 LIMPO
# Execute como Administrador: PowerShell -ExecutionPolicy Bypass -File reinstalar_wsl2.ps1

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
Write-Host "Após reiniciar, execute: reinstalar_wsl2_parte2.ps1" -ForegroundColor Yellow

# Criar script da parte 2
$parte2Script = @'
# 🔄 SCRIPT PARA REINSTALAR WSL2 - PARTE 2
# Execute após reiniciar: PowerShell -ExecutionPolicy Bypass -File reinstalar_wsl2_parte2.ps1

Write-Host "🔄 REINSTALANDO WSL2 - PARTE 2" -ForegroundColor Green
Write-Host "=============================" -ForegroundColor Green

# Verificar se está executando como administrador
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "❌ Execute como Administrador!" -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit 1
}

Write-Host "`n🔧 PASSO 1: Habilitando recursos WSL2..." -ForegroundColor Yellow
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Write-Host "`n📥 PASSO 2: Baixando kernel WSL2..." -ForegroundColor Yellow
$kernelUrl = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
$kernelPath = "$env:TEMP\wsl_update_x64.msi"

try {
    Invoke-WebRequest -Uri $kernelUrl -OutFile $kernelPath -UseBasicParsing
    Write-Host "✅ Kernel WSL2 baixado!" -ForegroundColor Green
    
    Write-Host "`n📦 PASSO 3: Instalando kernel WSL2..." -ForegroundColor Yellow
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$kernelPath`" /quiet" -Wait
    Write-Host "✅ Kernel WSL2 instalado!" -ForegroundColor Green
    
} catch {
    Write-Host "❌ Erro ao baixar kernel. Baixe manualmente de:" -ForegroundColor Red
    Write-Host $kernelUrl -ForegroundColor Yellow
}

Write-Host "`n⚙️ PASSO 4: Configurando WSL2 como padrão..." -ForegroundColor Yellow
wsl --set-default-version 2

Write-Host "`n📱 PASSO 5: Instalando Ubuntu 22.04..." -ForegroundColor Yellow
wsl --install -d Ubuntu-22.04 --no-launch

Write-Host "`n✅ WSL2 INSTALADO COM SUCESSO!" -ForegroundColor Green
Write-Host "==============================" -ForegroundColor Green

Write-Host "`n📋 PRÓXIMOS PASSOS:" -ForegroundColor Yellow
Write-Host "1. Reinicie o computador novamente"
Write-Host "2. Abra 'Ubuntu 22.04' no menu iniciar"
Write-Host "3. Configure usuário e senha"
Write-Host "4. Execute os comandos de configuração do ambiente Android"

Write-Host "`n🚀 COMANDOS PARA CONFIGURAR AMBIENTE:" -ForegroundColor Cyan
Write-Host @"
sudo apt update && sudo apt upgrade -y
sudo apt install python3-pip openjdk-8-jdk git unzip wget build-essential -y
pip3 install buildozer kivy[base] cython requests

mkdir -p ~/android-sdk && cd ~/android-sdk
wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
unzip commandlinetools-linux-8512546_latest.zip
mkdir -p cmdline-tools/latest && mv cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true

echo 'export ANDROID_HOME=~/android-sdk' >> ~/.bashrc
echo 'export ANDROID_SDK_ROOT=~/android-sdk' >> ~/.bashrc
echo 'export PATH=$PATH:~/android-sdk/cmdline-tools/latest/bin' >> ~/.bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc
source ~/.bashrc

yes | sdkmanager --licenses
sdkmanager "platforms;android-30" "build-tools;30.0.3" "platform-tools"
"@ -ForegroundColor White

Read-Host "`nPressione Enter para sair"
'@

$parte2Script | Out-File -FilePath "reinstalar_wsl2_parte2.ps1" -Encoding UTF8
Write-Host "`n📄 Script da parte 2 criado: reinstalar_wsl2_parte2.ps1" -ForegroundColor Green

Read-Host "`nPressione Enter para sair e REINICIE O COMPUTADOR"