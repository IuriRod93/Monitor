"""
GPS utilities for location tracking
"""
import logging
import time
import threading
import platform

logger = logging.getLogger(__name__)

# Global variables for GPS handling
_gps_location = None
_gps_lock = threading.Lock()

def gps_location_callback(**kwargs):
    """Callback for GPS location updates"""
    global _gps_location
    with _gps_lock:
        if 'lat' in kwargs and 'lon' in kwargs:
            _gps_location = (kwargs['lat'], kwargs['lon'])
            logger.debug(f"GPS callback: {_gps_location}")

def gps_status_callback(stype, status):
    """Callback for GPS status updates"""
    logger.debug(f"GPS status: {stype} - {status}")

def get_location():
    """
    Get current GPS location using plyer with improved error handling
    Returns: (latitude, longitude) or (None, None) if unavailable
    """
    global _gps_location

    try:
        from plyer import gps

        # Configure GPS with callbacks
        gps.configure(on_location=gps_location_callback, on_status=gps_status_callback)

        # Reset location
        with _gps_lock:
            _gps_location = None

        # Start GPS
        gps.start(minTime=1000, minDistance=1)  # Update every 1 second, 1 meter

        # Wait for location data (timeout after 15 seconds)
        timeout = 15
        start_time = time.time()

        while time.time() - start_time < timeout:
            with _gps_lock:
                if _gps_location:
                    lat, lon = _gps_location
                    logger.info(f"GPS location obtained: {lat}, {lon}")
                    gps.stop()
                    return lat, lon
            time.sleep(0.5)

        # Timeout reached
        logger.warning("GPS timeout - no location obtained")
        gps.stop()
        return None, None

    except ImportError:
        logger.warning("plyer not available, trying Android-specific GPS")
        return get_location_android()
    except Exception as e:
        logger.error(f"GPS error: {e}")
        try:
            gps.stop()
        except:
            pass
        return get_location_fallback()



def get_location_android():
    """
    Get location using Android-specific APIs
    Returns: (latitude, longitude) or (None, None) if unavailable
    """
    try:
        from jnius import autoclass
        from android.permissions import request_permissions, Permission

        # Request location permissions
        request_permissions([Permission.ACCESS_FINE_LOCATION, Permission.ACCESS_COARSE_LOCATION])

        # Get LocationManager
        LocationManager = autoclass('android.location.LocationManager')
        PythonActivity = autoclass('org.kivy.android.PythonActivity')

        location_manager = PythonActivity.mActivity.getSystemService(PythonActivity.mActivity.LOCATION_SERVICE)

        # Try GPS provider first
        try:
            location = location_manager.getLastKnownLocation(LocationManager.GPS_PROVIDER)
            if location:
                lat = location.getLatitude()
                lon = location.getLongitude()
                logger.info(f"Android GPS location: {lat}, {lon}")
                return lat, lon
        except:
            pass

        # Try network provider
        try:
            location = location_manager.getLastKnownLocation(LocationManager.NETWORK_PROVIDER)
            if location:
                lat = location.getLatitude()
                lon = location.getLongitude()
                logger.info(f"Android network location: {lat}, {lon}")
                return lat, lon
        except:
            pass

        logger.warning("No Android location providers available")
        return None, None

    except ImportError:
        logger.warning("jnius not available, using fallback")
        return get_location_fallback()
    except Exception as e:
        logger.error(f"Android GPS error: {e}")
        return get_location_fallback()

def get_device_info():
    """
    Get device information using plyer
    Returns: dict with device details
    """
    try:
        from plyer import uniqueid
        import platform

        # Try to get unique device ID
        try:
            device_id = uniqueid.get_uid()
        except:
            device_id = str(uuid.uuid4().hex)[:15]

        device_info = {
            'imei': device_id,  # Use device ID as IMEI substitute
            'modelo': platform.machine() or 'Unknown',
            'sistema_operacional': f"{platform.system()} {platform.release()}",
            'nome': platform.node() or 'Unknown Device',
            'usuario': 'Unknown',
            'departamento': 'Unknown'
        }

        logger.info(f"Device info collected: {device_info}")
        return device_info
    except ImportError:
        logger.warning("plyer not available for device info, using fallback")
        import platform
        import uuid

        device_info = {
            'imei': str(uuid.uuid4().hex)[:15],  # Generate pseudo-IMEI
            'modelo': platform.machine() or 'Unknown',
            'sistema_operacional': f"{platform.system()} {platform.release()}",
            'nome': platform.node() or 'Unknown Device',
            'usuario': 'Unknown',
            'departamento': 'Unknown'
        }
        return device_info
    except Exception as e:
        logger.error(f"Device info error: {e}")
        return {}

def get_battery_info():
    """
    Get battery information using plyer
    Returns: dict with battery details
    """
    try:
        from plyer import battery
        status = battery.get_state()
        if status:
            battery_info = {
                'level': status.get('percentage', 100),  # percentage
                'charging': status.get('isCharging', False),
                'temperature': status.get('temperature', 25.0)  # celsius
            }
        else:
            battery_info = {
                'level': 100,  # percentage
                'charging': False,
                'temperature': 25.0  # celsius
            }
        logger.info(f"Battery info: {battery_info}")
        return battery_info
    except ImportError:
        logger.warning("plyer not available for battery, using placeholder")
        battery_info = {
            'level': 100,  # percentage
            'charging': False,
            'temperature': 25.0  # celsius
        }
        return battery_info
    except Exception as e:
        logger.error(f"Battery info error: {e}")
        return {}

def get_location_fallback():
    """
    Fallback location method for Windows/Android when GPS is unavailable
    Returns: (latitude, longitude) or (None, None) if unavailable
    """
    try:
        system = platform.system()

        if system == "Windows":
            # For Windows, try to get location from IP-based geolocation
            try:
                import requests
                response = requests.get('http://ip-api.com/json/', timeout=5)
                if response.status_code == 200:
                    data = response.json()
                    if data.get('status') == 'success':
                        lat = data.get('lat')
                        lon = data.get('lon')
                        if lat and lon:
                            logger.info(f"IP-based location (Windows): {lat}, {lon}")
                            return lat, lon
            except Exception as e:
                logger.warning(f"IP-based location failed: {e}")

        elif system == "Linux":
            # For Linux/Android, try IP-based geolocation
            try:
                import requests
                response = requests.get('http://ip-api.com/json/', timeout=5)
                if response.status_code == 200:
                    data = response.json()
                    if data.get('status') == 'success':
                        lat = data.get('lat')
                        lon = data.get('lon')
                        if lat and lon:
                            logger.info(f"IP-based location (Linux/Android): {lat}, {lon}")
                            return lat, lon
            except Exception as e:
                logger.warning(f"IP-based location failed: {e}")

        # Ultimate fallback: return a default location (e.g., São Paulo coordinates)
        logger.warning("Using default fallback location")
        return -23.5505, -46.6333  # São Paulo, Brazil

    except Exception as e:
        logger.error(f"Fallback location error: {e}")
        return None, None

def get_storage_info():
    """
    Get storage information
    Returns: dict with storage details
    """
    try:
        import psutil

        storage = psutil.disk_usage('/')
        storage_info = {
            'total': storage.total,
            'used': storage.used,
            'free': storage.free,
            'percent': storage.percent
        }
        logger.info(f"Storage info: {storage_info}")
        return storage_info
    except Exception as e:
        logger.error(f"Storage info error: {e}")
        return {}
