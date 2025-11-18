# 📱 Spy Mobile APK Generator

Gerador de APK para aplicativo Spy Mobile usando GitHub Codespaces.

## 🚀 Como usar

### 1. Fazer upload dos arquivos
- `main.py` - Código do aplicativo
- `buildozer.spec` - Configurações do build
- `setup_codespaces.sh` - Script de setup

### 2. Abrir no Codespaces
1. Clique em **Code** → **Codespaces** → **Create codespace**
2. Aguarde o ambiente carregar

### 3. Executar build
```bash
chmod +x setup_codespaces.sh
./setup_codespaces.sh
```

### 4. Baixar APK
- APK será gerado na pasta `bin/`
- Clique no arquivo para baixar

## ⏰ Tempo estimado
- Setup: 5 minutos
- Build: 20-25 minutos
- Total: ~30 minutos

## 📱 Resultado
APK funcional com:
- Timer digital
- Botões PLAY/STOP
- Interface profissional
- Compatível com Android 5.0+

## 🔧 Solução de problemas
Se der erro, execute:
```bash
buildozer android clean
buildozer android debug --verbose
```