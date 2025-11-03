from kivy.utils import platform

if platform == 'ios':
    try:
        from pyobjus import autoclass
        
        def get_location_ios():
            # iOS Core Location
            CLLocationManager = autoclass('CLLocationManager')
            manager = CLLocationManager.alloc().init()
            if manager.authorizationStatus() == 3:  # kCLAuthorizationStatusAuthorizedWhenInUse
                location = manager.location()
                if location:
                    return location.coordinate().latitude, location.coordinate().longitude
            return None, None
            
    except ImportError:
        def get_location_ios():
            return None, None
else:
    def get_location_ios():
        return None, None