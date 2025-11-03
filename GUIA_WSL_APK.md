# 🐧 GERAR APK NO WINDOWS COM WSL2 (MAIS FÁCIL)

## 🔄 DESINSTALAR WSL ANTIGO E INSTALAR WSL2 LIMPO

### PASSO 1 - Remover WSL Antigo
```cmd
# Execute como Administrador no PowerShell:
wsl --list --verbose
wsl --unregister Ubuntu
wsl --unregister Ubuntu-20.04
wsl --unregister Ubuntu-22.04
# Remove todas as distribuições listadas
```

### PASSO 2 - Desabilitar WSL
```cmd
# No PowerShell como Administrador:
dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /disable-feature /featurename:VirtualMachinePlatform /all /norestart
# Reinicie o computador
```

### PASSO 3 - Instalar WSL2 Limpo
```cmd
# Após reiniciar, no PowerShell como Administrador:
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
# Reinicie novamente
```

### PASSO 4 - Configurar WSL2 como Padrão
```cmd
# Baixar e instalar kernel WSL2:
# https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

# Definir WSL2 como padrão:
wsl --set-default-version 2

# Instalar Ubuntu 22.04:
wsl --install -d Ubuntu-22.04
```

### PASSO 5 - Configurar Ubuntu
```bash
# Após reiniciar, abra Ubuntu e execute:
sudo apt update && sudo apt upgrade -y
sudo apt install python3-pip openjdk-8-jdk git unzip wget -y
```

### PASSO 6 - Instalar Buildozer
```bash
pip3 install buildozer kivy[base] cython requests
```

### PASSO 7 - Baixar Android SDK
```bash
# Criar pasta e baixar SDK
mkdir -p ~/android-sdk
cd ~/android-sdk
wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
unzip commandlinetools-linux-8512546_latest.zip
mkdir -p cmdline-tools/latest
mv cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true
```

### PASSO 8 - Configurar Ambiente
```bash
# Adicionar ao ~/.bashrc
echo 'export ANDROID_HOME=~/android-sdk' >> ~/.bashrc
echo 'export ANDROID_SDK_ROOT=~/android-sdk' >> ~/.bashrc
echo 'export PATH=$PATH:~/android-sdk/cmdline-tools/latest/bin' >> ~/.bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc
source ~/.bashrc
```

### PASSO 9 - Instalar SDK Components
```bash
# Aceitar licenças e instalar componentes
yes | sdkmanager --licenses
sdkmanager "platforms;android-30" "build-tools;30.0.3" "platform-tools"
```

### PASSO 10 - Criar Projeto
```bash
# Criar pasta do projeto
mkdir ~/meu-app
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
            
            # ALTERE O IP AQUI ⬇️
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
log_level = 2
warn_on_root = 0

[app:android.permissions]
INTERNET = 1
ACCESS_NETWORK_STATE = 1
ACCESS_FINE_LOCATION = 1
READ_EXTERNAL_STORAGE = 1
CAMERA = 1
EOF

echo "✅ Projeto criado!"
```

### PASSO 11 - Gerar APK
```bash
# Gerar APK (aguarde 15-20 minutos)
buildozer android debug

# Verificar se APK foi gerado
ls -la bin/
```

### PASSO 12 - Copiar APK para Windows
```bash
# Copiar APK para área de trabalho do Windows
cp bin/*.apk /mnt/c/Users/$USER/Desktop/SpyMobile.apk
echo "🎉 APK copiado para Desktop do Windows!"
```

## 🎯 VANTAGENS DO WSL:

✅ **Mais confiável** - Buildozer funciona melhor no Linux  
✅ **Mais rápido** - Compilação mais eficiente  
✅ **Menos erros** - Ambiente nativo do Buildozer  
✅ **Fácil acesso** - APK vai direto para Desktop do Windows  

## 🔧 COMANDOS ÚTEIS:

### Testar app no WSL:
```bash
python3 main.py
```

### Limpar build anterior:
```bash
buildozer android clean
```

### Gerar APK release:
```bash
buildozer android release
```

### Acessar arquivos do Windows no WSL:
```bash
cd /mnt/c/Users/SeuUsuario/Desktop/
```

### Acessar arquivos do WSL no Windows:
```
\\wsl$\Ubuntu\home\seuusuario\meu-app
```

## ⚡ RESUMO RÁPIDO:

1. **Remover WSL antigo**: Passos 1-2
2. **Instalar WSL2**: Passos 3-4  
3. **Configurar ambiente**: Passos 5-9
4. **Criar projeto**: Passo 10
5. **Gerar APK**: Passo 11
6. **Copiar para Windows**: Passo 12

## 🚀 COMANDOS RÁPIDOS (Copie e cole):

### Remover WSL antigo:
```cmd
wsl --list --verbose
wsl --unregister Ubuntu
dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /disable-feature /featurename:VirtualMachinePlatform /all /norestart
# Reiniciar
```

### Instalar WSL2:
```cmd
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
# Reiniciar e baixar kernel WSL2
wsl --set-default-version 2
wsl --install -d Ubuntu-22.04
```

### Setup completo Ubuntu:
```bash
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
```

## 🎉 RESULTADO:
- **APK funcional** na sua área de trabalho
- **Processo mais estável** que Windows nativo
- **Fácil de repetir** para novos projetos

## 💡 VERIFICAR WSL2:
```cmd
# Verificar se WSL2 está ativo:
wsl --list --verbose
# Deve mostrar VERSION 2
```

## 🔧 SOLUÇÃO DE PROBLEMAS:

### WSL não inicia:
```cmd
# Reiniciar serviço WSL:
wsl --shutdown
wsl
```

### Erro de virtualização:
```cmd
# Habilitar no BIOS:
# - Virtualization Technology
# - Hyper-V
```

### Performance lenta:
```bash
# No Ubuntu, limitar uso de RAM:
echo '[wsl2]' >> /mnt/c/Users/$USER/.wslconfig
echo 'memory=4GB' >> /mnt/c/Users/$USER/.wslconfig
echo 'processors=2' >> /mnt/c/Users/$USER/.wslconfig
```