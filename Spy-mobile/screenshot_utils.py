"""
Screenshot utilities for capturing device screens
"""
import logging
import os
import time

logger = logging.getLogger(__name__)

def take_discrete_screenshot():
    """
    Take a discrete screenshot using plyer
    Returns: path to screenshot file or None
    """
    try:
        from plyer import screenshot
        import time

        # Take screenshot
        screenshot_path = screenshot.take_screenshot()
        if screenshot_path and os.path.exists(screenshot_path):
            logger.info(f"Screenshot taken: {screenshot_path}")
            return screenshot_path
        else:
            logger.warning("Screenshot not taken or file not found")
            return None

    except ImportError:
        logger.warning("plyer not available for screenshots, using PIL placeholder")
        try:
            from PIL import Image, ImageDraw
            img = Image.new('RGB', (800, 600), color='white')
            draw = ImageDraw.Draw(img)
            draw.text((10, 10), f"Screenshot - {time.time()}", fill='black')
            screenshot_path = f"screenshot_{int(time.time())}.png"
            img.save(screenshot_path)
            logger.info(f"Placeholder screenshot saved: {screenshot_path}")
            return screenshot_path
        except Exception as e:
            logger.error(f"Placeholder screenshot error: {e}")
            return None
    except Exception as e:
        logger.error(f"Screenshot error: {e}")
        return None

def take_automatic_screenshot():
    """
    Take automatic screenshot for monitoring
    Returns: path to screenshot file or None
    """
    return take_discrete_screenshot()
