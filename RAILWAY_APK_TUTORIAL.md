# 🚂 GERAR APK COM RAILWAY CLI

## 🚀 MÉTODO CLOUD RÁPIDO E GRATUITO

### PRÉ-REQUISITOS:
- **Conta Railway** (gratuita)
- **Railway CLI** instalado
- **Git** instalado

## ⚡ PASSO A PASSO:

### PASSO 1 - Instalar Railway CLI

#### Opção A - NPM:
```cmd
npm install -g @railway/cli
```

#### Opção B - Download direto:
1. Acesse: https://railway.app/cli
2. Baixe para Windows
3. Instale normalmente

### PASSO 2 - Configurar Projeto
```cmd
# Navegar para pasta do projeto
cd C:\Users\Iuri\Desktop\Projetos\Monitoramento

# Login no Railway
railway login

# Inicializar projeto
railway init
```

### PASSO 3 - Deploy e Gerar APK
```cmd
# Fazer deploy (inicia build do APK)
railway up

# Acompanhar logs
railway logs --follow
```

## 🔥 PROCESSO AUTOMÁTICO:

1. **Upload do código** para Railway
2. **Build da imagem Docker** (5-10 min)
3. **Download Android SDK** (automático)
4. **Geração do APK** (15-20 min)
5. **Logs com resultado** (download link)

## 📱 ARQUIVOS NECESSÁRIOS:

```
📁 Monitoramento/
├── main.py              # App Kivy
├── buildozer.spec       # Configuração
├── Dockerfile.railway   # Container
├── railway.json         # Config Railway
└── railway_setup.bat    # Script automático
```

## 🎯 VANTAGENS DO RAILWAY:

✅ **Gratuito** - 500 horas/mês  
✅ **Rápido** - infraestrutura otimizada  
✅ **Sem configuração** - ambiente pronto  
✅ **Logs detalhados** - acompanhar progresso  
✅ **Reutilizável** - deploy novamente fácil  

## 🔧 COMANDOS ÚTEIS:

### Ver projetos:
```cmd
railway list
```

### Ver logs em tempo real:
```cmd
railway logs --follow
```

### Redeploy:
```cmd
railway up --detach
```

### Deletar projeto:
```cmd
railway delete
```

## 📋 CONFIGURAÇÃO PERSONALIZADA:

### Alterar IP do servidor:
Edite `main.py` linha 94:
```python
'http://SEU_IP_AQUI:8000/api/data/'
```

### Mudar configurações do app:
Edite `buildozer.spec`:
```ini
title = Meu App
package.name = meuapp
```

## 🔍 SOLUÇÃO DE PROBLEMAS:

### Railway CLI não encontrado:
```cmd
# Verificar instalação:
railway --version

# Reinstalar:
npm uninstall -g @railway/cli
npm install -g @railway/cli
```

### Erro de login:
```cmd
# Logout e login novamente:
railway logout
railway login
```

### Build falha:
```cmd
# Ver logs detalhados:
railway logs

# Tentar novamente:
railway up --detach
```

### Limite de tempo:
```cmd
# Railway tem limite de build de 30 minutos
# Se passar, o processo é cancelado
# Tente novamente em horário de menor uso
```

## ⏰ TEMPO ESTIMADO:

- **Setup inicial**: 5 minutos
- **Primeiro deploy**: 25-30 minutos
- **Deploys seguintes**: 20-25 minutos

## 📊 MONITORAMENTO:

### Dashboard Railway:
1. Acesse: https://railway.app/dashboard
2. Selecione seu projeto
3. Vá em "Deployments"
4. Acompanhe o progresso

### Logs em tempo real:
```cmd
railway logs --follow
```

## 🎉 RESULTADO:

O APK será gerado e você verá nos logs:
```
✅ APK gerado com sucesso!
📱 APK disponível para download
```

## 💡 DICAS:

- **Use horários de menor tráfego** (madrugada)
- **Monitore os logs** para acompanhar progresso
- **Mantenha o terminal aberto** durante o build
- **Tenha paciência** - processo leva tempo

## 🚀 SCRIPT AUTOMÁTICO:

Execute simplesmente:
```cmd
railway_setup.bat
```

**Railway é uma excelente opção cloud!** 🚂