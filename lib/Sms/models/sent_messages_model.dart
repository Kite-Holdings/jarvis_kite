import 'package:jarvis/models/model.dart';

class SentMessagesModel extends Model{

  SentMessagesModel({
    this.dateSent, 
    this.phoneNo, 
    this.message, 
    this.appName,
    this.appId,
    }):super(dbUrl: databaseUrl, collectionName: sentMessagesCollection){
    super.document = asMap();
  }

  final String dateSent;
  final String phoneNo;
  final String message;
  final String appName;
  final String appId;
  ObjectId id = ObjectId();

  Map<String, dynamic> asMap()=>{
    '_id': id,
    'dateSent': dateSent,
    'phoneNo': phoneNo,
    'message': message,
    'appName': appName,
    'appId': appId,
  };

  SentMessagesModel fromMap(Map<String, String> object)=> SentMessagesModel(
    dateSent: object['dateSent'],
    phoneNo: object['phoneNo'],
    message: object['message'],
    appName: object['appName'],
    appId: object['appId'],
  );

  
}