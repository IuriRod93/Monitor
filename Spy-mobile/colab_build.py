import zipfile
import os

# Criar ZIP com todos os arquivos necessários
def create_project_zip():
    files_to_include = [
        'main.py',
        'buildozer.spec',
        'apps_utils.py',
        'device_utils.py',
        'file_utils.py',
        'gps_utils.py',
        'network_utils.py',
        'requirements.txt'
    ]
    
    with zipfile.ZipFile('spy_mobile_project.zip', 'w') as zipf:
        for file in files_to_include:
            if os.path.exists(file):
                zipf.write(file)
                print(f"Adicionado: {file}")
    
    print("ZIP criado: spy_mobile_project.zip")

if __name__ == "__main__":
    create_project_zip()