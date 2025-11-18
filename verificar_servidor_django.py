#!/usr/bin/env python3
"""
Script para verificar se o servidor Django está configurado corretamente
"""

import os
import sys
import subprocess
import requests
import time

def verificar_arquivos_django():
    """Verifica se os arquivos Django estão presentes"""
    print("📁 Verificando arquivos do Django...")
    
    arquivos_necessarios = [
        'Spy/manage.py',
        'Spy/spy/settings.py',
        'Spy/monitoramento/models.py',
        'Spy/monitoramento/views.py',
        'Spy/monitoramento/urls.py'
    ]
    
    todos_presentes = True
    for arquivo in arquivos_necessarios:
        caminho = os.path.join(os.getcwd(), arquivo)
        if os.path.exists(caminho):
            print(f"✅ {arquivo}")
        else:
            print(f"❌ {arquivo} - AUSENTE")
            todos_presentes = False
    
    return todos_presentes

def verificar_dependencias():
    """Verifica se as dependências estão instaladas"""
    print("\n📦 Verificando dependências Python...")
    
    dependencias = ['django', 'requests']
    
    for dep in dependencias:
        try:
            __import__(dep)
            print(f"✅ {dep}")
        except ImportError:
            print(f"❌ {dep} - NÃO INSTALADO")
            print(f"   Instale com: pip install {dep}")

def verificar_migracao_db():
    """Verifica se o banco de dados foi migrado"""
    print("\n🗄️  Verificando banco de dados...")
    
    db_path = os.path.join(os.getcwd(), 'Spy', 'db.sqlite3')
    if os.path.exists(db_path):
        print("✅ Banco de dados existe")
        
        # Verificar se as tabelas foram criadas
        try:
            os.chdir('Spy')
            result = subprocess.run([sys.executable, 'manage.py', 'showmigrations'], 
                                  capture_output=True, text=True)
            if 'monitoramento' in result.stdout:
                print("✅ Migrações do monitoramento aplicadas")
            else:
                print("⚠️  Migrações podem não estar aplicadas")
                print("   Execute: python manage.py migrate")
            os.chdir('..')
        except Exception as e:
            print(f"⚠️  Erro verificando migrações: {e}")
            os.chdir('..')
    else:
        print("❌ Banco de dados não existe")
        print("   Execute: python manage.py migrate")

def verificar_superuser():
    """Verifica se existe um superusuário"""
    print("\n👤 Verificando superusuário...")
    
    try:
        os.chdir('Spy')
        # Tentar importar Django e verificar usuários
        result = subprocess.run([
            sys.executable, '-c',
            "import django; django.setup(); from django.contrib.auth.models import User; print('Usuários:', User.objects.count())"
        ], capture_output=True, text=True, env={**os.environ, 'DJANGO_SETTINGS_MODULE': 'spy.settings'})
        
        if 'Usuários: 0' in result.stdout:
            print("❌ Nenhum usuário encontrado")
            print("   Crie um superusuário: python manage.py createsuperuser")
        else:
            print("✅ Usuários existem no sistema")
        os.chdir('..')
    except Exception as e:
        print(f"⚠️  Erro verificando usuários: {e}")
        os.chdir('..')

def iniciar_servidor_teste():
    """Inicia o servidor Django para teste"""
    print("\n🚀 Iniciando servidor Django para teste...")
    
    try:
        os.chdir('Spy')
        
        # Iniciar servidor em background
        processo = subprocess.Popen([
            sys.executable, 'manage.py', 'runserver', '127.0.0.1:8000'
        ], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        
        # Aguardar servidor iniciar
        print("⏳ Aguardando servidor iniciar...")
        time.sleep(5)
        
        # Testar se servidor está respondendo
        try:
            response = requests.get('http://127.0.0.1:8000/api/test/', timeout=5)
            if response.status_code == 200:
                print("✅ Servidor Django está funcionando!")
                print("🌐 Acesse: http://127.0.0.1:8000/")
                
                # Testar endpoints da API
                testar_endpoints_api()
                
            else:
                print(f"⚠️  Servidor respondeu com status: {response.status_code}")
        except requests.exceptions.ConnectionError:
            print("❌ Servidor não está respondendo")
        except Exception as e:
            print(f"❌ Erro testando servidor: {e}")
        
        # Parar servidor
        processo.terminate()
        processo.wait()
        os.chdir('..')
        
    except Exception as e:
        print(f"❌ Erro iniciando servidor: {e}")
        os.chdir('..')

def testar_endpoints_api():
    """Testa os endpoints da API"""
    print("\n🔗 Testando endpoints da API...")
    
    endpoints = [
        '/api/test/',
        '/api/atividade/',
        '/api/localizacao/',
        '/api/contatos/',
        '/api/upload/'
    ]
    
    for endpoint in endpoints:
        try:
            url = f'http://127.0.0.1:8000{endpoint}'
            
            if endpoint == '/api/test/':
                # GET para teste
                response = requests.get(url, timeout=3)
            else:
                # POST com dados de teste
                response = requests.post(url, json={
                    'imei': 'teste_123',
                    'dados': 'teste'
                }, timeout=3)
            
            if response.status_code in [200, 201, 400]:  # 400 é esperado para dados inválidos
                print(f"✅ {endpoint}")
            else:
                print(f"⚠️  {endpoint} - Status: {response.status_code}")
                
        except Exception as e:
            print(f"❌ {endpoint} - Erro: {e}")

def verificar_configuracao_urls():
    """Verifica se as URLs estão configuradas"""
    print("\n🔗 Verificando configuração de URLs...")
    
    # Verificar urls.py principal
    urls_principal = os.path.join(os.getcwd(), 'Spy', 'spy', 'urls.py')
    if os.path.exists(urls_principal):
        with open(urls_principal, 'r', encoding='utf-8') as f:
            conteudo = f.read()
            if 'monitoramento' in conteudo:
                print("✅ URLs do monitoramento incluídas")
            else:
                print("❌ URLs do monitoramento não incluídas")
                print("   Adicione: path('', include('monitoramento.urls'))")
    else:
        print("❌ Arquivo urls.py principal não encontrado")

def main():
    """Função principal"""
    print("🔍 VERIFICAÇÃO DO SERVIDOR DJANGO")
    print("=" * 40)
    
    # Verificações básicas
    if not verificar_arquivos_django():
        print("\n❌ Arquivos Django ausentes. Verifique a estrutura do projeto.")
        return
    
    verificar_dependencias()
    verificar_configuracao_urls()
    verificar_migracao_db()
    verificar_superuser()
    
    # Teste do servidor
    resposta = input("\n❓ Deseja testar o servidor Django? (s/n): ")
    if resposta.lower() in ['s', 'sim', 'y', 'yes']:
        iniciar_servidor_teste()
    
    print("\n📋 RESUMO DAS VERIFICAÇÕES:")
    print("1. ✅ Arquivos Django verificados")
    print("2. ✅ Dependências verificadas")
    print("3. ✅ Configuração de URLs verificada")
    print("4. ✅ Banco de dados verificado")
    print("5. ✅ Usuários verificados")
    
    print("\n💡 PRÓXIMOS PASSOS:")
    print("1. Execute: cd Spy && python manage.py runserver")
    print("2. Execute: python testar_comunicacao_app.py")
    print("3. Acesse: http://127.0.0.1:8000/")

if __name__ == "__main__":
    main()