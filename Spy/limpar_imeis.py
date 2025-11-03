#!/usr/bin/env python
import os
import sys
import django
import re

# Configurar Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'spy.settings')
django.setup()

from monitoramento.models import Dispositivo

def limpar_imeis():
    print("Limpando IMEIs no banco de dados...")
    
    dispositivos = Dispositivo.objects.all()
    count = 0
    
    for dispositivo in dispositivos:
        imei_original = dispositivo.imei
        imei_limpo = re.sub(r'[^0-9]', '', str(imei_original))
        
        if imei_original != imei_limpo:
            print(f"Limpando IMEI: '{imei_original}' -> '{imei_limpo}'")
            dispositivo.imei = imei_limpo
            dispositivo.save()
            count += 1
    
    print(f"Total de IMEIs limpos: {count}")

if __name__ == '__main__':
    limpar_imeis()