#!/bin/bash
set -e

echo "🚀 GERANDO APK NO CODESPACES"
echo "============================"

if [ ! -f "main.py" ]; then
    echo "❌ main.py não encontrado! Criando..."
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

class SpyMobileApp(App):
    def build(self):
        Window.clearcolor = (0, 0, 0, 1)
        return SpyApp()

if __name__ == '__main__':
    SpyMobileApp().run()
EOF
fi

if [ ! -f "buildozer.spec" ]; then
    echo "❌ buildozer.spec não encontrado! Criando..."
    cat > buildozer.spec << 'EOF'
[app]
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
EOF
fi

# Configurar ambiente
export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_NDK_HOME=/opt/android-ndk
export NDK_HOME=/opt/android-ndk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:/opt/android-sdk/cmdline-tools/latest/bin:/opt/android-sdk/platform-tools

echo "✅ Arquivos verificados"
echo "🔧 Ambiente configurado"
echo "📱 Iniciando build... (20-25 minutos)"

# Limpar build anterior
buildozer android clean

# Gerar APK
buildozer android debug --verbose

# Verificar resultado
if ls bin/*.apk 1> /dev/null 2>&1; then
    APK_FILE=$(ls bin/*.apk | head -1)
    APK_SIZE=$(du -h "$APK_FILE" | cut -f1)
    echo ""
    echo "🎉 APK GERADO COM SUCESSO!"
    echo "📱 Arquivo: $APK_FILE"
    echo "📏 Tamanho: $APK_SIZE"
    echo ""
    echo "📥 Para baixar:"
    echo "1. Clique no arquivo na pasta bin/"
    echo "2. Clique nos 3 pontos (...)"
    echo "3. Selecione 'Download'"
else
    echo "❌ Erro na geração do APK"
    echo "📋 Logs em .buildozer/android/platform/build-*/logs/"
    exit 1
fi