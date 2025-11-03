# Dockerfile para gerar APK Android
FROM ubuntu:20.04

# Evitar prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependências básicas
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    openjdk-8-jdk \
    wget \
    unzip \
    git \
    build-essential \
    libffi-dev \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Configurar Java
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Instalar dependências Python
RUN pip3 install --no-cache-dir \
    buildozer==1.4.0 \
    kivy==2.1.0 \
    requests \
    cython==0.29.33

# Baixar e configurar Android SDK
RUN mkdir -p /opt/android-sdk && \
    cd /opt/android-sdk && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip && \
    unzip -q commandlinetools-linux-8512546_latest.zip && \
    mkdir -p cmdline-tools/latest && \
    mv cmdline-tools/* cmdline-tools/latest/ && \
    rm commandlinetools-linux-8512546_latest.zip

# Baixar Android NDK
RUN cd /opt && \
    wget -q https://dl.google.com/android/repository/android-ndk-r25b-linux.zip && \
    unzip -q android-ndk-r25b-linux.zip && \
    rm android-ndk-r25b-linux.zip

# Configurar variáveis de ambiente
ENV ANDROID_HOME=/opt/android-sdk
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV ANDROID_NDK_HOME=/opt/android-ndk-r25b
ENV NDK_HOME=/opt/android-ndk-r25b
ENV PATH=$PATH:/opt/android-sdk/cmdline-tools/latest/bin:/opt/android-sdk/platform-tools

# Aceitar licenças e instalar componentes SDK
RUN yes | sdkmanager --licenses && \
    sdkmanager "platforms;android-30" "build-tools;30.0.3" "platform-tools"

# Criar diretório de trabalho
WORKDIR /app

# Copiar arquivos do projeto
COPY . /app/

# Script de entrada
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]