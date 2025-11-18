# Migração para BeeWare - APK Leve no Windows

## Tarefas Pendentes
- [x] Atualizar pyproject.toml para usar Toga em vez de Kivy
- [x] Reescrever spymonitor/app.py usando Toga (remover KivyMD)
- [x] Atualizar requirements.txt para dependências BeeWare leves
- [x] Configurar briefcase para build Android no Windows
- [x] Remover buildozer.spec (não necessário para BeeWare)
- [ ] Testar build do APK
- [ ] Otimizar para tamanho leve do APK

## Funcionalidades a Manter
- Monitoramento de dispositivo
- Captura de localização
- Screenshots automáticos
- Envio de dados para servidor
- Interface simples com botão iniciar/parar
- Logs em tempo real

## Ambiente
- Windows 11
- CMD (não Linux)
- BeeWare com Toga
- Briefcase para build

## Próximos Passos
1. Executar build_beeware.bat para gerar APK
2. Testar APK no dispositivo Android
3. Verificar tamanho do APK (deve ser menor que 50MB)
4. Otimizar se necessário
