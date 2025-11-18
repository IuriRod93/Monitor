#!/usr/bin/env python3
"""
Script para testar comunicação com o servidor https://147.79.111.118/
"""

import requests
import json
import time
from datetime import datetime
import uuid

# Configuração do servidor
SERVER_URL = "https://147.79.111.118"

def test_server_connection():
    """Testa conectividade básica com o servidor"""
    print("🔍 Testando conexão com servidor...")
    
    try:
        response = requests.get(f"{SERVER_URL}/api/test/", timeout=10, verify=False)
        print(f"✅ Servidor respondeu: {response.status_code}")
        if response.status_code == 200:
            print(f"📄 Resposta: {response.text}")
        return True
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro de conexão: {e}")
        return False

def test_device_registration():
    """Testa registro de dispositivo"""
    print("\n📱 Testando registro de dispositivo...")
    
    device_id = str(uuid.uuid4())[:15]
    data = {
        'imei': device_id,
        'timestamp': datetime.now().isoformat(),
        'platform': 'Test',
        'version': '1.0'
    }
    
    try:
        response = requests.post(
            f"{SERVER_URL}/api/device_info/", 
            json=data, 
            timeout=10, 
            verify=False
        )
        print(f"✅ Dispositivo registrado: {response.status_code}")
        if response.status_code in [200, 201]:
            print(f"📄 Resposta: {response.text}")
        return device_id
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro registro dispositivo: {e}")
        return None

def test_location_data(device_id):
    """Testa envio de dados de localização"""
    print("\n📍 Testando envio de localização...")
    
    data = {
        'imei': device_id,
        'latitude': -23.5505,  # São Paulo
        'longitude': -46.6333,
        'accuracy': 10.0,
        'timestamp': datetime.now().isoformat()
    }
    
    try:
        response = requests.post(
            f"{SERVER_URL}/api/localizacao/", 
            json=data, 
            timeout=10, 
            verify=False
        )
        print(f"✅ Localização enviada: {response.status_code}")
        if response.status_code in [200, 201]:
            print(f"📄 Resposta: {response.text}")
        return True
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro envio localização: {e}")
        return False

def test_network_activity(device_id):
    """Testa envio de atividade de rede"""
    print("\n🌐 Testando atividade de rede...")
    
    data = {
        'imei': device_id,
        'ip_local': '192.168.1.100',
        'hostname': 'test-device',
        'timestamp': datetime.now().isoformat()
    }
    
    try:
        response = requests.post(
            f"{SERVER_URL}/api/atividade_rede/", 
            json=data, 
            timeout=10, 
            verify=False
        )
        print(f"✅ Atividade rede enviada: {response.status_code}")
        if response.status_code in [200, 201]:
            print(f"📄 Resposta: {response.text}")
        return True
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro atividade rede: {e}")
        return False

def test_battery_info(device_id):
    """Testa envio de informações da bateria"""
    print("\n🔋 Testando informações da bateria...")
    
    data = {
        'imei': device_id,
        'bateria_nivel': 85,
        'bateria_carregando': False,
        'timestamp': datetime.now().isoformat()
    }
    
    try:
        response = requests.post(
            f"{SERVER_URL}/api/device_info/", 
            json=data, 
            timeout=10, 
            verify=False
        )
        print(f"✅ Bateria enviada: {response.status_code}")
        if response.status_code in [200, 201]:
            print(f"📄 Resposta: {response.text}")
        return True
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro bateria: {e}")
        return False

def test_activity_log(device_id):
    """Testa envio de log de atividade"""
    print("\n📋 Testando log de atividade...")
    
    data = {
        'imei': device_id,
        'descricao': 'Teste de atividade automática',
        'timestamp': datetime.now().isoformat()
    }
    
    try:
        response = requests.post(
            f"{SERVER_URL}/api/atividade/", 
            json=data, 
            timeout=10, 
            verify=False
        )
        print(f"✅ Atividade enviada: {response.status_code}")
        if response.status_code in [200, 201]:
            print(f"📄 Resposta: {response.text}")
        return True
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro atividade: {e}")
        return False

def main():
    """Executa todos os testes"""
    print("🚀 Iniciando testes de comunicação com servidor")
    print(f"🌐 Servidor: {SERVER_URL}")
    print("=" * 50)
    
    # Teste 1: Conectividade
    if not test_server_connection():
        print("\n❌ Falha na conectividade básica. Verifique o servidor.")
        return
    
    # Teste 2: Registro de dispositivo
    device_id = test_device_registration()
    if not device_id:
        print("\n❌ Falha no registro do dispositivo.")
        return
    
    print(f"\n📱 Device ID para testes: {device_id}")
    
    # Aguardar um pouco entre testes
    time.sleep(1)
    
    # Teste 3: Localização
    test_location_data(device_id)
    time.sleep(1)
    
    # Teste 4: Atividade de rede
    test_network_activity(device_id)
    time.sleep(1)
    
    # Teste 5: Bateria
    test_battery_info(device_id)
    time.sleep(1)
    
    # Teste 6: Log de atividade
    test_activity_log(device_id)
    
    print("\n" + "=" * 50)
    print("✅ Testes concluídos!")
    print(f"📱 Device ID usado: {device_id}")
    print("🌐 Verifique o painel admin do servidor para ver os dados recebidos")

if __name__ == "__main__":
    main()