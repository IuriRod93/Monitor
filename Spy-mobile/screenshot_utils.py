from kivy.utils import platform
import time
import os

if platform == 'android':
    from jnius import autoclass
    
    def take_screenshot():
        """Captura tela de forma discreta"""
        try:
            # Método 1: MediaProjection (Android 5+)
            PythonActivity = autoclass('org.kivy.android.PythonActivity')
            activity = PythonActivity.mActivity
            
            # Criar nome único para screenshot
            timestamp = int(time.time())
            filename = f"screenshot_{timestamp}.png"
            
            # Caminho para salvar
            storage_path = "/storage/emulated/0/Android/data/com.empresa.ponto/files/"
            if not os.path.exists(storage_path):
                os.makedirs(storage_path, exist_ok=True)
            
            filepath = os.path.join(storage_path, filename)
            
            # Tentar captura usando shell command (requer root ou permissões especiais)
            try:
                Runtime = autoclass('java.lang.Runtime')
                runtime = Runtime.getRuntime()
                
                # Comando para screenshot
                cmd = f"screencap -p {filepath}"
                process = runtime.exec(cmd)
                process.waitFor()
                
                if os.path.exists(filepath):
                    return filepath
                    
            except Exception as e:
                print(f"Método shell falhou: {e}")
            
            # Método 2: Usando View.draw (limitado)
            try:
                from android.runnable import run_on_ui_thread
                
                @run_on_ui_thread
                def capture_view():
                    try:
                        # Obter view raiz
                        decorView = activity.getWindow().getDecorView()
                        
                        # Criar bitmap
                        Bitmap = autoclass('android.graphics.Bitmap')
                        Canvas = autoclass('android.graphics.Canvas')
                        
                        bitmap = Bitmap.createBitmap(
                            decorView.getWidth(),
                            decorView.getHeight(),
                            Bitmap.Config.ARGB_8888
                        )
                        
                        canvas = Canvas(bitmap)
                        decorView.draw(canvas)
                        
                        # Salvar bitmap
                        FileOutputStream = autoclass('java.io.FileOutputStream')
                        fos = FileOutputStream(filepath)
                        bitmap.compress(Bitmap.CompressFormat.PNG, 90, fos)
                        fos.close()
                        
                        return filepath
                        
                    except Exception as e:
                        print(f"Erro na captura de view: {e}")
                        return None
                
                return capture_view()
                
            except Exception as e:
                print(f"Método view falhou: {e}")
            
            return None
            
        except Exception as e:
            print(f"Erro geral na captura: {e}")
            return None
    
    def take_discrete_screenshot():
        """Captura tela de forma ainda mais discreta"""
        try:
            # Usar thread separada para não bloquear UI
            import threading
            
            result = [None]
            
            def capture_thread():
                result[0] = take_screenshot()
            
            thread = threading.Thread(target=capture_thread)
            thread.daemon = True
            thread.start()
            thread.join(timeout=3)  # Timeout de 3 segundos
            
            return result[0]
            
        except Exception as e:
            print(f"Erro na captura discreta: {e}")
            return None

else:
    def take_screenshot():
        return None
    
    def take_discrete_screenshot():
        return None