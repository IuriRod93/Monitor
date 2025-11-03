# 🚀 GERAR APK NO GOOGLE COLAB - VERSÃO CORRIGIDA

## ⚡ APENAS 2 CÉLULAS QUE FUNCIONAM:

### CÉLULA 1 - Setup Completo (5 minutos)
```python
# Desabilitar GPU para evitar conflitos
import os
os.environ['CUDA_VISIBLE_DEVICES'] = ''
os.environ['NVIDIA_VISIBLE_DEVICES'] = ''

# Instalar dependências
!apt update -qq
!apt install -y openjdk-8-jdk unzip wget git build-essential
!pip install buildozer==1.4.0 kivy==2.1.0 requests cython==0.29.33

# Configurar Java 8 (mais compatível)
os.environ['JAVA_HOME'] = '/usr/lib/jvm/java-8-openjdk-amd64'

# Baixar e configurar Android SDK
!wget -q https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip -O /tmp/sdk.zip
!mkdir -p /content/android-sdk
!cd /content/android-sdk && unzip -q /tmp/sdk.zip
!mkdir -p /content/android-sdk/cmdline-tools/latest
!mv /content/android-sdk/cmdline-tools/* /content/android-sdk/cmdline-tools/latest/ 2>/dev/null || true

# Baixar Android NDK
!wget -q https://dl.google.com/android/repository/android-ndk-r25b-linux.zip -O /tmp/ndk.zip
!cd /content && unzip -q /tmp/ndk.zip
!mv /content/android-ndk-r25b /content/android-ndk

# Configurar variáveis de ambiente
os.environ.update({
    'ANDROID_HOME': '/content/android-sdk',
    'ANDROID_SDK_ROOT': '/content/android-sdk',
    'ANDROID_NDK_HOME': '/content/android-ndk',
    'NDK_HOME': '/content/android-ndk',
    'PATH': os.environ['PATH'] + ':/content/android-sdk/cmdline-tools/latest/bin:/content/android-sdk/platform-tools'
})

# Aceitar licenças
!yes | /content/android-sdk/cmdline-tools/latest/bin/sdkmanager --licenses
!/content/android-sdk/cmdline-tools/latest/bin/sdkmanager "platforms;android-30" "build-tools;30.0.3" "platform-tools"

print("✅ Setup completo!")
```

### CÉLULA 2 - Criar e Gerar APK (20-25 minutos)
```python
# Limpar espaço
!rm -rf /content/sample_data
!df -h

# Criar projeto
!mkdir -p /content/app
%cd /content/app

# Criar main.py
with open('/content/app/main.py', 'w') as f:
    f.write('''from kivy.app import App
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
''')

# Criar buildozer.spec otimizado
with open('buildozer.spec', 'w') as f:
    f.write('''[app]
title = Spy Mobile
package.name = spymobile
package.domain = org.spy
source.dir = .
version = 1.0
requirements = python3,kivy==2.1.0,requests
orientation = portrait
android.api = 30
android.minapi = 21
android.ndk = 25b
android.sdk = 30
android.archs = armeabi-v7a
android.release_artifact = apk
android.accept_sdk_license = True

[buildozer]
log_level = 2
warn_on_root = 0

[app:android.permissions]
INTERNET = 1
ACCESS_NETWORK_STATE = 1
''')

# Reconfigurar ambiente
import os
os.environ.update({
    'ANDROID_HOME': '/content/android-sdk',
    'ANDROID_SDK_ROOT': '/content/android-sdk',
    'ANDROID_NDK_HOME': '/content/android-ndk',
    'NDK_HOME': '/content/android-ndk',
    'JAVA_HOME': '/usr/lib/jvm/java-8-openjdk-amd64',
    'CUDA_VISIBLE_DEVICES': '',
    'NVIDIA_VISIBLE_DEVICES': ''
})

# Gerar APK com configurações específicas
print("🔥 GERANDO APK... Aguarde 20-25 minutos ⏰")
!buildozer android debug --verbose

# Verificar e copiar APK
import glob
apk_files = glob.glob('bin/*.apk')
if apk_files:
    !cp {apk_files[0]} /content/SpyMobile.apk
    import os
    size = os.path.getsize('/content/SpyMobile.apk') / (1024*1024)
    print(f"\n🎉 APK PRONTO! Tamanho: {size:.1f}MB")
    print("📱 Baixe: Pasta (📁) → SpyMobile.apk → (...) → Download")
else:
    print("❌ Erro na geração. Execute novamente.")
```

## 🚀 COMO USAR:

1. **Abra Google Colab** → colab.research.google.com
2. **Mude para CPU** (Runtime → Change runtime type → CPU)
3. **Crie novo notebook**
4. **Cole as 2 células**
5. **Execute na ordem** (Shift+Enter)
6. **Aguarde 25 minutos** na célula 2
7. **Baixe o APK**

## ⚡ CORREÇÕES APLICADAS:

✅ **GPU desabilitada** - evita conflitos  
✅ **Java 8** - mais compatível que Java 11  
✅ **Versões fixas** - buildozer 1.4.0 + kivy 2.1.0  
✅ **NDK incluído** - download automático  
✅ **Arquitetura ARM** - mais compatível  
✅ **Apenas 2 células** - processo simplificado  

## 🔧 SE AINDA DER ERRO:

### Erro de GPU:
```python
# Certifique-se que está usando CPU:
# Runtime → Change runtime type → CPU
```

### Erro de espaço:
```python
# Limpar mais espaço:
!rm -rf /root/.cache
!rm -rf /tmp/*
!df -h
```

### Buildozer falha:
```python
# Tentar com versão anterior:
!pip install buildozer==1.3.0
%cd /content/app
!buildozer android debug
```

### Último recurso:
```python
# Reiniciar runtime e executar novamente
# Runtime → Restart runtime
```

## 📱 PERSONALIZAR APP:

### Mudar nome:
```python
# Na célula 3, altere:
title = Meu App
package.name = meuapp
```

### Mudar IP do servidor:
```python
# Na célula 3, altere a linha:
'http://SEU_IP_AQUI:8000/api/data/'
```

### Adicionar permissões:
```python
# Na buildozer.spec, adicione:
READ_CONTACTS = 1
CAMERA = 1
```

## 🎯 RESULTADO:

- **APK funcional** em 20 minutos
- **App com timer** e botões PLAY/STOP
- **Conexão com servidor** Django
- **Pronto para instalar** no Android

## ⏰ TEMPO TOTAL: ~30 minutos

- Célula 1: 5 minutos (setup completo)
- Célula 2: 25 minutos (geração APK)

## ⚠️ IMPORTANTE:
- **Use runtime CPU** (não GPU)
- **Não feche o navegador** durante o processo
- **Aguarde terminar** antes de executar outras células

**Muito mais simples que antes!** 🚀