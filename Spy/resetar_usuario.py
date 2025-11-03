#!/usr/bin/env python
import os
import sys
import django

# Configurar Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'spy.settings')
django.setup()

from django.contrib.auth.models import User

def resetar_usuario():
    username = 'Admin'
    email = 'admin@spy.com'
    password = 'Admin123'
    
    # Deletar usuário existente se houver
    User.objects.filter(username__iexact='admin').delete()
    User.objects.filter(username__iexact='Admin').delete()
    
    # Criar novo usuário
    user = User.objects.create_superuser(username, email, password)
    print(f"Usuário resetado com sucesso!")
    print(f"Usuário: {username}")
    print(f"Senha: {password}")
    print(f"Email: {email}")

if __name__ == '__main__':
    resetar_usuario()