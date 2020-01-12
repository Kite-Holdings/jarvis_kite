import 'package:jarvis/Sms/controllers/sms_send_controller.dart';
import 'package:jarvis/jarvis.dart';

Router smsRouter(Router router){
  const String baseUrl = '/sms';
  router
    .route('$baseUrl/send')
    .link(()=> SmsSendController());

  return router;
}