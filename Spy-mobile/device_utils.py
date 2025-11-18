"""
Device utilities for getting device information and unique identifiers
"""
import logging
import platform
import uuid
import hashlib
import os

logger = logging.getLogger(__name__)

def get_device_id():
    """
    Get a unique device identifier with improved Android support
    Returns: string identifier or None
    """
    try:
        # Try Android-specific methods first with multiple fallbacks
        try:
            from jnius import autoclass

            # Method 1: Settings.Secure.ANDROID_ID (most reliable)
            try:
                PythonActivity = autoclass('org.kivy.android.PythonActivity')
                context = PythonActivity.mActivity
                SettingsSecure = autoclass('android.provider.Settings$Secure')
                android_id = SettingsSecure.getString(context.getContentResolver(), SettingsSecure.ANDROID_ID)
                if android_id and android_id != 'null' and len(android_id) > 10:
                    # Create IMEI-like format: 35 + 15 digits
                    imei_base = hashlib.sha256(android_id.encode()).hexdigest()[:15]
                    imei_like = f"35{imei_base}"
                    logger.info(f"Android ANDROID_ID IMEI-like obtained: {imei_like}")
                    return imei_like
            except Exception as e:
                logger.warning(f"ANDROID_ID method failed: {e}")

            # Method 2: Build.SERIAL
            try:
                Build = autoclass('android.os.Build')
                serial = Build.SERIAL
                if serial and serial != 'unknown' and serial != 'null':
                    # Create IMEI-like format: 35 + 15 digits
                    imei_base = hashlib.sha256(serial.encode()).hexdigest()[:15]
                    imei_like = f"35{imei_base}"
                    logger.info(f"Android SERIAL IMEI-like obtained: {imei_like}")
                    return imei_like
            except Exception as e:
                logger.warning(f"SERIAL method failed: {e}")

            # Method 3: TelephonyManager IMEI (requires permission)
            try:
                from android.permissions import request_permissions, Permission
                request_permissions([Permission.READ_PHONE_STATE])

                TelephonyManager = autoclass('android.telephony.TelephonyManager')
                telephony = context.getSystemService(context.TELEPHONY_SERVICE)
                imei = telephony.getDeviceId()
                if imei and len(imei) > 10:
                    # Create IMEI-like format: 35 + 15 digits
                    imei_base = hashlib.sha256(imei.encode()).hexdigest()[:15]
                    imei_like = f"35{imei_base}"
                    logger.info(f"Android IMEI obtained: {imei_like}")
                    return imei_like
            except Exception as e:
                logger.warning(f"IMEI method failed: {e}")

            # Method 4: Build.FINGERPRINT hash
            try:
                Build = autoclass('android.os.Build')
                fingerprint = Build.FINGERPRINT
                if fingerprint:
                    # Create IMEI-like format: 35 + 15 digits
                    imei_base = hashlib.sha256(fingerprint.encode()).hexdigest()[:15]
                    imei_like = f"35{imei_base}"
                    logger.info(f"Android FINGERPRINT IMEI-like obtained: {imei_like}")
                    return imei_like
            except Exception as e:
                logger.warning(f"FINGERPRINT method failed: {e}")

        except ImportError:
            logger.warning("jnius not available, trying plyer")

        # Try plyer uniqueid
        try:
            from plyer import uniqueid
            device_id = uniqueid.get_uid()
            if device_id:
                # Create IMEI-like format: 35 + 15 digits
                imei_base = hashlib.sha256(str(device_id).encode()).hexdigest()[:15]
                imei_like = f"35{imei_base}"
                logger.info(f"Plyer IMEI-like ID obtained: {imei_like}")
                return imei_like
        except Exception as e:
            logger.warning(f"Plyer uniqueid failed: {e}")

        # Fallback to system-based ID
        try:
            system = platform.system()
            if system == "Windows":
                # Windows machine GUID - convert to IMEI-like format
                try:
                    import winreg
                    key = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,
                                       r"SOFTWARE\Microsoft\Cryptography")
                    machine_guid = winreg.QueryValueEx(key, "MachineGuid")[0]
                    # Create IMEI-like format: 35 + 15 digits
                    imei_base = hashlib.sha256(machine_guid.encode()).hexdigest()[:15]
                    imei_like = f"35{imei_base}"
                    winreg.CloseKey(key)
                    logger.info(f"Windows IMEI-like ID obtained: {imei_like}")
                    return imei_like
                except Exception as e:
                    logger.warning(f"Windows GUID failed: {e}")
            elif system == "Linux":
                # Linux machine ID - convert to IMEI-like format
                try:
                    with open('/etc/machine-id', 'r') as f:
                        machine_id = f.read().strip()
                        # Create IMEI-like format: 35 + 15 digits
                        imei_base = hashlib.sha256(machine_id.encode()).hexdigest()[:15]
                        imei_like = f"35{imei_base}"
                        logger.info(f"Linux IMEI-like ID obtained: {imei_like}")
                        return imei_like
                except Exception as e:
                    logger.warning(f"Linux machine-id failed: {e}")
            elif system == "Darwin":  # macOS
                # macOS hardware UUID - convert to IMEI-like format
                try:
                    import subprocess
                    result = subprocess.run(['system_profiler', 'SPHardwareDataType'],
                                          capture_output=True, text=True, timeout=5)
                    for line in result.stdout.split('\n'):
                        if 'Hardware UUID:' in line:
                            hw_uuid = line.split(':')[1].strip()
                            # Create IMEI-like format: 35 + 15 digits
                            imei_base = hashlib.sha256(hw_uuid.encode()).hexdigest()[:15]
                            imei_like = f"35{imei_base}"
                            logger.info(f"macOS IMEI-like ID obtained: {imei_like}")
                            return imei_like
                except Exception as e:
                    logger.warning(f"macOS hardware UUID failed: {e}")

        except Exception as e:
            logger.error(f"System-based ID error: {e}")

        # Final fallback: generate IMEI-like ID based on system info
        try:
            system_info = f"{platform.node()}-{platform.machine()}-{platform.processor()}-{os.getenv('USERNAME', '')}"
            persistent_id = str(uuid.uuid5(uuid.NAMESPACE_DNS, system_info))
            # Create IMEI-like format: 35 + 15 digits
            imei_base = hashlib.sha256(persistent_id.encode()).hexdigest()[:15]
            imei_like = f"35{imei_base}"
            logger.info(f"Generated IMEI-like device ID: {imei_like}")
            return imei_like
        except Exception as e:
            logger.error(f"IMEI-like ID generation error: {e}")

    except Exception as e:
        logger.error(f"Device ID error: {e}")

    # Ultimate fallback: always IMEI-like format
    fallback_id = f"35{str(uuid.uuid4().hex)[:15]}"
    logger.warning(f"Using IMEI-like fallback device ID: {fallback_id}")
    return fallback_id

