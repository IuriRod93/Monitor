# Script para limpar e preparar projeto no Colab
import os
import shutil

def clean_and_prepare():
    # Remover arquivos duplicados
    duplicates = [
        'main (1).py', 'main (2).py', 'main (3).py',
        'apps_utils (1).py', 'apps_utils (2).py',
        'device_utils (1).py', 'device_utils (2).py', 'device_utils (3).py',
        'file_utils (1).py', 'file_utils (2).py', 'file_utils (3).py',
        'gps_utils (1).py', 'gps_utils (2).py', 'gps_utils (3).py',
        'network_utils (1).py', 'network_utils (2).py', 'network_utils (3).py',
        'buildozer (1).spec', 'buildozer (2).spec',
        'colab_build (1).py', 'Dockerfile (1)'
    ]
    
    for file in duplicates:
        if os.path.exists(file):
            os.remove(file)
            print(f"Removido: {file}")
    
    # Limpar diretório .buildozer se existir
    if os.path.exists('.buildozer'):
        shutil.rmtree('.buildozer')
        print("Diretório .buildozer limpo")
    
    print("Limpeza concluída!")

if __name__ == "__main__":
    clean_and_prepare()