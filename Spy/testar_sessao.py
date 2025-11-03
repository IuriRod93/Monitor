#!/usr/bin/env python
import os
import sys
import django

# Configurar Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'spy.settings')
django.setup()

from django.contrib.auth.models import User
from django.contrib.sessions.models import Session
from django.utils import timezone

def testar_sessao():
    print("=== TESTE DE SESSÃO ===")
    print()
    
    # Verificar usuários
    users = User.objects.all()
    print(f"Usuários no sistema: {users.count()}")
    for user in users:
        print(f"- {user.username} (ativo: {user.is_active}, superuser: {user.is_superuser})")
    
    print()
    
    # Verificar sessões ativas
    sessions = Session.objects.filter(expire_date__gte=timezone.now())
    print(f"Sessões ativas: {sessions.count()}")
    
    # Limpar sessões expiradas
    expired = Session.objects.filter(expire_date__lt=timezone.now())
    if expired.exists():
        print(f"Removendo {expired.count()} sessões expiradas...")
        expired.delete()
    
    print()
    print("=== CONFIGURAÇÕES ===")
    from django.conf import settings
    print(f"LOGIN_URL: {settings.LOGIN_URL}")
    print(f"LOGIN_REDIRECT_URL: {getattr(settings, 'LOGIN_REDIRECT_URL', 'Não definido')}")
    print(f"DEBUG: {settings.DEBUG}")
    print(f"ALLOWED_HOSTS: {settings.ALLOWED_HOSTS}")

if __name__ == '__main__':
    testar_sessao()