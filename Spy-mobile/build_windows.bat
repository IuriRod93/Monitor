@echo off
echo ========================================
echo Gerando APK no Windows - Metodo Alternativo
echo ========================================

echo.
echo Instalando kivymd...
pip install kivymd

echo.
echo Criando versao simplificada para Windows...
python -c "
import os
import shutil

# Criar estrutura basica
os.makedirs('apk_build', exist_ok=True)
os.chdir('apk_build')

# Copiar arquivos principais
shutil.copy('../main.py', 'main.py')
shutil.copy('../*.py', '.')

print('Estrutura criada em apk_build/')
print('Para gerar APK, use um servico online como:')
print('1. https://kivymd.readthedocs.io/en/latest/getting-started/installation/')
print('2. GitHub Actions com buildozer')
print('3. Google Colab com buildozer')
"

echo.
echo ========================================
echo Opcoes para gerar APK:
echo ========================================
echo.
echo 1. Use GitHub Actions (recomendado)
echo 2. Use Google Colab
echo 3. Use uma VM Linux
echo 4. Use WSL2 (Windows Subsystem for Linux)
echo.
echo Para WSL2, execute: wsl --install
echo Depois: wsl sudo apt install python3-pip
echo         wsl pip3 install buildozer
echo         wsl buildozer android debug
echo.
pause