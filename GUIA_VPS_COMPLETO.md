# 🚀 GUIA COMPLETO - DJANGO NA VPS

## 📋 **PASSO A PASSO COMPLETO**

### **1. Preparar Arquivos Localmente**
```bash
# Atualizar arquivos para VPS
python atualizar_app_para_vps.py
```

### **2. Configurar VPS Automaticamente**
```bash
# Executar script de configuração
conectar_e_configurar_vps.bat
```

**OU manualmente:**
```bash
# Upload do script
scp deploy_vps_completo.sh root@147.79.111.118:/root/

# Conectar e executar
ssh root@147.79.111.118
chmod +x /root/deploy_vps_completo.sh
/root/deploy_vps_completo.sh
```

### **3. Testar VPS**
```bash
# Testar conectividade
python testar_vps.py

# Ou via curl
curl http://147.79.111.118/api/test/
```

### **4. Gerar APK para VPS**
```bash
# Usar arquivo otimizado
cp main_vps.py main.py
cp buildozer_vps.spec buildozer.spec

# Gerar APK
buildozer android debug
```

## 🌐 **CONFIGURAÇÃO DA VPS**

### **IP e Portas:**
- **IP**: `147.79.111.118`
- **Porta Web**: `80` (Nginx)
- **Porta Django**: `8000` (interno)
- **SSH**: `22`

### **Credenciais:**
- **SSH**: `root` / `Irod-ti93#12#13`
- **Django Admin**: `admin` / `admin123`

### **URLs Importantes:**
- **Interface Web**: `http://147.79.111.118/`
- **API Test**: `http://147.79.111.118/api/test/`
- **API Atividade**: `http://147.79.111.118/api/atividade/`
- **API Localização**: `http://147.79.111.118/api/localizacao/`

## 📱 **CONFIGURAÇÃO DO APP**

### **Arquivo main.py atualizado:**
```python
# IP da VPS configurado automaticamente
SERVER_IP = '147.79.111.118'
SERVER_PORT = '80'
BASE_URL = f"http://{SERVER_IP}"
```

### **Endpoints que o app usará:**
- `http://147.79.111.118/api/atividade/` - Atividades
- `http://147.79.111.118/api/localizacao/` - GPS
- `http://147.79.111.118/api/test/` - Teste

## 🔧 **COMANDOS ÚTEIS VPS**

### **Verificar Status:**
```bash
# Status dos serviços
systemctl status nginx
supervisorctl status spy

# Logs do Django
tail -f /var/log/spy.log

# Logs do Nginx
tail -f /var/log/nginx/access.log
```

### **Reiniciar Serviços:**
```bash
# Reiniciar Django
supervisorctl restart spy

# Reiniciar Nginx
systemctl restart nginx

# Reiniciar tudo
systemctl restart nginx && supervisorctl restart spy
```

### **Gerenciar Django:**
```bash
# Acessar projeto
cd /var/www/spy
source venv/bin/activate

# Comandos Django
python manage.py shell
python manage.py createsuperuser
python manage.py migrate
```

## 🧪 **TESTES**

### **1. Teste Local (antes de subir):**
```bash
python testar_vps.py
```

### **2. Teste via Browser:**
- Acesse: `http://147.79.111.118/`
- Login: `admin` / `admin123`

### **3. Teste API:**
```bash
curl -X GET http://147.79.111.118/api/test/
curl -X POST http://147.79.111.118/api/atividade/ \
  -H "Content-Type: application/json" \
  -d '{"imei":"teste123","descricao":"teste"}'
```

### **4. Teste do APK:**
1. Instale o APK no dispositivo
2. Clique em "PLAY"
3. Verifique dados em: `http://147.79.111.118/`

## 🔒 **SEGURANÇA**

### **Firewall Configurado:**
- Porta 22 (SSH)
- Porta 80 (HTTP)
- Porta 8000 (Django interno)

### **Melhorias de Segurança:**
```bash
# Alterar senha root
passwd root

# Configurar SSL (opcional)
apt install certbot python3-certbot-nginx
certbot --nginx -d 147.79.111.118
```

## 📊 **MONITORAMENTO**

### **Verificar Dispositivos:**
```sql
# No Django shell
from monitoramento.models import Dispositivo, Atividade
print(f"Dispositivos: {Dispositivo.objects.count()}")
print(f"Atividades: {Atividade.objects.count()}")
```

### **Logs em Tempo Real:**
```bash
# Terminal 1: Django
tail -f /var/log/spy.log

# Terminal 2: Nginx
tail -f /var/log/nginx/access.log

# Terminal 3: Sistema
journalctl -f
```

## 🚨 **SOLUÇÃO DE PROBLEMAS**

### **VPS não responde:**
```bash
# Verificar serviços
systemctl status nginx
supervisorctl status spy

# Reiniciar
systemctl restart nginx
supervisorctl restart spy
```

### **App não conecta:**
1. Verificar IP no código: `147.79.111.118`
2. Testar: `curl http://147.79.111.118/api/test/`
3. Verificar firewall: `ufw status`

### **Dados não aparecem:**
1. Verificar logs: `tail -f /var/log/spy.log`
2. Acessar admin: `http://147.79.111.118/admin/`
3. Verificar banco: Django shell

## ✅ **CHECKLIST FINAL**

- [ ] VPS configurada e rodando
- [ ] Django funcionando na porta 80
- [ ] API respondendo: `/api/test/`
- [ ] Interface web acessível
- [ ] App atualizado com IP da VPS
- [ ] APK gerado e testado
- [ ] Dados sendo recebidos na VPS

## 📞 **SUPORTE**

Se algo não funcionar:

1. **Verificar logs**: `/var/log/spy.log`
2. **Testar API**: `curl http://147.79.111.118/api/test/`
3. **Reiniciar serviços**: `supervisorctl restart spy`
4. **Verificar firewall**: `ufw status`

**Tudo configurado para funcionar automaticamente!** 🎉