@echo off
echo ========================================
echo    BUILD ANDROID COM DOCKER
echo ========================================

REM Verificar se Docker está instalado
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERRO: Docker nao encontrado!
    echo Instale o Docker Desktop para Windows
    echo https://www.docker.com/products/docker-desktop
    pause
    exit /b 1
)

echo Docker encontrado!
echo.

REM Verificar se estamos no diretório correto
if not exist "buildozer.spec" (
    echo ERRO: Arquivo buildozer.spec nao encontrado!
    echo Certifique-se de estar no diretorio correto do projeto
    pause
    exit /b 1
)

echo Preparando build com Docker...
echo.

REM Criar Dockerfile se não existir
if not exist "Dockerfile" (
    echo Criando Dockerfile...
    (
        echo FROM kivy/buildozer:latest
        echo.
        echo WORKDIR /app
        echo.
        echo COPY . /app/
        echo.
        echo RUN buildozer android debug
        echo.
        echo CMD ["cp", "/app/bin/*.apk", "/output/"]
    ) > Dockerfile
)

echo ========================================
echo Executando build no Docker...
echo ========================================

REM Criar diretório de output
if not exist "output" mkdir output

REM Executar build no Docker
docker run --rm -v "%cd%:/app" -v "%cd%\output:/output" kivy/buildozer:latest sh -c "cd /app && buildozer android debug && cp bin/*.apk /output/ 2>/dev/null || echo 'APK nao encontrado em bin/'"

if exist "output\*.apk" (
    echo.
    echo ========================================
    echo APK gerado com SUCESSO!
    echo ========================================
    echo Arquivo APK disponivel em: output\
    dir /b output\*.apk
) else (
    echo.
    echo ========================================
    echo Build concluido - verificando resultados...
    echo ========================================
    echo Procurando APK gerado...
    
    REM Procurar APK em outros locais
    for /r . %%f in (*.apk) do (
        echo Encontrado: %%f
        copy "%%f" output\ >nul 2>&1
    )
    
    if exist "output\*.apk" (
        echo APK copiado para output\
    ) else (
        echo Nenhum APK encontrado. Verifique os logs acima.
    )
)

echo.
pause