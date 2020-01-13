import 'package:jarvis/models/model.dart';

class SmsSendResultModel extends Model{
  SmsSendResultModel({
    this.parentId, 
    this.body
    }):super(dbUrl: databaseUrl, collectionName: sentMessagesResultCollection){
    super.document = asMap();
  }

  final String parentId;
  final dynamic body;

  Map<String, dynamic> asMap()=>{
    'parentId': parentId,
    'body': body,
  };

  SmsSendResultModel fromMap(Map<String, dynamic> object)=> SmsSendResultModel(
    parentId: object[''].toString(),
    body: object['body']
  );

  
}