# 📱 SCRIPT POWERSHELL PARA GERAR APK AUTOMATICAMENTE
# Execute: PowerShell -ExecutionPolicy Bypass -File gerar_apk.ps1

Write-Host "📱 GERADOR AUTOMÁTICO DE APK" -ForegroundColor Green
Write-Host "============================" -ForegroundColor Green

# Verificar se WSL está instalado
try {
    $wslCheck = wsl --list --verbose 2>$null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ WSL não está instalado!" -ForegroundColor Red
        Write-Host "Execute primeiro: wsl --install" -ForegroundColor Yellow
        Read-Host "Pressione Enter para sair"
        exit 1
    }
} catch {
    Write-Host "❌ WSL não encontrado!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ WSL encontrado!" -ForegroundColor Green

# Verificar se Ubuntu está instalado
$ubuntuInstalled = $false
$distributions = @("Ubuntu", "Ubuntu-20.04", "Ubuntu-22.04")

foreach ($distro in $distributions) {
    try {
        $result = wsl -d $distro echo "test" 2>$null
        if ($LASTEXITCODE -eq 0) {
            $ubuntuDistro = $distro
            $ubuntuInstalled = $true
            Write-Host "✅ $distro encontrado!" -ForegroundColor Green
            break
        }
    } catch {
        continue
    }
}

if (-not $ubuntuInstalled) {
    Write-Host "❌ Ubuntu não encontrado!" -ForegroundColor Red
    Write-Host "Instalando Ubuntu..." -ForegroundColor Yellow
    wsl --install -d Ubuntu-22.04
    Write-Host "⚠️ Reinicie o computador e configure o Ubuntu primeiro!" -ForegroundColor Yellow
    Read-Host "Pressione Enter para sair"
    exit 1
}

Write-Host "`n🔧 CONFIGURANDO AMBIENTE ANDROID..." -ForegroundColor Yellow

# Script para executar no WSL
$wslScript = @'
#!/bin/bash
set -e

echo "🔧 Configurando ambiente..."

# Atualizar sistema
sudo apt update -qq
sudo apt install -y python3-pip openjdk-8-jdk git unzip wget build-essential

# Instalar dependências Python
pip3 install buildozer kivy[base] cython requests

# Criar pasta Android SDK
mkdir -p ~/android-sdk
cd ~/android-sdk

# Baixar SDK se não existir
if [ ! -f "cmdline-tools/latest/bin/sdkmanager" ]; then
    echo "📥 Baixando Android SDK..."
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
    unzip -q commandlinetools-linux-8512546_latest.zip
    mkdir -p cmdline-tools/latest
    mv cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true
    rm -f commandlinetools-linux-8512546_latest.zip
fi

# Configurar variáveis de ambiente
export ANDROID_HOME=~/android-sdk
export ANDROID_SDK_ROOT=~/android-sdk
export PATH=$PATH:~/android-sdk/cmdline-tools/latest/bin
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Adicionar ao bashrc se não existir
if ! grep -q "ANDROID_HOME" ~/.bashrc; then
    echo 'export ANDROID_HOME=~/android-sdk' >> ~/.bashrc
    echo 'export ANDROID_SDK_ROOT=~/android-sdk' >> ~/.bashrc
    echo 'export PATH=$PATH:~/android-sdk/cmdline-tools/latest/bin' >> ~/.bashrc
    echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc
fi

# Instalar componentes SDK
echo "📦 Instalando componentes Android..."
yes | sdkmanager --licenses >/dev/null 2>&1
sdkmanager "platforms;android-30" "build-tools;30.0.3" "platform-tools" >/dev/null 2>&1

echo "✅ Ambiente configurado!"
'@

# Salvar script temporário
$tempScript = "/tmp/setup_android.sh"
$wslScript | wsl -d $ubuntuDistro tee $tempScript > $null
wsl -d $ubuntuDistro chmod +x $tempScript

# Executar configuração
Write-Host "⚡ Executando configuração..." -ForegroundColor Cyan
wsl -d $ubuntuDistro bash $tempScript

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erro na configuração do ambiente!" -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit 1
}

