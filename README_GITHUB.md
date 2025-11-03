# 🚀 Spy Mobile APK - GitHub Repository

Gerador automático de APK usando Docker no GitHub Codespaces.

## ⚡ USAR NO CODESPACES (Recomendado):

1. **Clique em**: `Code` → `Codespaces` → `Create codespace`
2. **Execute**: `build-apk`
3. **Aguarde**: 20-25 minutos
4. **Baixe**: APK da pasta `bin/`

## 🐳 USAR COM DOCKER LOCAL:

```bash
git clone https://github.com/IuriRod93/spy-mobile-apk.git
cd spy-mobile-apk
docker build -f Dockerfile.codespaces -t spy-builder .
docker run --rm -v $(pwd):/workspace spy-builder build-apk
```

## 📁 ARQUIVOS PRINCIPAIS:

- `main.py` - App Kivy com timer
- `buildozer.spec` - Configuração Android
- `Dockerfile.codespaces` - Container otimizado
- `build-apk.sh` - Script de build
- `devcontainer.json` - Config Codespaces

## 🎯 RESULTADO:

✅ APK funcional Android 5.0+  
✅ Interface com timer digital  
✅ Botões PLAY/STOP  
✅ Conexão com servidor Django  

## 🔧 PERSONALIZAR:

### Mudar IP do servidor:
```python
# Em main.py, linha 102:
'http://SEU_IP:8000/api/data/'
```

### Mudar nome do app:
```ini
# Em buildozer.spec:
title = Meu App
package.name = meuapp
```

## ⏰ TEMPO: ~25 minutos total