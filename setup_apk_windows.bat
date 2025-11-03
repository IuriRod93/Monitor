@echo off
echo 🚀 CONFIGURANDO AMBIENTE APK NO WINDOWS
echo =====================================

echo.
echo 📦 PASSO 1: Instalando dependências Python...
pip install kivy[base] kivymd buildozer cython python-for-android requests
if %errorlevel% neq 0 (
    echo ❌ Erro na instalação do Python. Instale Python 3.9+ primeiro.
    pause
    exit /b 1
)

echo.
echo 📁 PASSO 2: Criando estrutura de pastas...
if not exist "C:\android-sdk" mkdir "C:\android-sdk"
if not exist "C:\android-sdk\cmdline-tools" mkdir "C:\android-sdk\cmdline-tools"
if not exist "C:\android-sdk\cmdline-tools\latest" mkdir "C:\android-sdk\cmdline-tools\latest"

echo.
echo 🔧 PASSO 3: Configurando variáveis de ambiente...
setx ANDROID_HOME "C:\android-sdk"
setx ANDROID_SDK_ROOT "C:\android-sdk"
setx PATH "%PATH%;C:\android-sdk\cmdline-tools\latest\bin;C:\android-sdk\platform-tools"

echo.
echo 📱 PASSO 4: Criando projeto de exemplo...
if not exist "meu-app" mkdir "meu-app"
cd meu-app

echo Criando main.py...
(
echo from kivy.app import App
echo from kivy.uix.boxlayout import BoxLayout
echo from kivy.uix.label import Label
echo from kivy.uix.button import Button
echo from kivy.clock import Clock
echo import time
echo.
echo class SpyApp^(BoxLayout^):
echo     def __init__^(self, **kwargs^):
echo         super^(^).__init__^(orientation='vertical', **kwargs^)
echo         self.is_monitoring = False
echo         self.start_time = None
echo         
echo         layout = BoxLayout^(orientation='vertical', padding=20, spacing=20^)
echo         layout.add_widget^(Label^(text='SPY MOBILE', font_size=30, color=^(1,0,0,1^)^)^)
echo         
echo         self.timer_label = Label^(text='00:00:00', font_size=60, bold=True^)
echo         layout.add_widget^(self.timer_label^)
echo         
echo         self.status_label = Label^(text='Parado', font_size=18^)
echo         layout.add_widget^(self.status_label^)
echo         
echo         buttons = BoxLayout^(orientation='horizontal', size_hint_y=0.3^)
echo         
echo         self.play_btn = Button^(text='PLAY', font_size=20, background_color=^(0,0.8,0,1^)^)
echo         self.play_btn.bind^(on_press=self.start^)
echo         buttons.add_widget^(self.play_btn^)
echo         
echo         self.stop_btn = Button^(text='STOP', font_size=20, background_color=^(0.8,0,0,1^)^)
echo         self.stop_btn.bind^(on_press=self.stop^)
echo         buttons.add_widget^(self.stop_btn^)
echo         
echo         layout.add_widget^(buttons^)
echo         self.add_widget^(layout^)
echo.
echo     def start^(self, btn^):
echo         self.is_monitoring = True
echo         self.start_time = time.time^(^)
echo         self.status_label.text = 'Monitorando...'
echo         Clock.schedule_interval^(self.update_timer, 1^)
echo.
echo     def stop^(self, btn^):
echo         self.is_monitoring = False
echo         self.status_label.text = 'Parado'
echo         self.timer_label.text = '00:00:00'
echo.
echo     def update_timer^(self, dt^):
echo         if self.is_monitoring and self.start_time:
echo             elapsed = int^(time.time^(^) - self.start_time^)
echo             h, m, s = elapsed//3600, ^(elapsed%%3600^)//60, elapsed%%60
echo             self.timer_label.text = f'{h:02d}:{m:02d}:{s:02d}'
echo.
echo class SpyMobileApp^(App^):
echo     def build^(self^):
echo         return SpyApp^(^)
echo.
echo SpyMobileApp^(^).run^(^)
) > main.py

echo Criando buildozer.spec...
(
echo [app]
echo title = Spy Mobile
echo package.name = spymobile
echo package.domain = org.spy
echo source.dir = .
echo version = 1.0
echo requirements = python3,kivy,requests
echo orientation = portrait
echo android.api = 30
echo android.minapi = 21
echo android.archs = arm64-v8a
echo android.release_artifact = apk
echo.
echo [buildozer]
echo log_level = 2
echo warn_on_root = 0
echo.
echo [app:android.permissions]
echo INTERNET = 1
echo ACCESS_NETWORK_STATE = 1
) > buildozer.spec

echo.
echo ✅ CONFIGURAÇÃO CONCLUÍDA!
echo.
echo 📋 PRÓXIMOS PASSOS:
echo 1. Baixe Android SDK Command Line Tools de:
echo    https://developer.android.com/studio#command-tools
echo 2. Extraia em C:\android-sdk\cmdline-tools\latest\
echo 3. Reinicie o CMD para carregar variáveis de ambiente
echo 4. Execute: sdkmanager "platforms;android-30" "build-tools;30.0.3"
echo 5. Execute: buildozer android debug
echo.
echo 📱 Seu projeto está em: %cd%
echo.
pause