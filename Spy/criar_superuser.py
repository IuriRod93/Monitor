#!/usr/bin/env python
import os
import sys
import django

# Configurar Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'spy.settings')
django.setup()

from django.contrib.auth.models import User

def criar_superuser():
    username = 'Admin'
    email = 'admin@spy.com'
    password = 'Admin123'
    
    if User.objects.filter(username=username).exists():
        print(f"Usuário '{username}' já existe!")
        return
    
    User.objects.create_superuser(username, email, password)
    print(f"Superusuário criado:")
    print(f"Usuário: {username}")
    print(f"Senha: {password}")

if __name__ == '__main__':
    criar_superuser()