# Como Compilar a Aplicação Android

## Problema Atual
O buildozer não funciona nativamente no Windows devido a dependências do Linux.

## Soluções Disponíveis

### 1. Docker (RECOMENDADO - Mais Fácil)
```bash
# 1. Instale o Docker Desktop: https://www.docker.com/products/docker-desktop
# 2. Execute o script:
build-android.bat
```

### 2. WSL (Windows Subsystem for Linux)
```bash
# 1. Instale WSL:
wsl --install

# 2. No Ubuntu WSL:
sudo apt update
sudo apt install -y git zip unzip openjdk-17-jdk python3-pip
pip3 install buildozer

# 3. Copie o projeto para WSL e execute:
buildozer android debug
```

### 3. Kivy Launcher (Para Testes)
1. Instale o Kivy Launcher no Android
2. Copie os arquivos .py para o dispositivo
3. Execute via Kivy Launcher

### 4. Compilação Online
- Use serviços como GitHub Actions
- Configure CI/CD para build automático

## Arquivos Necessários
- ✅ buildozer.spec (corrigido)
- ✅ main.py
- ✅ requirements.txt
- ✅ Dockerfile
- ✅ build-android.bat

## Próximos Passos
1. Escolha uma das soluções acima
2. Execute o build
3. Teste o APK gerado