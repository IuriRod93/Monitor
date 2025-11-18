#!/usr/bin/env python3
"""
Script para testar a comunicação entre app.py e o sistema Django
Simula o envio de dados do aplicativo móvel para o servidor
"""

import requests
import json
import time
from datetime import datetime

# Configurações do servidor
SERVER_IP = '127.0.0.1'  # IP local
SERVER_PORT = '8000'
BASE_URL = f"http://{SERVER_IP}:{SERVER_PORT}"

# Dados de teste
DEVICE_ID = 'teste_dispositivo_123'

def testar_conectividade():
    """Testa se o servidor está respondendo"""
    print("🔍 Testando conectividade com o servidor...")
    try:
        response = requests.get(f"{BASE_URL}/api/test/", timeout=5)
        if response.status_code == 200:
            print("✅ Servidor está online e respondendo")
            return True
        else:
            print(f"❌ Servidor retornou status: {response.status_code}")
            return False
    except requests.exceptions.ConnectionError:
        print("❌ Não foi possível conectar ao servidor")
        print("💡 Certifique-se de que o servidor Django está rodando:")
        print("   cd Spy && python manage.py runserver")
        return False
    except Exception as e:
        print(f"❌ Erro na conectividade: {e}")
        return False

def testar_envio_localizacao():
    """Testa envio de dados de localização"""
    print("\n📍 Testando envio de localização...")
    try:
        url = f"{BASE_URL}/api/localizacao/"
        data = {
            'imei': DEVICE_ID,
            'latitude': -23.5505,  # São Paulo
            'longitude': -46.6333,
            'timestamp': datetime.now().isoformat()
        }
        
        response = requests.post(url, json=data, timeout=10)
        if response.status_code in [200, 201]:
            print("✅ Localização enviada com sucesso")
            return True
        else:
            print(f"❌ Erro no envio de localização: {response.status_code}")
            print(f"   Resposta: {response.text}")
            return False
    except Exception as e:
        print(f"❌ Erro no envio de localização: {e}")
        return False

def testar_envio_atividade():
    """Testa envio de atividade"""
    print("\n📱 Testando envio de atividade...")
    try:
        url = f"{BASE_URL}/api/atividade/"
        data = {
            'imei': DEVICE_ID,
            'descricao': 'Teste de atividade automática',
            'timestamp': datetime.now().isoformat()
        }
        
        response = requests.post(url, json=data, timeout=10)
        if response.status_code in [200, 201]:
            print("✅ Atividade enviada com sucesso")
            return True
        else:
            print(f"❌ Erro no envio de atividade: {response.status_code}")
            print(f"   Resposta: {response.text}")
            return False
    except Exception as e:
        print(f"❌ Erro no envio de atividade: {e}")
        return False

def testar_envio_contatos():
    """Testa envio de contatos"""
    print("\n📞 Testando envio de contatos...")
    try:
        url = f"{BASE_URL}/api/contatos/"
        data = {
            'imei': DEVICE_ID,
            'contatos': [
                {'nome': 'João Silva', 'telefone': '11999999999'},
                {'nome': 'Maria Santos', 'telefone': '11888888888'},
                {'nome': 'Pedro Costa', 'telefone': '11777777777'}
            ]
        }
        
        response = requests.post(url, json=data, timeout=10)
        if response.status_code in [200, 201]:
            print("✅ Contatos enviados com sucesso")
            return True
        else:
            print(f"❌ Erro no envio de contatos: {response.status_code}")
            print(f"   Resposta: {response.text}")
            return False
    except Exception as e:
        print(f"❌ Erro no envio de contatos: {e}")
        return False

def testar_envio_rede():
    """Testa envio de informações de rede"""
    print("\n🌐 Testando envio de informações de rede...")
    try:
        url = f"{BASE_URL}/api/atividade-rede/"
        data = {
            'imei': DEVICE_ID,
            'ip': '192.168.1.100',
            'wifi_status': 'Conectado - MinhaRede',
            'timestamp': datetime.now().isoformat()
        }
        
        response = requests.post(url, json=data, timeout=10)
        if response.status_code in [200, 201]:
            print("✅ Informações de rede enviadas com sucesso")
            return True
        else:
            print(f"❌ Erro no envio de rede: {response.status_code}")
            print(f"   Resposta: {response.text}")
            return False
    except Exception as e:
        print(f"❌ Erro no envio de rede: {e}")
        return False

