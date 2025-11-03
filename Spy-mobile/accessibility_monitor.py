from kivy.utils import platform
import time
import threading

if platform == 'android':
    from jnius import autoclass, PythonJavaClass, java_method
    
    class AccessibilityMonitor(PythonJavaClass):
        __javainterfaces__ = ['android/accessibilityservice/AccessibilityService']
        
        def __init__(self):
            super().__init__()
            self.interactions = []
            self.monitoring = False
        
        @java_method('(Landroid/view/accessibility/AccessibilityEvent;)V')
        def onAccessibilityEvent(self, event):
            if not self.monitoring:
                return
                
            try:
                package_name = event.getPackageName()
                event_type = event.getEventType()
                
                # Monitorar apps de redes sociais
                social_apps = [
                    'com.whatsapp',
                    'org.telegram.messenger', 
                    'com.facebook.katana',
                    'com.instagram.android',
                    'com.twitter.android'
                ]
                
                if package_name and str(package_name) in social_apps:
                    interaction = {
                        'app': str(package_name),
                        'timestamp': time.time(),
                        'event_type': event_type,
                        'text': self.extract_text(event)
                    }
                    
                    self.interactions.append(interaction)
                    print(f"Interação detectada: {interaction}")
                    
            except Exception as e:
                print(f"Erro no AccessibilityService: {e}")
        
        def extract_text(self, event):
            try:
                if event.getText():
                    return str(event.getText())
                return ""
            except:
                return ""
        
        def start_monitoring(self):
            self.monitoring = True
            
        def stop_monitoring(self):
            self.monitoring = False
            
        def get_interactions(self):
            return self.interactions.copy()
            
        def clear_interactions(self):
            self.interactions.clear()

else:
    class AccessibilityMonitor:
        def __init__(self):
            self.interactions = []
            
        def start_monitoring(self):
            pass
            
        def stop_monitoring(self):
            pass
            
        def get_interactions(self):
            return []