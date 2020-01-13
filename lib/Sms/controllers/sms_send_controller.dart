import 'package:jarvis/Applicatons/models/applications_model.dart';
import 'package:jarvis/Sms/models/sent_messages_model.dart';
import 'package:jarvis/Sms/models/sms_sent_result_model.dart';
import 'package:jarvis/Sms/modules/sms_send_module.dart';
import 'package:jarvis/Sms/serializers/sms_send_serializer.dart';
import 'package:jarvis/jarvis.dart';

class SmsSendController extends ResourceController{
  final ApplicationsModel _applicationsModel = ApplicationsModel();
  @Operation.post()
  Future<Response> send(@Bind.body(require:['phoneNo', 'message'] ) SmsSendSerializer smsSendSerializer)async{
    final SmsSendModule smsSendModule = SmsSendModule(
      phoneNo: smsSendSerializer.phoneNo,
      message: smsSendSerializer.message,
    );
    final Map<String, dynamic> _resMap = await smsSendModule.send();
    final bool _success = _resMap['success'] == true;

    // get application
    final Map<String, dynamic> _appDbRes = await _applicationsModel.findById(request.authorization.clientID); 
    String appName;
    String appId;
    if(_appDbRes['status'] == 0){
      if(_appDbRes['body'] != null){
        appName = _appDbRes['body']['name'].toString();
        appId = _appDbRes['body']['_id'].toJson().toString();
      }
    }  

    // save message
    final SentMessagesModel sentMessagesModel = SentMessagesModel(
      appName: appName,
      appId: appId,
      dateSent: DateTime.now().toString(),
      phoneNo: smsSendSerializer.phoneNo,
      message: smsSendSerializer.message
    );
    await sentMessagesModel.save();

    // save infobib Response
    final SmsSendResultModel smsSendResultModel = SmsSendResultModel(
      parentId: sentMessagesModel.id.toJson(),
      body: _resMap
    );
    await smsSendResultModel.save();


    if(_success){
      return Response.ok(null);
    } else{
      return Response.serverError();
    }

  }

}