def get_device_info():
    """
    Get comprehensive device information
    Returns: dict with device details
    """
    try:
        device_id = get_device_id()

        # Basic system info
        device_info = {
            'imei': device_id,
            'modelo': platform.machine() or 'Unknown',
            'sistema_operacional': f"{platform.system()} {platform.release()}",
            'nome': platform.node() or 'Unknown Device',
            'usuario': os.getenv('USER') or os.getenv('USERNAME') or 'Unknown',
            'departamento': 'Unknown'
        }

        # Try to get more detailed Android info
        try:
            from jnius import autoclass
            Build = autoclass('android.os.Build')
            device_info.update({
                'modelo': Build.MODEL or device_info['modelo'],
                'fabricante': Build.MANUFACTURER or 'Unknown',
                'versao_android': Build.VERSION.RELEASE or 'Unknown',
                'api_level': str(Build.VERSION.SDK_INT) if hasattr(Build.VERSION, 'SDK_INT') else 'Unknown'
            })
        except:
            pass

        logger.info(f"Device info collected: {device_info}")
        return device_info

    except Exception as e:
        logger.error(f"Device info collection error: {e}")
        return {
            'imei': get_device_id(),
            'modelo': 'Unknown',
            'sistema_operacional': 'Unknown',
            'nome': 'Unknown Device',
            'usuario': 'Unknown',
            'departamento': 'Unknown'
        }

