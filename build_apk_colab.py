#!/usr/bin/env python3
"""
Script para gerar APK usando Google Colab
Execute: python3 build_apk_colab.py
"""

import os
import sys
import time
import subprocess
import urllib.request
import zipfile

def run_command(cmd, description=""):
    """Executa comando e mostra output"""
    print(f"\n🔧 {description}")
    print(f"Executando: {cmd}")

    try:
        result = subprocess.run(cmd, shell=True, check=True,
                              capture_output=True, text=True)
        print("✅ Sucesso!")
        return True
    except subprocess.CalledProcessError as e:
        print(f"❌ Erro: {e}")
        print(f"STDOUT: {e.stdout}")
        print(f"STDERR: {e.stderr}")
        return False

def setup_colab_environment():
    """Configura ambiente similar ao Colab"""
    print("🚀 CONFIGURANDO AMBIENTE COLAB...")

    # Instalar dependências do sistema
    commands = [
        "apt-get update -qq",
        "apt-get install -y python3 python3-pip openjdk-8-jdk git unzip wget build-essential ccache",
        "pip3 install --upgrade pip setuptools wheel",
        "pip3 install buildozer kivy==2.1.0 cython requests plyer",
    ]

    for cmd in commands:
        if not run_command(cmd, f"Instalando {cmd.split()[1] if len(cmd.split()) > 1 else cmd}"):
            return False

    # Configurar Android SDK
    print("\n📱 CONFIGURANDO ANDROID SDK...")

    android_home = "/opt/android-sdk"
    os.makedirs(android_home, exist_ok=True)

    # Baixar SDK
    sdk_url = "https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip"
    sdk_zip = "/tmp/commandlinetools.zip"

    print("📥 Baixando Android SDK...")
    urllib.request.urlretrieve(sdk_url, sdk_zip)

    # Extrair
    with zipfile.ZipFile(sdk_zip, 'r') as zip_ref:
        zip_ref.extractall(android_home)

    # Mover para estrutura correta
    cmdline_dir = os.path.join(android_home, "cmdline-tools")
    latest_dir = os.path.join(cmdline_dir, "latest")

    if os.path.exists(cmdline_dir):
        os.makedirs(latest_dir, exist_ok=True)
        run_command(f"cp -r {cmdline_dir}/* {latest_dir}/ 2>/dev/null || true", "Organizando SDK")

    # Configurar variáveis
    os.environ['ANDROID_HOME'] = android_home
    os.environ['ANDROID_SDK_ROOT'] = android_home
    os.environ['PATH'] = f"{os.environ['PATH']}:{latest_dir}/bin"
    os.environ['JAVA_HOME'] = "/usr/lib/jvm/java-8-openjdk-amd64"

    # Aceitar licenças
    run_command("yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses >/dev/null 2>&1 || true", "Aceitando licenças")

    # Instalar componentes
    run_command("$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager 'platform-tools' 'platforms;android-30' 'build-tools;30.0.3' >/dev/null 2>&1 || true", "Instalando componentes Android")

    return True

def build_apk():
    """Gera o APK"""
    print("\n🔥 GERANDO APK...")

    # Entrar na pasta do app
    app_dir = "Spy-mobile"
    if not os.path.exists(app_dir):
        print(f"❌ Pasta {app_dir} não encontrada!")
        return False

    os.chdir(app_dir)

    # Limpar builds anteriores
    run_command("rm -rf .buildozer bin", "Limpando builds anteriores")

    # Build APK
    if run_command("buildozer android debug", "Gerando APK"):
        # Verificar se APK foi criado
        apk_files = [f for f in os.listdir("bin") if f.endswith(".apk")] if os.path.exists("bin") else []

        if apk_files:
            apk_path = f"bin/{apk_files[0]}"
            final_path = f"../spy-mobile.apk"
            run_command(f"cp {apk_path} {final_path}", f"Copiando APK para {final_path}")

            print("\n🎉 APK GERADO COM SUCESSO!")
            print(f"📱 Localização: {os.path.abspath(final_path)}")
            return True
        else:
            print("❌ APK não encontrado na pasta bin/")
            return False
    else:
        print("❌ Falha na geração do APK")
        return False

def main():
    """Função principal"""
    print("📱 GERADOR DE APK - SIMILAR COLAB")
    print("=" * 40)

    # Verificar se estamos na pasta correta
    if not os.path.exists("Spy-mobile"):
        print("❌ Execute este script da pasta raiz do projeto!")
        sys.exit(1)

    # Setup ambiente
    if not setup_colab_environment():
        print("❌ Falha na configuração do ambiente")
        sys.exit(1)

    # Build APK
    if build_apk():
        print("\n✅ PROCESSO CONCLUÍDO COM SUCESSO!")
        print("📱 APK pronto para uso!")
    else:
        print("\n❌ PROCESSO FALHOU!")
        sys.exit(1)

if __name__ == "__main__":
    main()
