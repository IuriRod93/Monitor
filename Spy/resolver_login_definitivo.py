#!/usr/bin/env python
import os
import sys
import django

# Configurar Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'spy.settings')
django.setup()

from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from django.contrib.sessions.models import Session

def resolver_login():
    print("=== RESOLVENDO LOGIN DEFINITIVAMENTE ===")
    print()
    
    # 1. Limpar tudo
    print("1. Limpando usuários e sessões...")
    User.objects.all().delete()
    Session.objects.all().delete()
    
    # 2. Criar usuário simples
    print("2. Criando usuário...")
    user = User.objects.create_user(
        username='admin',
        email='admin@spy.com',
        password='123456'
    )
    user.is_superuser = True
    user.is_staff = True
    user.is_active = True
    user.save()
    
    print(f"Usuário criado: {user.username}")
    print(f"Senha: 123456")
    print(f"Superuser: {user.is_superuser}")
    print(f"Ativo: {user.is_active}")
    
    # 3. Testar autenticação
    print()
    print("3. Testando autenticação...")
    test_user = authenticate(username='admin', password='123456')
    if test_user:
        print("✓ Autenticação funcionando!")
    else:
        print("✗ Erro na autenticação!")
    
    # 4. Criar usuário alternativo
    print()
    print("4. Criando usuário alternativo...")
    user2 = User.objects.create_user(
        username='Admin',
        email='admin2@spy.com',
        password='Admin123'
    )
    user2.is_superuser = True
    user2.is_staff = True
    user2.is_active = True
    user2.save()
    
    print("Usuários disponíveis:")
    print("- admin / 123456")
    print("- Admin / Admin123")
    
    print()
    print("=== PROBLEMA RESOLVIDO ===")

if __name__ == '__main__':
    resolver_login()