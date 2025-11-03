"""
Network utilities for IP and WiFi status
"""
import logging
import socket

logger = logging.getLogger(__name__)

def get_ip():
    """
    Get current IP address
    Returns: IP address string or None if unavailable
    """
    try:
        # Get local IP address
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
        s.close()
        logger.info(f"IP obtained: {ip}")
        return ip
    except Exception as e:
        logger.error(f"IP detection error: {e}")
        return None

def get_wifi_status():
    """
    Get WiFi connection status
    Returns: "connected", "disconnected", or "unknown"
    """
    try:
        # Basic WiFi status check
        # In production, this would use platform-specific APIs
        ip = get_ip()
        if ip:
            return "connected"
        else:
            return "disconnected"
    except Exception as e:
        logger.error(f"WiFi status error: {e}")
        return "unknown"
