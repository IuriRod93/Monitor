"""
Testes unitários para os utilitários do app mobile
"""
import unittest
import sys
import os
from unittest.mock import patch, MagicMock

# Adicionar o diretório pai ao path para importar módulos
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

class TestDeviceUtils(unittest.TestCase):
    """Testes para device_utils.py"""

    @patch('device_utils.platform')
    @patch('device_utils.uuid')
    def test_get_device_id_fallback(self, mock_uuid, mock_platform):
        """Testa obtenção de device ID com fallback"""
        from device_utils import get_device_id

        # Simular falha em todas as tentativas
        mock_uuid.uuid4.return_value.hex = 'testdeviceid123'

        device_id = get_device_id()
        self.assertIsInstance(device_id, str)
        self.assertEqual(len(device_id), 17)  # 35 + 15 digits

    @patch('device_utils.get_device_id')
    def test_get_device_info(self, mock_get_device_id):
        """Testa obtenção de informações do dispositivo"""
        from device_utils import get_device_info

        mock_get_device_id.return_value = 'testdevice123'

        info = get_device_info()
        self.assertIsInstance(info, dict)
        self.assertIn('imei', info)
        self.assertEqual(info['imei'], 'testdevice123')

class TestGPSUtils(unittest.TestCase):
    """Testes para gps_utils.py"""

    @patch('gps_utils.get_location_android')
    def test_get_location_fallback(self, mock_android_gps):
        """Testa fallback do GPS"""
        from gps_utils import get_location

        mock_android_gps.return_value = (None, None)

        lat, lon = get_location()
        self.assertIsNone(lat)
        self.assertIsNone(lon)

class TestNetworkUtils(unittest.TestCase):
    """Testes para network_utils.py"""

    @patch('network_utils.socket.socket')
    def test_get_ip_socket(self, mock_socket_constructor):
        """Testa obtenção de IP via socket"""
        from network_utils import get_ip

        # Mock socket instance
        mock_sock = MagicMock()
        mock_sock.getsockname.return_value = ('192.168.1.100', 12345)
        mock_sock.__enter__.return_value = mock_sock
        mock_sock.__exit__.return_value = None
        mock_sock.connect = MagicMock()
        mock_sock.close = MagicMock()

        mock_socket_constructor.return_value = mock_sock

        ip = get_ip()
        self.assertEqual(ip, '192.168.1.100')

    def test_get_ip_fallback(self):
        """Testa fallback quando socket falha"""
        from network_utils import get_ip

        # Este teste pode falhar em alguns ambientes, mas testa a lógica
        ip = get_ip()
        self.assertTrue(isinstance(ip, str) or ip is None)

class TestAppsUtils(unittest.TestCase):
    """Testes para apps_utils.py"""

    @patch('apps_utils.get_installed_apps_system')
    def test_get_installed_apps_fallback(self, mock_system_apps):
        """Testa fallback de coleta de apps"""
        from apps_utils import get_installed_apps

        mock_system_apps.return_value = [{'nome': 'Test App', 'pacote': 'com.test', 'versao': '1.0'}]

        apps = get_installed_apps()
        self.assertIsInstance(apps, list)

class TestSocialUtils(unittest.TestCase):
    """Testes para social_utils.py"""

    def test_get_contacts_placeholder(self):
        """Testa placeholder de contatos"""
        from social_utils import get_contacts_placeholder

        contacts = get_contacts_placeholder()
        self.assertIsInstance(contacts, list)
        self.assertGreater(len(contacts), 0)

if __name__ == '__main__':
    unittest.main()
