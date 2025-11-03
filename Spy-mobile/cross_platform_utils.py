from kivy.utils import platform

def get_device_info():
    """Coleta informações básicas do dispositivo de forma segura"""
    info = {
        'platform': platform,
        'timestamp': time.time(),
        'app_version': '1.0'
    }
    
    if platform == 'android':
        try:
            from jnius import autoclass
            Build = autoclass('android.os.Build')
            info.update({
                'device_model': Build.MODEL,
                'android_version': Build.VERSION.RELEASE,
                'manufacturer': Build.MANUFACTURER
            })
        except:
            pass
    elif platform == 'ios':
        try:
            from pyobjus import autoclass
            UIDevice = autoclass('UIDevice')
            device = UIDevice.currentDevice()
            info.update({
                'device_model': device.model(),
                'ios_version': device.systemVersion(),
                'device_name': device.name()
            })
        except:
            pass
    
    return info

def get_location_safe():
    """Obtém localização de forma segura e multiplataforma"""
    try:
        if platform == 'android':
            from gps_utils import get_location
            return get_location()
        elif platform == 'ios':
            from ios_utils import get_location_ios
            return get_location_ios()
        else:
            # Desktop/outros - usar IP geolocation como fallback
            import requests
            response = requests.get('http://ip-api.com/json/', timeout=5)
            data = response.json()
            return data.get('lat'), data.get('lon')
    except:
        return None, None