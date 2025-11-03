# 📁 ARQUIVOS PARA SUBIR NO GITHUB

## ✅ ARQUIVOS ESSENCIAIS:

### 🐳 Docker & Build:
- `Dockerfile.codespaces` - Container otimizado
- `build-apk.sh` - Script de build automático  
- `docker-compose.yml` - Para uso local
- `devcontainer.json` - Config Codespaces

### 📱 App:
- `main.py` - Aplicativo Kivy
- `buildozer.spec` - Configuração Android
- `requirements.txt` - Dependências Python

### 📖 Documentação:
- `README_GITHUB.md` - Instruções de uso

## 🚀 COMANDOS PARA SUBIR:

### Opção 1 - Script Automático:
```powershell
.\upload_files.ps1
```

### Opção 2 - Manual:
```bash
git init
git remote add origin https://github.com/IuriRod93/spy-mobile-apk.git
git add main.py buildozer.spec Dockerfile.codespaces build-apk.sh devcontainer.json docker-compose.yml requirements.txt README_GITHUB.md
git commit -m "🚀 Setup APK Builder completo"
git branch -M main
git push -u origin main --force
```

## 🎯 RESULTADO NO GITHUB:

Após upload, o repositório terá:
- ✅ **Codespaces pronto** - 1 clique para usar
- ✅ **Docker configurado** - build automático
- ✅ **Documentação clara** - instruções simples
- ✅ **Arquivos otimizados** - build em 25 minutos

## 📋 USAR DEPOIS DO UPLOAD:

1. **GitHub** → **Code** → **Codespaces** → **Create**
2. **Terminal**: `build-apk`
3. **Aguardar**: 25 minutos
4. **Baixar**: APK da pasta `bin/`