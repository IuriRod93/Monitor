# 🚀 GUIA DE TESTE - Sistema Spy

## 📋 Configuração Automática Aplicada

✅ **IP configurado**: `192.168.0.97`  
✅ **Porta**: `8000`  
✅ **URL do servidor**: `http://192.168.0.97:8000`

## 🔧 Passos para Testar

### 1. Iniciar o Servidor Django
```bash
iniciar_servidor.bat
```

### 2. Testar Conexão
```bash
testar_conexao.bat
```

### 3. Acessar Painel Web
Abra no navegador: `http://192.168.0.97:8000`

### 4. Gerar APK Android
```bash
cd Spy-mobile
build-android.bat
```

## 📱 Testando no Android

1. **Instale o APK** gerado na pasta `Spy-mobile/bin/`
2. **Abra o app** no celular
3. **Clique em PLAY** para iniciar monitoramento
4. **Verifique no painel web** se os dados aparecem

## 🔍 Verificações

### No Painel Web:
- ✅ Lista de dispositivos
- ✅ Dados de localização
- ✅ Contatos coletados
- ✅ Mídias enviadas
- ✅ Apps instalados

### No App Android:
- ✅ Timer funcionando
- ✅ Status "Coletando dados"
- ✅ Coleta única ao apertar PLAY
- ✅ Botão COLETAR para nova coleta manual

## 🚨 Solução de Problemas

### Se não conectar:
1. Verifique se o firewall está bloqueando a porta 8000
2. Execute como administrador:
   ```cmd
   netsh advfirewall firewall add rule name="Django Server" dir=in action=allow protocol=TCP localport=8000
   ```

### Se o IP mudar:
1. Execute `ipconfig` novamente
2. Atualize o IP em `Spy-mobile/main.py`
3. Regere o APK

## 📊 Monitoramento Manual

O sistema coleta quando o usuário apertar **PLAY** ou **COLETAR**:
- 📍 **Localização GPS** (atual)
- 📞 **Contatos** (lista completa)
- 💬 **SMS** (histórico)
- 📱 **Apps instalados**
- 🖼️ **Fotos recentes** (até 5 por coleta)
- 🌐 **Redes sociais detectadas**
- 📡 **Status de rede**

**PLAY**: Inicia timer + coleta inicial  
**COLETAR**: Nova coleta manual  
**STOP**: Para o timer