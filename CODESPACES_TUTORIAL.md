# 🚀 GERAR APK NO GITHUB CODESPACES

## ⚡ SETUP RÁPIDO (1 comando):

### 1. Abrir no Codespaces
1. **Faça upload** dos arquivos para GitHub
2. **Clique em Code** → **Codespaces** → **Create codespace**
3. **Aguarde** o ambiente carregar (5 minutos)

### 2. Gerar APK
```bash
build-apk
```

## 📁 ARQUIVOS NECESSÁRIOS:

- `Dockerfile.codespaces` - Container otimizado
- `build-apk.sh` - Script de build
- `devcontainer.json` - Configuração Codespaces
- `main.py` - App (criado automaticamente)
- `buildozer.spec` - Config (criado automaticamente)

## ⏰ TEMPO TOTAL: ~25 minutos
- Setup: 5 minutos
- Build: 20 minutos

## 📱 RESULTADO:
- APK na pasta `bin/`
- Download direto pelo VS Code
- App funcional com timer

## 🔧 SE DER ERRO:
```bash
# Limpar e tentar novamente
buildozer android clean
build-apk
```

## 🎯 VANTAGENS:
✅ **Ambiente isolado** - sem conflitos  
✅ **Automático** - 1 comando apenas  
✅ **Gratuito** - GitHub Codespaces  
✅ **Rápido** - container otimizado  
✅ **Confiável** - sempre funciona