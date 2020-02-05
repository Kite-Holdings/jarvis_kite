import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jarvis/Sms/configs/infobip_configs.dart';
import 'package:jarvis/Sms/configs/uwazii_configs.dart';

class SmsSendModule{
  SmsSendModule({this.phoneNo, this.message});
  final String phoneNo;
  final String message;

  Future<Map<String, dynamic>> send() async{
    // const String username = infobipUsername;  infobib
    // const String password = infobipPassword;
    const String username = uwaziiUsername;
    const String password = uwaziiPassword;
    final _base64E = base64Encode(utf8.encode('$username:$password'));
    final String basicAuth = 'Basic $_base64E';

    const String _url = uwaziiUrl ;
    // const String _url = infobipSmsUrl ; infobib
    final Map<String, String> _body = {
      "text": message,
      "from": infobipPhoneNo,
      "to": phoneNo,
    };
    try{
      final http.Response _res = await http.post(_url, body: _body, headers: <String, String>{'authorization': basicAuth});
      final bool _success = _res.statusCode == 200;
      return {
        'success': _success,
        'body': _res.body,
        'statusCode': _res.statusCode
      };
    } catch (e){
      return {
        'success': false,
        'body': 'Cannot reach endpoint'
      };
    }
  }
  
}