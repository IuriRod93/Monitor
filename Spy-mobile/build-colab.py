"""
IROD SPY - BUILD APK NO GOOGLE COLAB
Copie este código para o Google Colab: https://colab.research.google.com
"""

# Instalar dependências
!apt update
!apt install -y git zip unzip openjdk-8-jdk wget
!pip install buildozer cython

# Configurar Java
import os
os.environ['JAVA_HOME'] = '/usr/lib/jvm/java-8-openjdk-amd64'

# Fazer upload dos arquivos do projeto ou clonar
# Opção 1: Upload manual dos arquivos
print("📁 FAÇA UPLOAD DOS ARQUIVOS:")
print("- main.py")
print("- buildozer-social.spec") 
print("- screenshot_utils.py")
print("- social_utils.py")
print("- Todos os arquivos .py do projeto")

# Opção 2: Se tiver no GitHub (descomente se usar)
# !git clone https://github.com/seu-usuario/spy-mobile.git
# %cd spy-mobile

# Build APK
print("\n🚀 INICIANDO BUILD APK...")
!buildozer android debug --spec buildozer-social.spec

# Download APK
print("\n📱 APK GERADO!")
print("Baixe o arquivo .apk da pasta bin/")

from google.colab import files
import glob

apk_files = glob.glob("bin/*.apk")
if apk_files:
    for apk in apk_files:
        print(f"📥 Baixando: {apk}")
        files.download(apk)
else:
    print("❌ Nenhum APK encontrado")