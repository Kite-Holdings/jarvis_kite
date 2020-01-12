import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jarvis/Sms/configs/infobip_configs.dart';

class SmsSendModule{
  SmsSendModule({this.phoneNo, this.message});
  final String phoneNo;
  final String message;

  Future<bool> send() async{
    const String username = infobipUsername;
    const String password = infobipPassword;
    final _base64E = base64Encode(utf8.encode('$username:$password'));
    final String basicAuth = 'Basic $_base64E';

    const String _url = infobipSmsUrl ;
    final Map<String, String> _body = {
      "text": message,
      "from": infobipPhoneNo,
      "to": phoneNo,
    };
    final http.Response _res = await http.post(_url, body: _body, headers: <String, String>{'authorization': basicAuth});
    final bool _success = _res.statusCode == 200;
    return _success;
  }
  
}