Write-Host "`n📱 CRIANDO PROJETO APK..." -ForegroundColor Yellow

# Criar projeto
$projectScript = @'
#!/bin/bash
set -e

# Criar pasta do projeto
mkdir -p ~/meu-app
cd ~/meu-app

# Criar main.py
cat > main.py << 'EOF'
from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.clock import Clock
from kivy.core.window import Window
import time
import requests

class SpyApp(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(orientation='vertical', **kwargs)
        self.is_monitoring = False
        self.start_time = None
        self.timer_event = None
        
        layout = BoxLayout(orientation='vertical', padding=20, spacing=20)
        
        layout.add_widget(Label(
            text='SPY MOBILE', 
            font_size=30, 
            color=(1,0,0,1), 
            bold=True
        ))
        
        self.timer_label = Label(
            text='00:00:00', 
            font_size=60, 
            color=(0.5,0.5,0.5,1),
            bold=True
        )
        layout.add_widget(self.timer_label)
        
        self.status_label = Label(
            text='Sistema Parado', 
            font_size=18,
            color=(0.7,0,0,1)
        )
        layout.add_widget(self.status_label)
        
        buttons = BoxLayout(orientation='horizontal', size_hint_y=0.3, spacing=10)
        
        self.play_btn = Button(
            text='PLAY', 
            font_size=20, 
            background_color=(0,0.8,0,1),
            bold=True
        )
        self.play_btn.bind(on_press=self.start)
        buttons.add_widget(self.play_btn)
        
        self.stop_btn = Button(
            text='STOP', 
            font_size=20, 
            background_color=(0.8,0,0,1),
            bold=True,
            disabled=True
        )
        self.stop_btn.bind(on_press=self.stop)
        buttons.add_widget(self.stop_btn)
        
        layout.add_widget(buttons)
        layout.add_widget(Label(
            text='Sistema de Monitoramento', 
            font_size=14,
            color=(0.5,0.5,0.5,1)
        ))
        
        self.add_widget(layout)

    def start(self, btn):
        if not self.is_monitoring:
            self.is_monitoring = True
            self.start_time = time.time()
            self.status_label.text = 'Monitorando...'
            self.timer_label.color = (1,0,0,1)
            self.play_btn.disabled = True
            self.stop_btn.disabled = False
            self.timer_event = Clock.schedule_interval(self.update_timer, 1)
            self.collect_data()

    def stop(self, btn):
        if self.is_monitoring:
            self.is_monitoring = False
            if self.timer_event:
                self.timer_event.cancel()
            self.status_label.text = 'Sistema Parado'
            self.timer_label.color = (0.5,0.5,0.5,1)
            self.timer_label.text = '00:00:00'
            self.play_btn.disabled = False
            self.stop_btn.disabled = True

    def update_timer(self, dt):
        if self.is_monitoring and self.start_time:
            elapsed = int(time.time() - self.start_time)
            h, m, s = elapsed//3600, (elapsed%3600)//60, elapsed%60
            self.timer_label.text = f'{h:02d}:{m:02d}:{s:02d}'

    def collect_data(self):
        try:
            data = {
                'device': 'spy_mobile',
                'timestamp': time.time(),
                'status': 'active'
            }
            
            try:
                response = requests.post(
                    'http://192.168.0.97:8000/api/data/', 
                    json=data, 
                    timeout=3
                )
                if response.status_code == 200:
                    self.status_label.text = 'Dados Enviados!'
                else:
                    self.status_label.text = 'Coletando (Offline)'
            except:
                self.status_label.text = 'Coletando (Offline)'
                
        except Exception as e:
            self.status_label.text = f'Erro: {str(e)[:30]}'

class SpyMobileApp(App):
    def build(self):
        Window.clearcolor = (0, 0, 0, 1)
        return SpyApp()

if __name__ == '__main__':
    SpyMobileApp().run()
EOF

# Criar buildozer.spec
cat > buildozer.spec << 'EOF'
[app]
title = Spy Mobile
package.name = spymobile
package.domain = org.spy
source.dir = .
version = 1.0
requirements = python3,kivy,requests
orientation = portrait
android.api = 30
android.minapi = 21
android.archs = arm64-v8a
android.release_artifact = apk

[buildozer]
log_level = 1
warn_on_root = 0

[app:android.permissions]
INTERNET = 1
ACCESS_NETWORK_STATE = 1
ACCESS_FINE_LOCATION = 1
READ_EXTERNAL_STORAGE = 1
CAMERA = 1
EOF

echo "✅ Projeto criado!"
'@

$tempProjectScript = "/tmp/create_project.sh"
$projectScript | wsl -d $ubuntuDistro tee $tempProjectScript > $null
wsl -d $ubuntuDistro chmod +x $tempProjectScript
wsl -d $ubuntuDistro bash $tempProjectScript

Write-Host "`n🔥 GERANDO APK..." -ForegroundColor Red
Write-Host "⏰ Este processo pode levar 15-20 minutos..." -ForegroundColor Yellow
Write-Host "☕ Vá tomar um café e aguarde..." -ForegroundColor Cyan

# Gerar APK
$buildScript = @'
#!/bin/bash
cd ~/meu-app

# Configurar ambiente
export ANDROID_HOME=~/android-sdk
export ANDROID_SDK_ROOT=~/android-sdk
export PATH=$PATH:~/android-sdk/cmdline-tools/latest/bin
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

echo "🔥 Iniciando build do APK..."
buildozer android debug

if [ $? -eq 0 ]; then
    echo "✅ APK gerado com sucesso!"
    ls -la bin/
    
    # Copiar para Desktop do Windows
    if [ -f bin/*.apk ]; then
        cp bin/*.apk /mnt/c/Users/$USER/Desktop/SpyMobile.apk 2>/dev/null || cp bin/*.apk /mnt/c/Users/*/Desktop/SpyMobile.apk 2>/dev/null
        echo "🎉 APK copiado para Desktop do Windows!"
    fi
else
    echo "❌ Erro na geração do APK!"
    exit 1
fi
'@

$tempBuildScript = "/tmp/build_apk.sh"
$buildScript | wsl -d $ubuntuDistro tee $tempBuildScript > $null
wsl -d $ubuntuDistro chmod +x $tempBuildScript

$startTime = Get-Date
wsl -d $ubuntuDistro bash $tempBuildScript
$endTime = Get-Date
$duration = ($endTime - $startTime).TotalMinutes

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n🎉 APK GERADO COM SUCESSO!" -ForegroundColor Green
    Write-Host "⏱️ Tempo total: $([math]::Round($duration, 1)) minutos" -ForegroundColor Cyan
    Write-Host "📱 APK salvo em: Desktop\SpyMobile.apk" -ForegroundColor Yellow
    Write-Host "`n📋 PRÓXIMOS PASSOS:" -ForegroundColor Yellow
    Write-Host "1. Transfira o APK para seu Android" -ForegroundColor White
    Write-Host "2. Habilite 'Fontes desconhecidas' no Android" -ForegroundColor White
    Write-Host "3. Instale o APK normalmente" -ForegroundColor White
    Write-Host "4. Configure o IP do servidor no código se necessário" -ForegroundColor White
} else {
    Write-Host "`n❌ ERRO NA GERAÇÃO DO APK!" -ForegroundColor Red
    Write-Host "Verifique os logs acima para mais detalhes" -ForegroundColor Yellow
}

# Limpar arquivos temporários
wsl -d $ubuntuDistro rm -f /tmp/setup_android.sh /tmp/create_project.sh /tmp/build_apk.sh

Read-Host "`nPressione Enter para sair"
