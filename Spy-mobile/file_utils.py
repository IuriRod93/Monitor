from kivy.utils import platform
if platform == 'android':
    from jnius import autoclass
    import os
    def list_files():
        # Exemplo: listar arquivos da pasta Downloads
        Environment = autoclass('android.os.Environment')
        downloads = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS).getAbsolutePath()
        return os.listdir(downloads)
else:
    def list_files():
        return []
