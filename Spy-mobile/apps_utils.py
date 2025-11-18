"""
Apps utilities for collecting installed applications
"""
import logging
import platform
import subprocess

logger = logging.getLogger(__name__)

def get_installed_apps():
    """
    Get list of installed applications using plyer with Android-specific fallbacks
    Returns: list of dicts with app info
    """
    try:
        from plyer import apps
        installed_apps = apps.get_apps()

        apps_list = []
        for app in installed_apps[:50]:  # Limit to 50 apps
            apps_list.append({
                'nome': app.get('name', 'Unknown'),
                'pacote': app.get('package', 'Unknown'),
                'versao': app.get('version', 'Unknown')
            })

        logger.info(f"Collected {len(apps_list)} installed apps via plyer")
        return apps_list

    except ImportError:
        logger.warning("plyer not available for apps, trying Android-specific")
        return get_installed_apps_android()
    except Exception as e:
        logger.error(f"Plyer apps collection error: {e}")
        return get_installed_apps_android()

def get_installed_apps_android():
    """
    Get installed apps using Android-specific APIs
    Returns: list of dicts with app info
    """
    try:
        from jnius import autoclass
        from android.permissions import request_permissions, Permission

        # Request permissions
        request_permissions([Permission.QUERY_ALL_PACKAGES])

        # Get PackageManager
        PythonActivity = autoclass('org.kivy.android.PythonActivity')
        package_manager = PythonActivity.mActivity.getPackageManager()

        # Get installed packages
        packages = package_manager.getInstalledPackages(0)

        apps_list = []
        for i in range(min(packages.size(), 50)):  # Limit to 50 apps
            package_info = packages.get(i)
            if package_info:
                try:
                    app_info = package_info.applicationInfo
                    if app_info:
                        name = package_manager.getApplicationLabel(app_info).toString()
                        package_name = package_info.packageName
                        version = package_info.versionName or "Unknown"

                        apps_list.append({
                            'nome': str(name),
                            'pacote': str(package_name),
                            'versao': str(version)
                        })
                except Exception as e:
                    logger.warning(f"Error processing app {i}: {e}")

        logger.info(f"Collected {len(apps_list)} installed apps via Android API")
        return apps_list

    except ImportError:
        logger.warning("jnius not available, using system fallback")
        return get_installed_apps_system()
    except Exception as e:
        logger.error(f"Android apps collection error: {e}")
        return get_installed_apps_system()

def get_installed_apps_system():
    """
    System-level fallback for getting installed apps
    Returns: list of dicts with app info
    """
    try:
        system = platform.system()
        apps_list = []

        if system == "Windows":
            # Windows fallback
            try:
                import winreg
                key = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,
                                   r"SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall")
                i = 0
                while i < 50:  # Limit to 50
                    try:
                        subkey = winreg.EnumKey(key, i)
                        app_key = winreg.OpenKey(key, subkey)
                        try:
                            name = winreg.QueryValueEx(app_key, "DisplayName")[0]
                            version = winreg.QueryValueEx(app_key, "DisplayVersion")[0] if "DisplayVersion" in str(app_key) else "Unknown"
                            apps_list.append({
                                'nome': name,
                                'pacote': subkey,
                                'versao': version
                            })
                        except:
                            pass
                        finally:
                            winreg.CloseKey(app_key)
                        i += 1
                    except OSError:
                        break
                winreg.CloseKey(key)
            except Exception as e:
                logger.error(f"Windows apps fallback failed: {e}")

        elif system == "Linux":
            # Linux fallback
            try:
                result = subprocess.run(['dpkg', '--list'], capture_output=True, text=True, timeout=10)
                count = 0
                for line in result.stdout.split('\n'):
                    if line.startswith('ii') and count < 50:
                        parts = line.split()
                        if len(parts) >= 3:
                            apps_list.append({
                                'nome': parts[1],
                                'pacote': parts[1],
                                'versao': parts[2]
                            })
                            count += 1
            except Exception as e:
                logger.error(f"Linux apps fallback failed: {e}")

        logger.info(f"System fallback collected {len(apps_list)} apps")
        return apps_list

    except Exception as e:
        logger.error(f"Apps collection system error: {e}")
        return []
