#!/usr/bin/env python
import os
import glob

def corrigir_templates():
    print("Corrigindo templates...")
    
    # Encontrar todos os templates
    templates_dir = "monitoramento/templates/monitoramento/"
    templates = glob.glob(os.path.join(templates_dir, "*.html"))
    
    for template_path in templates:
        print(f"Verificando: {template_path}")
        
        with open(template_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Verificar se precisa de {% load static %}
        if '{% static ' in content and '{% load static %}' not in content:
            print(f"Corrigindo: {template_path}")
            
            # Adicionar {% load static %} após {% extends %}
            if '{% extends ' in content:
                content = content.replace(
                    '{% extends \'base.html\' %}\n{% block content %}',
                    '{% extends \'base.html\' %}\n{% load static %}\n{% block content %}'
                )
            else:
                # Se não tem extends, adicionar no início
                content = '{% load static %}\n' + content
            
            with open(template_path, 'w', encoding='utf-8') as f:
                f.write(content)
    
    print("Templates corrigidos!")

if __name__ == '__main__':
    corrigir_templates()