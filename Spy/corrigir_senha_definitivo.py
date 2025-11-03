#!/usr/bin/env python
import os
import sys
import django

# Configurar Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'spy.settings')
django.setup()

from django.contrib.auth.models import User
from django.contrib.auth import authenticate

def corrigir_senha():
    print("=== CORRIGINDO SENHA DEFINITIVAMENTE ===")
    print()
    
    # Pegar o usuário Admin existente
    try:
        user = User.objects.get(username='Admin')
        print(f"Usuário encontrado: {user.username}")
        
        # Definir nova senha
        nova_senha = 'admin123'
        user.set_password(nova_senha)
        user.save()
        
        print(f"Senha alterada para: {nova_senha}")
        
        # Testar autenticação
        test_user = authenticate(username='Admin', password='admin123')
        if test_user:
            print("✓ SUCESSO! Autenticação funcionando")
        else:
            print("✗ ERRO! Ainda não funciona")
            
    except User.DoesNotExist:
        print("Usuário Admin não encontrado. Criando novo...")
        user = User.objects.create_user(
            username='Admin',
            email='admin@spy.com',
            password='admin123'
        )
        user.is_superuser = True
        user.is_staff = True
        user.save()
        print("Usuário Admin criado com senha: admin123")
    
    # Criar usuário alternativo simples
    try:
        User.objects.get(username='admin').delete()
    except:
        pass
        
    user2 = User.objects.create_user(
        username='admin',
        email='admin2@spy.com',
        password='123456'
    )
    user2.is_superuser = True
    user2.is_staff = True
    user2.save()
    
    print()
    print("=== CREDENCIAIS FINAIS ===")
    print("OPÇÃO 1: Admin / admin123")
    print("OPÇÃO 2: admin / 123456")
    
    # Testar ambas
    print()
    print("Testando credenciais...")
    test1 = authenticate(username='Admin', password='admin123')
    test2 = authenticate(username='admin', password='123456')
    
    print(f"Admin/admin123: {'✓ OK' if test1 else '✗ ERRO'}")
    print(f"admin/123456: {'✓ OK' if test2 else '✗ ERRO'}")

if __name__ == '__main__':
    corrigir_senha()