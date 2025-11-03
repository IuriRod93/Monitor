from jnius import autoclass

def get_installed_apps():
    try:
        PythonActivity = autoclass('org.kivy.android.PythonActivity')
        activity = PythonActivity.mActivity
        pm = activity.getPackageManager()
        packages = pm.getInstalledApplications(0)
        app_list = []
        for package in packages:
            app_name = pm.getApplicationLabel(package)
            package_name = package.packageName
            app_list.append(f'{app_name} ({package_name})')
        return app_list
    except Exception as e:
        return [f'Erro: {e}']
