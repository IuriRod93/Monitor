#!/usr/bin/env python3
"""
Análise completa do projeto Spy Mobile
"""

import os
import json
from pathlib import Path

def analisar_estrutura_projeto():
    """Analisa a estrutura do projeto"""
    print("ANALISE DA ESTRUTURA DO PROJETO")
    print("=" * 40)
    
    # Verificar arquivos principais
    arquivos_principais = {
        'Django Backend': [
            'Spy/manage.py',
            'Spy/spy/settings.py',
            'Spy/monitoramento/models.py',
            'Spy/monitoramento/views.py',
            'Spy/monitoramento/urls.py'
        ],
        'App Mobile': [
            'Spy-mobile/main.py',
            'Spy-mobile/buildozer.spec',
            'Spy-mobile/calcme/app.py'
        ],
        'Scripts de Deploy': [
            'deploy_vps_completo.sh',
            'comandos_rapidos_vps.txt'
        ]
    }
    
    status_projeto = {}
    
    for categoria, arquivos in arquivos_principais.items():
        print(f"\n{categoria}:")
        status_categoria = []
        
        for arquivo in arquivos:
            if os.path.exists(arquivo):
                print(f"  OK {arquivo}")
                status_categoria.append(True)
            else:
                print(f"  AUSENTE {arquivo}")
                status_categoria.append(False)
        
        status_projeto[categoria] = all(status_categoria)
    
    return status_projeto

def verificar_configuracao_django():
    """Verifica configuração do Django"""
    print("\nVERIFICACAO DO DJANGO")
    print("=" * 30)
    
    settings_path = 'Spy/spy/settings.py'
    if os.path.exists(settings_path):
        with open(settings_path, 'r', encoding='utf-8') as f:
            content = f.read()
            
        checks = {
            'ALLOWED_HOSTS configurado': 'ALLOWED_HOSTS' in content and not "['']" in content,
            'App monitoramento instalada': "'monitoramento'" in content,
            'CSRF_TRUSTED_ORIGINS': 'CSRF_TRUSTED_ORIGINS' in content,
            'Banco SQLite': 'sqlite3' in content
        }
        
        for check, status in checks.items():
            print(f"  {'OK' if status else 'ERRO'} {check}")
            
        return all(checks.values())
    else:
        print("  ERRO settings.py nao encontrado")
        return False

def verificar_apis():
    """Verifica APIs implementadas"""
    print("\nVERIFICACAO DAS APIs")
    print("=" * 25)
    
    views_path = 'Spy/monitoramento/views.py'
    if os.path.exists(views_path):
        with open(views_path, 'r', encoding='utf-8') as f:
            content = f.read()
            
        apis = {
            'api_test': 'api_test' in content,
            'api_atividade': 'api_atividade' in content,
            'api_localizacao': 'api_localizacao' in content,
            'api_contatos': 'api_contatos' in content,
            'api_upload': 'api_upload' in content
        }
        
        for api, status in apis.items():
            print(f"  {'OK' if status else 'ERRO'} {api}")
            
        return sum(apis.values()) >= 3  # Pelo menos 3 APIs essenciais
    else:
        print("  ERRO views.py nao encontrado")
        return False

def verificar_app_mobile():
    """Verifica configuração do app mobile"""
    print("\nVERIFICACAO DO APP MOBILE")
    print("=" * 30)
    
    main_paths = ['Spy-mobile/main.py', 'main.py']
    app_encontrado = False
    
    for path in main_paths:
        if os.path.exists(path):
            with open(path, 'r', encoding='utf-8') as f:
                content = f.read()
                
            checks = {
                'Kivy importado': 'from kivy' in content,
                'Requests importado': 'import requests' in content,
                'Interface com botões': 'Button' in content and 'PLAY' in content,
                'Envio de dados': 'requests.post' in content,
                'Timer implementado': 'Clock' in content or 'timer' in content.lower()
            }
            
            print(f"  Analisando: {path}")
            for check, status in checks.items():
                print(f"    {'OK' if status else 'ERRO'} {check}")
            
            app_encontrado = True
            return all(checks.values())
    
    if not app_encontrado:
        print("  ERRO Arquivo main.py nao encontrado")
        return False

def gerar_relatorio_final(status_projeto):
    """Gera relatório final"""
    print("\nRELATORIO FINAL")
    print("=" * 20)
    
    total_componentes = len(status_projeto)
    componentes_ok = sum(status_projeto.values())
    
    print(f"Componentes OK: {componentes_ok}/{total_componentes}")
    print(f"Status geral: {(componentes_ok/total_componentes)*100:.1f}%")
    
    if componentes_ok == total_componentes:
        print("\nPROJETO PRONTO PARA DEPLOY!")
        return True
    else:
        print("\nPROJETO PRECISA DE AJUSTES")
        return False

def main():
    """Função principal"""
    print("ANALISE COMPLETA DO PROJETO SPY MOBILE")
    print("=" * 50)
    
    # Análises
    status_estrutura = analisar_estrutura_projeto()
    django_ok = verificar_configuracao_django()
    apis_ok = verificar_apis()
    app_ok = verificar_app_mobile()
    
    # Status geral
    status_geral = {
        **status_estrutura,
        'Django Configurado': django_ok,
        'APIs Funcionais': apis_ok,
        'App Mobile OK': app_ok
    }
    
    projeto_pronto = gerar_relatorio_final(status_geral)
    
    print("\nPROXIMOS PASSOS:")
    if projeto_pronto:
        print("1. Executar: setup_django_https_vps.sh")
        print("2. Configurar SSL/HTTPS")
        print("3. Gerar APK final")
        print("4. Testar comunicacao")
    else:
        print("1. Corrigir arquivos ausentes")
        print("2. Completar configuracoes")
        print("3. Executar analise novamente")
    
    return projeto_pronto

if __name__ == "__main__":
    main()