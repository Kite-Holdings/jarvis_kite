import 'package:jarvis/Sms/auth/sms_basic_auth.dart';
import 'package:jarvis/Sms/controllers/sms_send_controller.dart';
import 'package:jarvis/jarvis.dart';

Router smsRouter(Router router){
  const String baseUrl = '/sms';
  router
    .route('$baseUrl/send')
    .link(()=> Authorizer.basic(SmsApplicationBasicAuth()))
    .link(()=> SmsSendController());

  return router;
}