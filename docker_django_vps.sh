#!/bin/bash
# 🐳 DJANGO NO DOCKER - VPS
# Execute na VPS: 147.79.111.118

echo "🐳 CONFIGURANDO DJANGO NO DOCKER"
echo "================================"

# 1. Instalar Docker
apt update && apt upgrade -y
apt install -y docker.io docker-compose
systemctl start docker
systemctl enable docker

# 2. Criar estrutura do projeto
mkdir -p /opt/spy-docker && cd /opt/spy-docker

# 3. Criar Dockerfile
cat > Dockerfile << 'EOF'
FROM python:3.9-slim

WORKDIR /app

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copiar requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar projeto
COPY . .

# Coletar arquivos estáticos
RUN python manage.py collectstatic --noinput

# Expor porta
EXPOSE 8000

# Comando para iniciar
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "spy.wsgi:application"]
EOF

# 4. Criar requirements.txt
cat > requirements.txt << 'EOF'
Django==4.2.7
gunicorn==21.2.0
requests==2.31.0
Pillow==10.1.0
EOF

# 5. Criar docker-compose.yml
cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  web:
    build: .
    ports:
      - "8000:8000"
    volumes:
      - ./media:/app/media
      - ./static:/app/static
    environment:
      - DEBUG=False
      - ALLOWED_HOSTS=147.79.111.118,localhost
    restart: unless-stopped
    
  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
      - ./static:/app/static
      - ./media:/app/media
      - /etc/letsencrypt:/etc/letsencrypt
    depends_on:
      - web
    restart: unless-stopped
EOF

# 6. Criar projeto Django
django-admin startproject spy .
cd spy
python manage.py startapp monitoramento
cd ..

# 7. Configurar settings.py
cat > spy/settings.py << 'EOF'
import os
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

SECRET_KEY = 'spy-docker-production-key'

DEBUG = os.environ.get('DEBUG', 'False') == 'True'

ALLOWED_HOSTS = os.environ.get('ALLOWED_HOSTS', '147.79.111.118').split(',')

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
STATIC_ROOT = BASE_DIR / 'static'

MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR / 'media'

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# Configurações de segurança
SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
CSRF_TRUSTED_ORIGINS = ['https://147.79.111.118', 'http://147.79.111.118']

# Upload settings
FILE_UPLOAD_MAX_MEMORY_SIZE = 50 * 1024 * 1024
DATA_UPLOAD_MAX_MEMORY_SIZE = 50 * 1024 * 1024
EOF

# 8. Configurar URLs
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

# 9. Criar models
cat > monitoramento/models.py << 'EOF'
from django.db import models
from django.utils import timezone

class Dispositivo(models.Model):
    imei = models.CharField(max_length=20, unique=True)
    ip = models.GenericIPAddressField()
    nome = models.CharField(max_length=100, blank=True)
    status = models.CharField(max_length=20, default='ativo')
    criado_em = models.DateTimeField(auto_now_add=True)
    ultima_conexao = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return f"{self.nome or self.imei} ({self.ip})"

class Atividade(models.Model):
    dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE)
    descricao = models.TextField()
    data_hora = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return f"{self.dispositivo} - {self.data_hora}"

class Localizacao(models.Model):
    dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE)
    latitude = models.FloatField()
    longitude = models.FloatField()
    data_hora = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return f"{self.dispositivo} - {self.latitude}, {self.longitude}"
EOF

# 10. Criar views
cat > monitoramento/views.py << 'EOF'
import json
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from .models import Dispositivo, Atividade, Localizacao
from django.utils import timezone

@csrf_exempt
def api_test(request):
    return JsonResponse({
        'status': 'success',
        'message': 'Spy Mobile Docker OK!',
        'server': '147.79.111.118',
        'timestamp': timezone.now().isoformat()
    })

@csrf_exempt
def api_atividade(request):
    try:
        data = json.loads(request.body)
        imei = data.get('imei', 'dispositivo_desconhecido')
        descricao = data.get('descricao', 'Atividade automática')
        
        dispositivo, created = Dispositivo.objects.get_or_create(
            imei=imei,
            defaults={'ip': request.META.get('REMOTE_ADDR', '0.0.0.0')}
        )
        
        Atividade.objects.create(dispositivo=dispositivo, descricao=descricao)
        return JsonResponse({'status': 'success'})
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=400)

@csrf_exempt
def api_localizacao(request):
    try:
        data = json.loads(request.body)
        imei = data.get('imei', 'dispositivo_desconhecido')
        latitude = data.get('latitude')
        longitude = data.get('longitude')
        
        dispositivo, created = Dispositivo.objects.get_or_create(
            imei=imei,
            defaults={'ip': request.META.get('REMOTE_ADDR', '0.0.0.0')}
        )
        
        Localizacao.objects.create(
            dispositivo=dispositivo,
            latitude=latitude,
            longitude=longitude
        )
        return JsonResponse({'status': 'success'})
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=400)

def home(request):
    dispositivos = Dispositivo.objects.count()
    atividades = Atividade.objects.count()
    return HttpResponse(f'''
    <h1>🐳 Spy Mobile Docker</h1>
    <p>Dispositivos: {dispositivos}</p>
    <p>Atividades: {atividades}</p>
    <p>API Test: <a href="/api/test/">/api/test/</a></p>
    <p>Admin: <a href="/admin/">/admin/</a></p>
    ''')
EOF

# 11. Criar URLs da app
cat > monitoramento/urls.py << 'EOF'
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('api/test/', views.api_test, name='api_test'),
    path('api/atividade/', views.api_atividade, name='api_atividade'),
    path('api/localizacao/', views.api_localizacao, name='api_localizacao'),
]
EOF

# 12. Configurar Nginx
cat > nginx.conf << 'EOF'
events {
    worker_connections 1024;
}

http {
    upstream django {
        server web:8000;
    }

    server {
        listen 80;
        server_name 147.79.111.118;
        
        location / {
            proxy_pass http://django;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
        
        location /static/ {
            alias /app/static/;
        }
        
        location /media/ {
            alias /app/media/;
        }
    }
}
EOF

# 13. Aplicar migrações
python manage.py makemigrations
python manage.py migrate

# 14. Criar superusuário
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@spy.com', 'admin123')" | python manage.py shell

# 15. Construir e iniciar containers
docker-compose build
docker-compose up -d

# 16. Verificar status
docker-compose ps

# 17. Testar
sleep 10
curl http://147.79.111.118/api/test/

echo ""
echo "✅ DJANGO NO DOCKER FUNCIONANDO!"
echo "================================"
echo "🐳 Containers: docker-compose ps"
echo "🌐 Acesse: http://147.79.111.118"
echo "📡 API: http://147.79.111.118/api/test/"
echo "🔐 Admin: http://147.79.111.118/admin/"
echo "🔑 Login: admin / admin123"
echo ""
echo "📋 COMANDOS ÚTEIS:"
echo "docker-compose logs -f web    # Ver logs"
echo "docker-compose restart       # Reiniciar"
echo "docker-compose down          # Parar"
echo "docker-compose up -d         # Iniciar"
EOF