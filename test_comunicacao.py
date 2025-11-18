#!/usr/bin/env python3
"""
Script de teste para verificar a comunicação com o servidor https://147.79.111.118/
Testa todas as APIs do sistema de monitoramento.
"""

import requests
import json
import time
from datetime import datetime
import uuid

# Configurações
SERVER_URL = "https://147.79.111.118"
TEST_IMEI = "TEST123456789012345"

def log(message):
    """Log com timestamp"""
    timestamp = datetime.now().strftime('%H:%M:%S')
    print(f"[{timestamp}] {message}")

def test_api_test():
    """Testa endpoint /api/test/"""
    log("🧪 Testando /api/test/")
    try:
        response = requests.get(f"{SERVER_URL}/api/test/", timeout=10, verify=False)
        if response.status_code == 200:
            log("✅ /api/test/ - OK")
            return True
        else:
            log(f"❌ /api/test/ - Status: {response.status_code}")
            return False
    except Exception as e:
        log(f"❌ /api/test/ - Erro: {str(e)}")
        return False

def test_device_info():
    """Testa envio de informações do dispositivo"""
    log("📱 Testando /api/device-info/")
    data = {
        'imei': TEST_IMEI,
        'timestamp': datetime.now().isoformat(),
        'platform': 'Test',
        'version': '1.0.0'
    }

    try:
        response = requests.post(f"{SERVER_URL}/api/device-info/", json=data, timeout=10, verify=False)
        if response.status_code in [200, 201]:
            log("✅ /api/device-info/ - OK")
            return True
        else:
            log(f"❌ /api/device-info/ - Status: {response.status_code}")
            log(f"Resposta: {response.text}")
            return False
    except Exception as e:
        log(f"❌ /api/device-info/ - Erro: {str(e)}")
        return False

def test_localizacao():
    """Testa envio de localização"""
    log("📍 Testando /api/localizacao/")
    data = {
        'imei': TEST_IMEI,
        'latitude': -23.550520,
        'longitude': -46.633308,
        'accuracy': 10.0,
        'timestamp': datetime.now().isoformat()
    }

    try:
        response = requests.post(f"{SERVER_URL}/api/localizacao/", json=data, timeout=10, verify=False)
        if response.status_code in [200, 201]:
            log("✅ /api/localizacao/ - OK")
            return True
        else:
            log(f"❌ /api/localizacao/ - Status: {response.status_code}")
            log(f"Resposta: {response.text}")
            return False
    except Exception as e:
        log(f"❌ /api/localizacao/ - Erro: {str(e)}")
        return False

def test_atividade_rede():
    """Testa envio de atividade de rede"""
    log("🌐 Testando /api/atividade-rede/")
    data = {
        'imei': TEST_IMEI,
        'ip_local': '192.168.1.100',
        'hostname': 'test-device',
        'timestamp': datetime.now().isoformat()
    }

    try:
        response = requests.post(f"{SERVER_URL}/api/atividade-rede/", json=data, timeout=10, verify=False)
        if response.status_code in [200, 201]:
            log("✅ /api/atividade-rede/ - OK")
            return True
        else:
            log(f"❌ /api/atividade-rede/ - Status: {response.status_code}")
            log(f"Resposta: {response.text}")
            return False
    except Exception as e:
        log(f"❌ /api/atividade-rede/ - Erro: {str(e)}")
        return False

def test_battery_info():
    """Testa envio de informações da bateria"""
    log("🔋 Testando /api/device-info/ (bateria)")
    data = {
        'imei': TEST_IMEI,
        'bateria_nivel': 85,
        'bateria_carregando': False,
        'timestamp': datetime.now().isoformat()
    }

    try:
        response = requests.post(f"{SERVER_URL}/api/device-info/", json=data, timeout=10, verify=False)
        if response.status_code in [200, 201]:
            log("✅ /api/device-info/ (bateria) - OK")
            return True
        else:
            log(f"❌ /api/device-info/ (bateria) - Status: {response.status_code}")
            log(f"Resposta: {response.text}")
            return False
    except Exception as e:
        log(f"❌ /api/device-info/ (bateria) - Erro: {str(e)}")
        return False

def simulate_app_behavior():
    """Simula o comportamento do app móvel"""
    log("🎭 Iniciando simulação do comportamento do app...")

    # Teste inicial de conectividade
    if not test_api_test():
        log("❌ Servidor não está respondendo. Abortando testes.")
        return False

    # Simular múltiplas coletas
    for i in range(3):
        log(f"\n--- Coleta #{i+1} ---")

        # Sempre enviar device info
        test_device_info()

        # Enviar localização a cada 2 coletas
        if i % 2 == 0:
            test_localizacao()

        # Enviar rede a cada 3 coletas
        if i % 3 == 0:
            test_atividade_rede()

        # Enviar bateria a cada 5 coletas (neste caso, sempre)
        test_battery_info()

        # Aguardar entre coletas
        if i < 2:
            log("⏳ Aguardando 2 segundos...")
            time.sleep(2)

    log("✅ Simulação concluída!")
    return True

def main():
    """Função principal"""
    log("🚀 Iniciando testes de comunicação com o servidor")
    log(f"📡 Servidor: {SERVER_URL}")
    log(f"📱 IMEI de teste: {TEST_IMEI}")
    log("=" * 50)

    success = simulate_app_behavior()

    log("=" * 50)
    if success:
        log("✅ Todos os testes foram executados!")
        log("💡 O app.py deve funcionar corretamente com este servidor.")
    else:
        log("❌ Problemas detectados na comunicação.")
        log("🔧 Verifique a configuração do servidor e as credenciais.")

if __name__ == "__main__":
    main()
