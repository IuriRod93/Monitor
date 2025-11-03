# 📱 Guia para Gerar APK do Spy Mobile

## 🎯 Opções Disponíveis

### **Opção 1: WSL (Recomendado para Windows)**
```cmd
# 1. Execute o setup (apenas uma vez)
setup_build_env.bat

# 2. Gere o APK
build_apk.bat
```

### **Opção 2: Docker (Mais Confiável)**
```cmd
# 1. Instale Docker Desktop
# Download: https://www.docker.com/products/docker-desktop

# 2. Execute o build
build_apk_docker.bat
```

### **Opção 3: Python-for-Android (Mais Simples)**
```cmd
build_simple.bat
```

## 📋 Pré-requisitos

### Para WSL:
- Windows 10/11 com WSL2
- Python 3.8+
- Git

### Para Docker:
- Docker Desktop instalado
- 8GB+ RAM disponível

### Para Python-for-Android:
- Python 3.8+
- Java JDK 8
- Android SDK (será baixado automaticamente)

## 🔧 Configuração Manual (Avançado)

Se preferir configurar manualmente:

1. **Instale Buildozer:**
```cmd
pip install buildozer cython
```

2. **Configure Android SDK:**
```cmd
# Baixe Android SDK de: https://developer.android.com/studio
# Defina ANDROID_HOME nas variáveis de ambiente
```

3. **Gere APK:**
```cmd
buildozer android debug
```

## 📁 Estrutura de Arquivos

```
Spy-mobile/
├── main.py              # Aplicativo principal
├── buildozer.spec       # Configuração do build
├── requirements.txt     # Dependências Python
├── icons/              # Ícones do app
├── *.py                # Módulos auxiliares
└── bin/                # APK gerado aqui
```

## 🚀 Após Gerar o APK

1. **Localizar APK:**
   - WSL: `~/spy-mobile-build/bin/`
   - Docker: `./bin/`
   - P4A: `./dist/`

2. **Instalar no Android:**
```cmd
# Via ADB
adb install spymobile-0.1-debug.apk

# Ou copie para o celular e instale manualmente
```

3. **Habilitar Permissões:**
   - Vá em Configurações > Apps > Spy Mobile
   - Habilite todas as permissões necessárias

## ⚠️ Problemas Comuns

### Build falha com erro de memória:
- Feche outros programas
- Use Docker com mais RAM alocada

### Erro de permissões no WSL:
```cmd
wsl sudo chmod +x ~/.local/bin/buildozer
```

### APK não instala:
- Habilite "Fontes desconhecidas" no Android
- Verifique se o APK não está corrompido

### Erro de Java:
```cmd
# Instale Java JDK 8
# Windows: https://adoptopenjdk.net/
```

## 📞 Suporte

Se encontrar problemas:
1. Verifique os logs de build
2. Consulte a documentação do Buildozer
3. Teste com um projeto Kivy simples primeiro

## 🔒 Nota de Segurança

Este aplicativo coleta dados sensíveis. Use apenas:
- Em dispositivos próprios
- Com consentimento do usuário
- Respeitando leis locais de privacidade