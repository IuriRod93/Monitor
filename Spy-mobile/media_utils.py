from kivy.utils import platform
import os

if platform == 'android':
    from jnius import autoclass
    
    def get_media_files():
        """Coleta arquivos de mídia do dispositivo Android"""
        try:
            PythonActivity = autoclass('org.kivy.android.PythonActivity')
            activity = PythonActivity.mActivity
            ContentResolver = activity.getContentResolver()
            MediaStore = autoclass('android.provider.MediaStore$Images$Media')
            
            # Coletar imagens
            cursor = ContentResolver.query(
                MediaStore.EXTERNAL_CONTENT_URI,
                ['_data', '_display_name', 'date_modified'],
                None, None, 'date_modified DESC'
            )
            
            media_files = []
            if cursor:
                count = 0
                while cursor.moveToNext() and count < 10:  # Limitar a 10 arquivos
                    data_idx = cursor.getColumnIndex('_data')
                    name_idx = cursor.getColumnIndex('_display_name')
                    date_idx = cursor.getColumnIndex('date_modified')
                    
                    file_path = cursor.getString(data_idx)
                    file_name = cursor.getString(name_idx)
                    date_modified = cursor.getLong(date_idx)
                    
                    if file_path and os.path.exists(file_path):
                        media_files.append({
                            'path': file_path,
                            'name': file_name,
                            'date': date_modified,
                            'type': 'image'
                        })
                        count += 1
                cursor.close()
            
            return media_files
            
        except Exception as e:
            print(f"Erro ao coletar mídias: {e}")
            return []
else:
    def get_media_files():
        return []

def get_recent_photos(limit=5):
    """Obtém fotos recentes do dispositivo"""
    if platform == 'android':
        return get_media_files()[:limit]
    return []