#!/usr/bin/env python
import os
import sys
import django

# Configurar Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'spy.settings')
django.setup()

from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from django.contrib.auth.hashers import check_password

def debug_login():
    print("=== DEBUG COMPLETO DO LOGIN ===")
    print()
    
    # Listar todos os usuários
    users = User.objects.all()
    print(f"Total de usuários: {users.count()}")
    
    for user in users:
        print(f"\nUsuário: {user.username}")
        print(f"  - Email: {user.email}")
        print(f"  - Ativo: {user.is_active}")
        print(f"  - Staff: {user.is_staff}")
        print(f"  - Superuser: {user.is_superuser}")
        print(f"  - Último login: {user.last_login}")
        print(f"  - Data criação: {user.date_joined}")
        
        # Testar senhas comuns
        senhas_teste = ['123456', 'admin123', 'Admin123', 'admin', 'Admin']
        for senha in senhas_teste:
            if check_password(senha, user.password):
                print(f"  - SENHA CORRETA: {senha}")
                break
        else:
            print(f"  - Nenhuma senha comum funciona")
        
        # Testar autenticação
        for senha in senhas_teste:
            auth_user = authenticate(username=user.username, password=senha)
            if auth_user:
                print(f"  - AUTENTICAÇÃO OK com: {senha}")
                break
    
    print()
    print("=== CONFIGURAÇÕES DJANGO ===")
    from django.conf import settings
    print(f"DEBUG: {settings.DEBUG}")
    print(f"LOGIN_URL: {settings.LOGIN_URL}")
    print(f"SECRET_KEY: {settings.SECRET_KEY[:20]}...")
    
    # Verificar middlewares
    print(f"MIDDLEWARE:")
    for mw in settings.MIDDLEWARE:
        print(f"  - {mw}")

if __name__ == '__main__':
    debug_login()