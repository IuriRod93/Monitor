"""
Testes para as views do Django
"""
import json
from django.test import TestCase, Client
from django.urls import reverse
from monitoramento.models import Dispositivo, Localizacao, Atividade
from django.utils import timezone

class TestAPIs(TestCase):
    """Testes para as APIs de coleta de dados"""

    def setUp(self):
        """Configurar dados de teste"""
        self.client = Client()
        self.test_imei = '123456789012345'

    def test_api_localizacao(self):
        """Testa API de localização"""
        data = {
            'imei': self.test_imei,
            'latitude': -23.550520,
            'longitude': -46.633308
        }

        response = self.client.post(
            reverse('api_localizacao'),
            data=json.dumps(data),
            content_type='application/json'
        )

        self.assertEqual(response.status_code, 200)
        self.assertIn('status', response.json())
        self.assertEqual(response.json()['status'], 'success')

        # Verificar se dispositivo foi criado
        dispositivo = Dispositivo.objects.filter(imei=self.test_imei).first()
        self.assertIsNotNone(dispositivo)

        # Verificar se localização foi salva
        localizacao = Localizacao.objects.filter(dispositivo=dispositivo).first()
        self.assertIsNotNone(localizacao)
        self.assertEqual(localizacao.latitude, -23.550520)
        self.assertEqual(localizacao.longitude, -46.633308)

    def test_api_atividade(self):
        """Testa API de atividade"""
        data = {
            'imei': self.test_imei,
            'descricao': 'Teste de atividade'
        }

        response = self.client.post(
            reverse('registrar_atividade'),
            data=json.dumps(data),
            content_type='application/json'
        )

        self.assertEqual(response.status_code, 200)

        # Verificar se atividade foi salva
        dispositivo = Dispositivo.objects.filter(imei=self.test_imei).first()
        self.assertIsNotNone(dispositivo)

        atividade = Atividade.objects.filter(dispositivo=dispositivo).first()
        self.assertIsNotNone(atividade)
        self.assertEqual(atividade.descricao, 'Teste de atividade')

    def test_api_apps(self):
        """Testa API de apps"""
        data = {
            'imei': self.test_imei,
            'apps': [
                {'nome': 'WhatsApp', 'pacote': 'com.whatsapp', 'versao': '2.21.1.14'},
                {'nome': 'Chrome', 'pacote': 'com.android.chrome', 'versao': '88.0.4324.93'}
            ]
        }

        response = self.client.post(
            reverse('api_apps'),
            data=json.dumps(data),
            content_type='application/json'
        )

        self.assertEqual(response.status_code, 200)

        # Verificar se dispositivo foi criado
        dispositivo = Dispositivo.objects.filter(imei=self.test_imei).first()
        self.assertIsNotNone(dispositivo)

        # Verificar se apps foram salvos
        from monitoramento.models import Aplicativo
        whatsapp = Aplicativo.objects.filter(dispositivo=dispositivo, pacote='com.whatsapp').first()
        self.assertIsNotNone(whatsapp)
        self.assertEqual(whatsapp.nome, 'WhatsApp')

class TestViews(TestCase):
    """Testes para as views web"""

    def setUp(self):
        """Configurar dados de teste"""
        from django.contrib.auth.models import User
        self.client = Client()
        # Criar usuário de teste
        self.user = User.objects.create_user(username='testuser', password='testpass')
        # Logar o usuário
        self.client.login(username='testuser', password='testpass')
        self.dispositivo = Dispositivo.objects.create(
            imei='123456789012345',
            ip='192.168.1.100',
            nome='Dispositivo Teste'
        )

    def test_lista_dispositivos(self):
        """Testa listagem de dispositivos"""
        response = self.client.get(reverse('lista_dispositivos'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Dispositivo Teste')

    def test_detalhes_dispositivo(self):
        """Testa detalhes do dispositivo"""
        response = self.client.get(reverse('detalhes_dispositivo', args=[self.dispositivo.imei]))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Dispositivo Teste')
