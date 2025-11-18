FROM python:3.11-slim

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Criar diretório da aplicação
WORKDIR /app

# Copiar requirements e instalar dependências Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Instalar Gunicorn para produção
RUN pip install gunicorn

# Copiar código da aplicação
COPY . .

# Executar migrações do banco de dados
RUN python manage.py migrate --noinput

# Coletar arquivos estáticos
RUN python manage.py collectstatic --noinput

# Criar usuário não-root
RUN useradd --create-home --shell /bin/bash app \
    && chown -R app:app /app
USER app

# Expor porta
EXPOSE 8000

# Comando para executar com Gunicorn
CMD ["gunicorn", "spy.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]
