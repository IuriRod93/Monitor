# 💻 GERAR APK NO GITHUB CODESPACES

## 🚀 MÉTODO GRATUITO E CONFIÁVEL

### PRÉ-REQUISITOS:
- **Conta GitHub** (gratuita)
- **60 horas/mês** gratuitas no Codespaces

## ⚡ PASSO A PASSO:

### PASSO 1 - Criar Repositório GitHub
1. Acesse: https://github.com
2. Clique em **"New repository"**
3. Nome: `spy-mobile-apk`
4. Marque **"Public"** (para usar gratuito)
5. Clique **"Create repository"**

### PASSO 2 - Upload dos Arquivos
1. Clique em **"uploading an existing file"**
2. Arraste estes arquivos:
   - `main.py`
   - `buildozer.spec`
   - `setup_codespaces.sh`
3. Commit: `"Add APK build files"`

### PASSO 3 - Abrir Codespaces
1. No repositório, clique em **"Code"**
2. Aba **"Codespaces"**
3. Clique **"Create codespace on main"**
4. Aguarde carregar (2-3 minutos)

### PASSO 4 - Executar Build
No terminal do Codespaces:
```bash
chmod +x setup_codespaces.sh
./setup_codespaces.sh
```

## 🔥 PROCESSO AUTOMÁTICO:

1. **Instala dependências** (5 minutos)
2. **Baixa Android SDK/NDK** (10 minutos)
3. **Gera APK** (15-20 minutos)
4. **APK pronto** para download

## 📱 COMANDOS PARA CODESPACES:

### Setup completo:
```bash
#!/bin/bash
echo "🚀 Configurando ambiente para APK..."

# Atualizar sistema
sudo apt update -qq
sudo apt install -y openjdk-8-jdk unzip wget git build-essential

# Instalar Python deps
pip3 install buildozer==1.4.0 kivy==2.1.0 requests cython==0.29.33

# Configurar Java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Baixar Android SDK
mkdir -p ~/android-sdk
cd ~/android-sdk
wget -q https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
unzip -q commandlinetools-linux-8512546_latest.zip
mkdir -p cmdline-tools/latest
mv cmdline-tools/* cmdline-tools/latest/

# Configurar ambiente
export ANDROID_HOME=~/android-sdk
export ANDROID_SDK_ROOT=~/android-sdk
export PATH=$PATH:~/android-sdk/cmdline-tools/latest/bin

# Aceitar licenças
yes | sdkmanager --licenses
sdkmanager "platforms;android-30" "build-tools;30.0.3"

echo "✅ Ambiente configurado!"

# Gerar APK
cd /workspaces/spy-mobile-apk
buildozer android debug

echo "🎉 APK gerado em bin/"
ls -la bin/
```

## 🎯 VANTAGENS DO CODESPACES:

✅ **Gratuito** - 60 horas/mês  
✅ **VS Code completo** - interface familiar  
✅ **Linux nativo** - buildozer funciona perfeitamente  
✅ **4 cores + 8GB RAM** - build rápido  
✅ **Persistente** - arquivos salvos  
✅ **Download direto** - APK via browser  

## 📋 ARQUIVOS NECESSÁRIOS:

### main.py (já criado)
### buildozer.spec (já criado)
### setup_codespaces.sh (criar):
```bash
#!/bin/bash
echo "🚀 GERANDO APK NO CODESPACES"
echo "============================"

# Instalar dependências
sudo apt update -qq
sudo apt install -y openjdk-8-jdk unzip wget git build-essential
pip3 install buildozer==1.4.0 kivy==2.1.0 requests cython==0.29.33

# Configurar Java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Baixar Android SDK
mkdir -p ~/android-sdk && cd ~/android-sdk
wget -q https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
unzip -q commandlinetools-linux-8512546_latest.zip
mkdir -p cmdline-tools/latest && mv cmdline-tools/* cmdline-tools/latest/

# Configurar ambiente
export ANDROID_HOME=~/android-sdk
export ANDROID_SDK_ROOT=~/android-sdk
export PATH=$PATH:~/android-sdk/cmdline-tools/latest/bin

# Aceitar licenças
yes | sdkmanager --licenses
sdkmanager "platforms;android-30" "build-tools;30.0.3"

# Voltar para projeto e gerar APK
cd /workspaces/spy-mobile-apk
echo "🔥 Gerando APK... Aguarde 20 minutos"
buildozer android debug

# Verificar resultado
if [ -f "bin/*.apk" ]; then
    echo "🎉 APK gerado com sucesso!"
    ls -la bin/
    echo "📱 Baixe o APK da pasta bin/"
else
    echo "❌ Erro na geração do APK"
fi
```

## 🔧 COMANDOS ÚTEIS:

### Ver progresso:
```bash
tail -f .buildozer/android/platform/build-*/build.log
```

### Limpar build:
```bash
buildozer android clean
```

### Tentar novamente:
```bash
buildozer android debug --verbose
```

### Baixar APK:
1. Clique na pasta `bin/`
2. Clique no arquivo `.apk`
3. Clique em **"Download"**

## ⏰ TEMPO ESTIMADO:

- **Setup**: 5 minutos
- **Build APK**: 20-25 minutos
- **Total**: ~30 minutos

## 💡 DICAS:

- **Mantenha aba aberta** - não feche durante build
- **Use terminal integrado** - mais estável
- **Monitore logs** - acompanhe progresso
- **Salve arquivos** - commit no final

## 🎉 RESULTADO:

APK funcional gerado no Codespaces, pronto para download e instalação no Android!

**Codespaces é a melhor opção gratuita!** 💻