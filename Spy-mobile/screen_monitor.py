from kivy.utils import platform
import time
import threading

if platform == 'android':
    from jnius import autoclass
    
    def get_current_app():
        """Obtém o app atualmente em foco"""
        try:
            PythonActivity = autoclass('org.kivy.android.PythonActivity')
            activity = PythonActivity.mActivity
            ActivityManager = autoclass('android.app.ActivityManager')
            
            am = activity.getSystemService('activity')
            tasks = am.getRunningTasks(1)
            
            if tasks and len(tasks) > 0:
                top_activity = tasks[0].topActivity
                return str(top_activity.getPackageName())
            
        except Exception as e:
            print(f"Erro ao obter app atual: {e}")
        
        return None
    
    def monitor_app_usage():
        """Monitora uso de apps de redes sociais"""
        social_apps = {
            'com.whatsapp': 'WhatsApp',
            'org.telegram.messenger': 'Telegram',
            'com.facebook.katana': 'Facebook',
            'com.instagram.android': 'Instagram',
            'com.twitter.android': 'Twitter',
            'com.snapchat.android': 'Snapchat'
        }
        
        interactions = []
        last_app = None
        start_time = None
        
        while True:
            try:
                current_app = get_current_app()
                current_time = time.time()
                
                if current_app != last_app:
                    # App mudou
                    if last_app and last_app in social_apps and start_time:
                        # Registrar tempo no app anterior
                        duration = current_time - start_time
                        if duration > 1:  # Mais de 1 segundo
                            interaction = {
                                'app': social_apps[last_app],
                                'package': last_app,
                                'start_time': start_time,
                                'end_time': current_time,
                                'duration': duration,
                                'type': 'app_usage'
                            }
                            interactions.append(interaction)
                            print(f"Uso detectado: {social_apps[last_app]} por {duration:.1f}s")
                    
                    # Iniciar contagem para novo app
                    if current_app and current_app in social_apps:
                        start_time = current_time
                    else:
                        start_time = None
                    
                    last_app = current_app
                
                time.sleep(1)  # Verificar a cada segundo
                
            except Exception as e:
                print(f"Erro no monitor: {e}")
                time.sleep(5)
        
        return interactions

else:
    def get_current_app():
        return None
    
    def monitor_app_usage():
        return []