"""
Network utilities for IP and WiFi status
"""
import logging
import socket
import subprocess
import platform
import requests

logger = logging.getLogger(__name__)

def get_ip():
    """
    Get current IP address with multiple fallback methods
    Returns: IP address string or None if unavailable
    """
    # Method 1: Socket connection
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
        s.close()
        if ip and ip != '127.0.0.1':
            logger.info(f"IP obtained via socket: {ip}")
            return ip
    except Exception as e:
        logger.warning(f"Socket IP detection failed: {e}")

    # Method 2: Android-specific
    try:
        from jnius import autoclass
        PythonActivity = autoclass('org.kivy.android.PythonActivity')
        wifi_manager = PythonActivity.mActivity.getSystemService(PythonActivity.mActivity.WIFI_SERVICE)

        if wifi_manager:
            wifi_info = wifi_manager.getConnectionInfo()
            if wifi_info:
                ip_int = wifi_info.getIpAddress()
                if ip_int != 0:
                    ip = socket.inet_ntoa(bytearray((ip_int & 0xff, (ip_int >> 8) & 0xff, (ip_int >> 16) & 0xff, (ip_int >> 24) & 0xff)))
                    logger.info(f"IP obtained via Android WiFi: {ip}")
                    return ip
    except:
        pass

    # Method 3: Get all network interfaces
    try:
        import netifaces
        for interface in netifaces.interfaces():
            addrs = netifaces.ifaddresses(interface)
            if netifaces.AF_INET in addrs:
                for addr in addrs[netifaces.AF_INET]:
                    ip = addr['addr']
                    if ip and not ip.startswith('127.') and not ip.startswith('169.254.'):
                        logger.info(f"IP obtained via netifaces: {ip}")
                        return ip
    except ImportError:
        logger.warning("netifaces not available")
    except Exception as e:
        logger.error(f"netifaces IP detection error: {e}")

    # Method 4: System commands
    try:
        system = platform.system()
        if system == "Windows":
            result = subprocess.run(['ipconfig'], capture_output=True, text=True, timeout=5)
            for line in result.stdout.split('\n'):
                if 'IPv4 Address' in line:
                    ip = line.split(':')[1].strip()
                    if ip and not ip.startswith('127.') and not ip.startswith('169.254.'):
                        logger.info(f"IP obtained via ipconfig: {ip}")
                        return ip
        elif system in ["Linux", "Darwin"]:
            result = subprocess.run(['hostname', '-I'], capture_output=True, text=True, timeout=5)
            ips = result.stdout.strip().split()
            for ip in ips:
                if ip and not ip.startswith('127.') and not ip.startswith('169.254.'):
                    logger.info(f"IP obtained via hostname: {ip}")
                    return ip
    except Exception as e:
        logger.error(f"System command IP detection error: {e}")

    logger.error("All IP detection methods failed")
    return None

def get_wifi_status():
    """
    Get WiFi connection status using plyer
    Returns: "connected", "disconnected", or "unknown"
    """
    try:
        from plyer import wifi
        status = wifi.get_wifi_info()
        if status and status.get('is_connected', False):
            return "connected"
        else:
            return "disconnected"
    except ImportError:
        logger.warning("plyer not available for WiFi status, using basic check")
        # Fallback to basic check
        ip = get_ip()
        if ip:
            return "connected"
        else:
            return "disconnected"
    except Exception as e:
        logger.error(f"WiFi status error: {e}")
        return "unknown"

def get_wifi_ssid():
    """
    Get current WiFi SSID
    Returns: SSID string or None
    """
    try:
        system = platform.system()
        if system == "Windows":
            result = subprocess.run(['netsh', 'wlan', 'show', 'interfaces'],
                                  capture_output=True, text=True, timeout=5)
            for line in result.stdout.split('\n'):
                if 'SSID' in line and 'BSSID' not in line:
                    ssid = line.split(':')[1].strip()
                    logger.info(f"WiFi SSID: {ssid}")
                    return ssid
        elif system == "Linux":
            result = subprocess.run(['iwgetid', '-r'], capture_output=True, text=True, timeout=5)
            if result.returncode == 0:
                ssid = result.stdout.strip()
                logger.info(f"WiFi SSID: {ssid}")
                return ssid
        elif system == "Darwin":  # macOS
            result = subprocess.run(['/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport', '-I'],
                                  capture_output=True, text=True, timeout=5)
            for line in result.stdout.split('\n'):
                if 'SSID:' in line:
                    ssid = line.split(':')[1].strip()
                    logger.info(f"WiFi SSID: {ssid}")
                    return ssid
    except Exception as e:
        logger.error(f"WiFi SSID error: {e}")
    return None

def get_network_speed():
    """
    Get network speed information
    Returns: dict with speed details
    """
    try:
        # Placeholder for network speed test
        speed_info = {
            'download': 50.0,  # Mbps
            'upload': 10.0,    # Mbps
            'ping': 20.0       # ms
        }
        logger.info(f"Network speed: {speed_info}")
        return speed_info
    except Exception as e:
        logger.error(f"Network speed error: {e}")
        return {}

def get_public_ip():
    """
    Get public IP address
    Returns: public IP string or None
    """
    try:
        import requests
        response = requests.get('https://api.ipify.org', timeout=5)
        if response.status_code == 200:
            public_ip = response.text.strip()
            logger.info(f"Public IP: {public_ip}")
            return public_ip
    except Exception as e:
        logger.error(f"Public IP error: {e}")
    return None