def get_battery_info():
    """
    Get battery information
    Returns: dict with battery details
    """
    try:
        # Try Android battery info
        try:
            from jnius import autoclass
            Intent = autoclass('android.content.Intent')
            IntentFilter = autoclass('android.content.IntentFilter')
            PythonActivity = autoclass('org.kivy.android.PythonActivity')

            # Get battery status
            ifilter = IntentFilter(Intent.ACTION_BATTERY_CHANGED)
            battery_status = PythonActivity.mActivity.registerReceiver(None, ifilter)

            level = battery_status.getIntExtra('level', -1)
            scale = battery_status.getIntExtra('scale', -1)
            status = battery_status.getIntExtra('status', -1)

            battery_info = {
                'level': int((level / scale) * 100) if scale > 0 else 100,
                'charging': status == 2,  # BATTERY_STATUS_CHARGING
                'temperature': battery_status.getIntExtra('temperature', -1) / 10.0 if battery_status.getIntExtra('temperature', -1) != -1 else 25.0
            }

            logger.info(f"Android battery info: {battery_info}")
            return battery_info

        except ImportError:
            logger.warning("jnius not available for battery, trying plyer")

        # Try plyer battery
        try:
            from plyer import battery
            status = battery.get_state()
            if status:
                battery_info = {
                    'level': status.get('percentage', 100),
                    'charging': status.get('isCharging', False),
                    'temperature': status.get('temperature', 25.0)
                }
                logger.info(f"Plyer battery info: {battery_info}")
                return battery_info
        except:
            pass

    except Exception as e:
        logger.error(f"Battery info error: {e}")

    # Fallback
    battery_info = {
        'level': 100,
        'charging': False,
        'temperature': 25.0
    }
    return battery_info

def get_storage_info():
    """
    Get storage information
    Returns: dict with storage details
    """
    try:
        # Try Android storage info
        try:
            from jnius import autoclass
            StatFs = autoclass('android.os.StatFs')
            Environment = autoclass('android.os.Environment')

            # Get external storage
            external_dir = Environment.getExternalStorageDirectory()
            if external_dir:
                stat = StatFs(external_dir.getPath())
                block_size = stat.getBlockSizeLong()
                total_blocks = stat.getBlockCountLong()
                available_blocks = stat.getAvailableBlocksLong()

                storage_info = {
                    'total': block_size * total_blocks,
                    'used': block_size * (total_blocks - available_blocks),
                    'free': block_size * available_blocks,
                    'percent': ((total_blocks - available_blocks) / total_blocks) * 100 if total_blocks > 0 else 0
                }

                logger.info(f"Android storage info: {storage_info}")
                return storage_info

        except ImportError:
            logger.warning("jnius not available for storage, using psutil")

        # Try psutil for desktop
        try:
            import psutil
            storage = psutil.disk_usage('/')
            storage_info = {
                'total': storage.total,
                'used': storage.used,
                'free': storage.free,
                'percent': storage.percent
            }
            logger.info(f"psutil storage info: {storage_info}")
            return storage_info
        except:
            pass

    except Exception as e:
        logger.error(f"Storage info error: {e}")

    # Fallback
    storage_info = {
        'total': 1000000000,  # 1GB
        'used': 500000000,    # 500MB
        'free': 500000000,    # 500MB
        'percent': 50.0
    }
    return storage_info
