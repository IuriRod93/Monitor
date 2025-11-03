#!/usr/bin/env python3
"""
IROD SPY - BUILD APK LOCAL NO WINDOWS
Execute: python build-local-windows.py
"""

import os
import sys
import subprocess
import shutil

def run_command(cmd, cwd=None):
    """Executa comando e mostra output"""
    print(f"Executando: {cmd}")
    try:
        result = subprocess.run(cmd, shell=True, cwd=cwd, 
                              capture_output=True, text=True)
        if result.stdout:
            print(result.stdout)
        if result.stderr:
            print(result.stderr)
        return result.returncode == 0
    except Exception as e:
        print(f"ERRO: {e}")
        return False

def main():
    print("=" * 50)
    print("   IROD SPY - BUILD APK LOCAL")
    print("=" * 50)
    
    # Diretório do projeto
    project_dir = r"C:\Users\Iuri\Desktop\Projetos\Monitoramento\Spy-mobile"
    os.chdir(project_dir)
    
    print(f"Diretorio: {os.getcwd()}")
    
    # 1. Instalar dependências
    print("\n[1/5] Instalando dependências...")
    packages = [
        "pip install --upgrade pip",
        "pip install buildozer",
        "pip install cython",
        "pip install kivy kivymd",
        "pip install plyer requests pillow"
    ]
    
    for pkg in packages:
        if not run_command(pkg):
            print(f"FALHA ao instalar: {pkg}")
            return
    
    # 2. Limpar builds anteriores
    print("\n[2/5] Limpando builds anteriores...")
    dirs_to_clean = [".buildozer", "bin"]
    for dir_name in dirs_to_clean:
        if os.path.exists(dir_name):
            shutil.rmtree(dir_name)
            print(f"Removido: {dir_name}")
    
    # 3. Verificar arquivos necessários
    print("\n[3/5] Verificando arquivos...")
    required_files = ["main.py", "buildozer-social.spec"]
    for file in required_files:
        if not os.path.exists(file):
            print(f"ERRO: Arquivo nao encontrado: {file}")
            return
        print(f"OK: {file}")
    
    # 4. Configurar buildozer
    print("\n[4/5] Configurando buildozer...")
    if not os.path.exists("buildozer.spec"):
        run_command("buildozer init")
    
    # 5. Build APK
    print("\n[5/5] Gerando APK...")
    print("AVISO: Isso pode demorar 20-30 minutos...")
    
    if run_command("buildozer android debug --spec buildozer-social.spec"):
        # Verificar se APK foi gerado
        bin_dir = "bin"
        if os.path.exists(bin_dir):
            apk_files = [f for f in os.listdir(bin_dir) if f.endswith('.apk')]
            if apk_files:
                print("\n" + "=" * 50)
                print("   APK GERADO COM SUCESSO!")
                print("=" * 50)
                for apk in apk_files:
                    apk_path = os.path.join(bin_dir, apk)
                    size = os.path.getsize(apk_path) / (1024*1024)  # MB
                    print(f"APK: {apk} ({size:.1f} MB)")
                    print(f"Local: {os.path.abspath(apk_path)}")
                
                print("\nPara instalar no Android:")
                print(f"adb install {os.path.join(bin_dir, apk_files[0])}")
                return
    
    print("\nFALHA ao gerar APK")
    print("Verifique os logs acima para detalhes")

if __name__ == "__main__":
    main()