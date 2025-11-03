# 🚀 SCRIPT AUTOMÁTICO PARA GERAR APK NO WINDOWS
# Execute como Administrador: PowerShell -ExecutionPolicy Bypass -File setup_apk_windows.ps1

Write-Host "🚀 CONFIGURANDO AMBIENTE APK NO WINDOWS" -ForegroundColor Green
Write-Host "=======================================" -ForegroundColor Green

# Verificar se Python está instalado
Write-Host "`n📦 Verificando Python..." -ForegroundColor Yellow
try {
    $pythonVersion = python --version 2>&1
    Write-Host "✅ Python encontrado: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Python não encontrado. Instale Python 3.9+ de https://python.org" -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit 1
}

# Instalar dependências Python
Write-Host "`n📦 Instalando dependências Python..." -ForegroundColor Yellow
pip install kivy[base] kivymd buildozer cython python-for-android requests
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erro na instalação das dependências" -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit 1
}

# Criar estrutura de pastas
Write-Host "`n📁 Criando estrutura de pastas..." -ForegroundColor Yellow
$androidSdkPath = "C:\android-sdk"
$cmdlineToolsPath = "$androidSdkPath\cmdline-tools\latest"

if (!(Test-Path $androidSdkPath)) { New-Item -ItemType Directory -Path $androidSdkPath -Force }
if (!(Test-Path $cmdlineToolsPath)) { New-Item -ItemType Directory -Path $cmdlineToolsPath -Force }

# Baixar Android SDK Command Line Tools
Write-Host "`n📱 Baixando Android SDK..." -ForegroundColor Yellow
$sdkUrl = "https://dl.google.com/android/repository/commandlinetools-win-8512546_latest.zip"
$sdkZip = "$env:TEMP\commandlinetools.zip"

try {
    Invoke-WebRequest -Uri $sdkUrl -OutFile $sdkZip -UseBasicParsing
    Write-Host "✅ SDK baixado com sucesso" -ForegroundColor Green
    
    # Extrair SDK
    Write-Host "📦 Extraindo SDK..." -ForegroundColor Yellow
    Expand-Archive -Path $sdkZip -DestinationPath $androidSdkPath -Force
    
    # Mover arquivos para estrutura correta
    $extractedPath = "$androidSdkPath\cmdline-tools"
    if (Test-Path "$extractedPath\bin") {
        Move-Item "$extractedPath\*" $cmdlineToolsPath -Force
    }
    
    Write-Host "✅ SDK extraído e configurado" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro ao baixar SDK: $_" -ForegroundColor Red
    Write-Host "Baixe manualmente de: https://developer.android.com/studio#command-tools" -ForegroundColor Yellow
}

# Configurar variáveis de ambiente
Write-Host "`n🔧 Configurando variáveis de ambiente..." -ForegroundColor Yellow
[Environment]::SetEnvironmentVariable("ANDROID_HOME", $androidSdkPath, "User")
[Environment]::SetEnvironmentVariable("ANDROID_SDK_ROOT", $androidSdkPath, "User")

$currentPath = [Environment]::GetEnvironmentVariable("PATH", "User")
$newPaths = @(
    "$cmdlineToolsPath\bin",
    "$androidSdkPath\platform-tools"
)

foreach ($newPath in $newPaths) {
    if ($currentPath -notlike "*$newPath*") {
        $currentPath += ";$newPath"
    }
}

[Environment]::SetEnvironmentVariable("PATH", $currentPath, "User")
Write-Host "✅ Variáveis de ambiente configuradas" -ForegroundColor Green

# Criar projeto de exemplo
Write-Host "`n📱 Criando projeto de exemplo..." -ForegroundColor Yellow
$projectPath = ".\meu-app"
if (!(Test-Path $projectPath)) { New-Item -ItemType Directory -Path $projectPath }
Set-Location $projectPath

# Criar main.py
$mainPyContent = @'
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
        
        # Título
        layout.add_widget(Label(
            text='SPY MOBILE', 
            font_size=30, 
            color=(1,0,0,1), 
            bold=True
        ))
        
        # Timer
        self.timer_label = Label(
            text='00:00:00', 
            font_size=60, 
            color=(0.5,0.5,0.5,1),
            bold=True
        )
        layout.add_widget(self.timer_label)
        
        # Status
        self.status_label = Label(
            text='Sistema Parado', 
            font_size=18,
            color=(0.7,0,0,1)
        )
        layout.add_widget(self.status_label)
        
        # Botões
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
        
        # Info
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
            self.status_label.text = 'Monitorando Dispositivo...'
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
            # Simular coleta de dados
            data = {
                'device': 'spy_mobile',
                'timestamp': time.time(),
                'status': 'active'
            }
            
            # Tentar enviar para servidor (altere o IP)
            try:
                response = requests.post(
                    'http://192.168.0.97:8000/api/data/', 
                    json=data, 
                    timeout=3
                )
                if response.status_code == 200:
                    self.status_label.text = 'Dados Enviados com Sucesso!'
                else:
                    self.status_label.text = 'Coletando Dados (Servidor Offline)'
            except:
                self.status_label.text = 'Coletando Dados (Servidor Offline)'
                
        except Exception as e:
            self.status_label.text = f'Erro: {str(e)[:30]}'

class SpyMobileApp(App):
    def build(self):
        Window.clearcolor = (0, 0, 0, 1)  # Fundo preto
        return SpyApp()

if __name__ == '__main__':
    SpyMobileApp().run()
'@

$mainPyContent | Out-File -FilePath "main.py" -Encoding UTF8

# Criar buildozer.spec
$buildozerSpecContent = @'
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
log_level = 2
warn_on_root = 0

[app:android.permissions]
INTERNET = 1
ACCESS_NETWORK_STATE = 1
ACCESS_FINE_LOCATION = 1
READ_EXTERNAL_STORAGE = 1
CAMERA = 1
'@

$buildozerSpecContent | Out-File -FilePath "buildozer.spec" -Encoding UTF8

Write-Host "✅ Projeto criado com sucesso!" -ForegroundColor Green

# Instruções finais
Write-Host "`n🎉 CONFIGURAÇÃO CONCLUÍDA!" -ForegroundColor Green
Write-Host "=========================" -ForegroundColor Green
Write-Host "`n📋 PRÓXIMOS PASSOS:" -ForegroundColor Yellow
Write-Host "1. Reinicie o PowerShell/CMD para carregar as variáveis de ambiente"
Write-Host "2. Navegue até a pasta: $(Get-Location)"
Write-Host "3. Execute: sdkmanager `"platforms;android-30`" `"build-tools;30.0.3`""
Write-Host "4. Execute: sdkmanager --licenses (aceite todas as licenças)"
Write-Host "5. Execute: buildozer android debug"
Write-Host "`n📱 O APK será gerado na pasta bin/"
Write-Host "`n⚠️  IMPORTANTE: Se buildozer não funcionar, use WSL (Windows Subsystem for Linux)"
Write-Host "`n✅ Seu projeto está pronto em: $(Get-Location)"

Read-Host "`nPressione Enter para sair"