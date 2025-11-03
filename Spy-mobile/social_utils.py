from kivy.utils import platform
import json

if platform == 'android':
    from jnius import autoclass
    
    def get_social_data():
        """Coleta dados básicos de redes sociais instaladas"""
        try:
            social_apps = []
            
            # Lista de apps de redes sociais para verificar
            social_packages = [
                'com.whatsapp',
                'com.facebook.katana',
                'com.instagram.android',
                'com.twitter.android',
                'com.snapchat.android',
                'com.tencent.mm',  # WeChat
                'com.viber.voip',
                'org.telegram.messenger',
                'com.skype.raider',
                'com.linkedin.android'
            ]
            
            PythonActivity = autoclass('org.kivy.android.PythonActivity')
            activity = PythonActivity.mActivity
            PackageManager = activity.getPackageManager()
            
            for package in social_packages:
                try:
                    app_info = PackageManager.getApplicationInfo(package, 0)
                    app_name = PackageManager.getApplicationLabel(app_info).toString()
                    
                    social_apps.append({
                        'package': package,
                        'name': app_name,
                        'installed': True
                    })
                except:
                    # App não instalado
                    continue
            
            return {
                'social_apps': social_apps,
                'total_social_apps': len(social_apps)
            }
            
        except Exception as e:
            print(f"Erro ao coletar dados sociais: {e}")
            return {}
else:
    def get_social_data():
        return {}

def get_messaging_apps():
    """Obtém lista de apps de mensagens instalados"""
    if platform == 'android':
        data = get_social_data()
        messaging_apps = []
        for app in data.get('social_apps', []):
            if any(msg in app['package'] for msg in ['whatsapp', 'telegram', 'viber', 'messenger']):
                messaging_apps.append(app)
        return messaging_apps
    return []