def testar_envio_device_info():
    """Testa envio de informações do dispositivo"""
    print("\n🔋 Testando envio de informações do dispositivo...")
    try:
        url = f"{BASE_URL}/api/device-info/"
        data = {
            'imei': DEVICE_ID,
            'device_info': {
                'bateria_nivel': 85,
                'bateria_carregando': False,
                'bateria_temperatura': 32.5,
                'armazenamento_total': 64000000000,  # 64GB
                'armazenamento_usado': 32000000000,  # 32GB
                'armazenamento_livre': 32000000000   # 32GB
            }
        }
        
        response = requests.post(url, json=data, timeout=10)
        if response.status_code in [200, 201]:
            print("✅ Informações do dispositivo enviadas com sucesso")
            return True
        else:
            print(f"❌ Erro no envio de device info: {response.status_code}")
            print(f"   Resposta: {response.text}")
            return False
    except Exception as e:
        print(f"❌ Erro no envio de device info: {e}")
        return False

def testar_ip_remoto():
    """Testa comunicação com IP remoto (simulado)"""
    print("\n🌍 Testando comunicação com IP remoto...")
    
    # IPs remotos para testar
    ips_remotos = [
        '192.168.0.97:8000',  # IP da rede local
        '8.8.8.8',            # Google DNS (teste de conectividade)
    ]
    
    for ip in ips_remotos:
        try:
            if ':' in ip:
                # Testar servidor específico
                test_url = f"http://{ip}/api/test/"
                response = requests.get(test_url, timeout=3)
                if response.status_code == 200:
                    print(f"✅ Conectado com sucesso ao servidor {ip}")
                else:
                    print(f"⚠️  Servidor {ip} respondeu com status {response.status_code}")
            else:
                # Testar conectividade básica
                import subprocess
                result = subprocess.run(['ping', '-n', '1', ip], 
                                      capture_output=True, text=True, timeout=5)
                if result.returncode == 0:
                    print(f"✅ Ping para {ip} bem-sucedido")
                else:
                    print(f"❌ Ping para {ip} falhou")
        except Exception as e:
            print(f"❌ Erro testando {ip}: {e}")

def simular_monitoramento_completo():
    """Simula um ciclo completo de monitoramento"""
    print("\n🔄 Simulando ciclo completo de monitoramento...")
    
    # Simular 3 ciclos de coleta
    for i in range(3):
        print(f"\n--- Ciclo {i+1} ---")
        
        # Enviar localização
        testar_envio_localizacao()
        time.sleep(1)
        
        # Enviar atividade
        testar_envio_atividade()
        time.sleep(1)
        
        # Enviar info de rede
        testar_envio_rede()
        time.sleep(1)
        
        # Enviar info do dispositivo
        testar_envio_device_info()
        
        if i < 2:  # Não esperar no último ciclo
            print("⏳ Aguardando próximo ciclo...")
            time.sleep(2)

def main():
    """Função principal de teste"""
    print("🚀 TESTE DE COMUNICAÇÃO APP.PY ↔ DJANGO")
    print("=" * 50)
    
    # Teste 1: Conectividade básica
    if not testar_conectividade():
        print("\n❌ Falha na conectividade básica. Verifique se o servidor está rodando.")
        return
    
    # Teste 2: Endpoints individuais
    print("\n📡 Testando endpoints individuais...")
    testar_envio_localizacao()
    testar_envio_atividade()
    testar_envio_contatos()
    testar_envio_rede()
    testar_envio_device_info()
    
    # Teste 3: IPs remotos
    testar_ip_remoto()
    
    # Teste 4: Simulação completa
    simular_monitoramento_completo()
    
    print("\n✅ TESTE CONCLUÍDO!")
    print("\n💡 Para verificar os dados recebidos:")
    print(f"   Acesse: {BASE_URL}/dispositivos/")
    print(f"   Login: admin / admin123")
    print(f"   Procure pelo dispositivo: {DEVICE_ID}")

if __name__ == "__main__":
    main()