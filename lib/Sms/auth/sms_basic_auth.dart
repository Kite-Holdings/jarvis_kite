import 'package:jarvis/Applicatons/models/applications_model.dart';
import 'package:jarvis/jarvis.dart';

class SmsApplicationBasicAuth extends AuthValidator {
  final ApplicationsModel applicationsModel = ApplicationsModel();
  @override
  FutureOr<Authorization> validate<T>(AuthorizationParser<T> parser, T authorizationData, {List<AuthScope> requiredScope}) async {
    final List<String> _aouthDetails = authorizationData.toString().split(":");
    final Map<String, dynamic> _dbRes = await applicationsModel.findOneBy(
      where.eq('consumerKey', _aouthDetails[0]).and(
        where.eq('consumerSecret', _aouthDetails[1])
      )
    );
    if(_dbRes['status'] != 0){
      return null;
    } else {
      if(_dbRes['body'] == null){
        return null;
      } else {
        return Authorization(_dbRes['body']['_id'].toJson().toString(), 0, this);
      }
    }
  }
}