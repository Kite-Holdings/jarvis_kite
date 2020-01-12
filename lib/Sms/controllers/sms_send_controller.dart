import 'package:jarvis/Sms/modules/sms_send_module.dart';
import 'package:jarvis/Sms/serializers/sms_send_serializer.dart';
import 'package:jarvis/jarvis.dart';

class SmsSendController extends ResourceController{
  @Operation.post()
  Future<Response> send(@Bind.body(require:['phoneNo', 'message'] ) SmsSendSerializer smsSendSerializer)async{
    final SmsSendModule smsSendModule = SmsSendModule(
      phoneNo: smsSendSerializer.phoneNo,
      message: smsSendSerializer.message,
    );
    final bool _success = await smsSendModule.send();
    if(_success){
      return Response.ok({});
    } else{
      return Response.serverError();
    }



  }

}