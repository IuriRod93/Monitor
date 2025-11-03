# 📱 GERAR APK NO WINDOWS - TUTORIAL SIMPLES

## 🚀 PASSO A PASSO PARA WINDOWS:

### PASSO 1 - Instalar Python e Git
```cmd
# Baixe e instale:
# Python 3.9+ → https://python.org/downloads/
# Git → https://git-scm.com/download/win

# Teste no CMD:
python --version
git --version
```

### PASSO 2 - Instalar Kivy e Buildozer
```cmd
pip install kivy[base] kivymd buildozer cython
pip install python-for-android
```

### PASSO 3 - Baixar Android SDK
```cmd
# Crie pasta:
mkdir C:\android-sdk
cd C:\android-sdk

# Baixe manualmente:
# https://developer.android.com/studio#command-tools
# Extraia em C:\android-sdk\cmdline-tools\latest\
```

### PASSO 4 - Configurar Variáveis de Ambiente
```cmd
# Adicione no PATH do Windows:
C:\android-sdk\cmdline-tools\latest\bin
C:\android-sdk\platform-tools

# Crie variáveis:
ANDROID_HOME = C:\android-sdk
ANDROID_SDK_ROOT = C:\android-sdk
```

### PASSO 5 - Instalar SDK Components
```cmd
sdkmanager "platforms;android-30" "build-tools;30.0.3" "platform-tools"
sdkmanager --licenses
```

### PASSO 6 - Criar Projeto
```cmd
mkdir C:\meu-app
cd C:\meu-app
```

### PASSO 7 - Criar main.py
```python
# Salve como main.py:
from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.clock import Clock
import time
import requests

class SpyApp(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(orientation='vertical', **kwargs)
        self.is_monitoring = False
        self.start_time = None
        
        layout = BoxLayout(orientation='vertical', padding=20, spacing=20)
        layout.add_widget(Label(text='SPY MOBILE', font_size=30, color=(1,0,0,1)))
        
        self.timer_label = Label(text='00:00:00', font_size=60, bold=True)
        layout.add_widget(self.timer_label)
        
        self.status_label = Label(text='Parado', font_size=18)
        layout.add_widget(self.status_label)
        
        buttons = BoxLayout(orientation='horizontal', size_hint_y=0.3)
        
        self.play_btn = Button(text='PLAY', font_size=20, background_color=(0,0.8,0,1))
        self.play_btn.bind(on_press=self.start)
        buttons.add_widget(self.play_btn)
        
        self.stop_btn = Button(text='STOP', font_size=20, background_color=(0.8,0,0,1))
        self.stop_btn.bind(on_press=self.stop)
        buttons.add_widget(self.stop_btn)
        
        layout.add_widget(buttons)
        self.add_widget(layout)

    def start(self, btn):
        self.is_monitoring = True
        self.start_time = time.time()
        self.status_label.text = 'Monitorando...'
        Clock.schedule_interval(self.update_timer, 1)

    def stop(self, btn):
        self.is_monitoring = False
        self.status_label.text = 'Parado'
        self.timer_label.text = '00:00:00'

    def update_timer(self, dt):
        if self.is_monitoring and self.start_time:
            elapsed = int(time.time() - self.start_time)
            h, m, s = elapsed//3600, (elapsed%3600)//60, elapsed%60
            self.timer_label.text = f'{h:02d}:{m:02d}:{s:02d}'

class SpyMobileApp(App):
    def build(self):
        return SpyApp()

SpyMobileApp().run()
```

### PASSO 8 - Criar buildozer.spec
```ini
# Salve como buildozer.spec:
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
```

### PASSO 9 - Gerar APK
```cmd
# No diretório do projeto:
buildozer android debug

# APK será gerado em:
# bin\spymobile-1.0-arm64-v8a-debug.apk
```

## ⚠️ PROBLEMAS COMUNS:

### Erro de Java:
```cmd
# Instale OpenJDK 8:
# https://adoptium.net/temurin/releases/
# Configure JAVA_HOME
```

### Erro de NDK:
```cmd
# Baixe Android NDK:
# https://developer.android.com/ndk/downloads
# Extraia em C:\android-ndk
# Configure NDK_HOME = C:\android-ndk
```

### Buildozer não funciona:
```cmd
# Use WSL (Windows Subsystem for Linux):
wsl --install
# Depois use comandos Linux no WSL
```

## 🔧 ALTERNATIVA MAIS FÁCIL - WSL:

### Instalar WSL:
```cmd
wsl --install Ubuntu
```

### No WSL Ubuntu:
```bash
sudo apt update
sudo apt install python3-pip openjdk-8-jdk
pip3 install buildozer kivy

# Criar projeto e gerar APK normalmente
buildozer android debug
```

## 📱 RESULTADO:
- **APK gerado** em `bin/` 
- **Instale no Android** habilitando "Fontes desconhecidas"
- **App funcional** com timer e botões

## ⚡ RESUMO RÁPIDO:
1. **Instalar** Python + Git
2. **Baixar** Android SDK
3. **Configurar** variáveis de ambiente  
4. **Criar** main.py + buildozer.spec
5. **Executar** `buildozer android debug`
6. **APK pronto!**