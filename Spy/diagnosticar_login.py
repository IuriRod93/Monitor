#!/usr/bin/env python
import os
import sys
import django

# Configurar Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'spy.settings')
django.setup()

from django.contrib.auth.models import User
from django.contrib.auth import authenticate

def diagnosticar_login():
    print("=== DIAGNÓSTICO DE LOGIN ===")
    print()
    
    # Listar todos os usuários
    print("Usuários no sistema:")
    users = User.objects.all()
    for user in users:
        print(f"- {user.username} (superuser: {user.is_superuser}, ativo: {user.is_active})")
    
    if not users:
        print("Nenhum usuário encontrado!")
        return
    
    print()
    
    # Testar login com diferentes combinações
    test_credentials = [
        ('Admin', 'Admin123'),
        ('admin', 'admin123'),
        ('Admin', 'admin123'),
        ('admin', 'Admin123')
    ]
    
    print("Testando credenciais:")
    for username, password in test_credentials:
        user = authenticate(username=username, password=password)
        status = "✓ SUCESSO" if user else "✗ FALHOU"
        print(f"- {username}/{password}: {status}")
    
    print()
    print("=== FIM DO DIAGNÓSTICO ===")

if __name__ == '__main__':
    diagnosticar_login()