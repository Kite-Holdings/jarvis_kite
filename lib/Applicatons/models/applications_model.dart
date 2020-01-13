import 'package:jarvis/models/model.dart';
import 'package:jarvis/utils/random_alphernumeric.dart';
export 'package:jarvis/models/model.dart' show where;

class ApplicationsModel extends Model{
  ApplicationsModel({this.name}):super(dbUrl: databaseUrl, collectionName: applicationsCollection){
    consumerKey = randomString(12);
    consumerSecret = randomString(18);

    super.document = asMap();
  }

  final String name;

  String consumerKey;
  String consumerSecret;

  Map<String, String> asMap()=>{
    'name': name,
    'consumerKey': consumerKey,
    'consumerSecret': consumerSecret
  };
   ApplicationsModel fromMap(Map<String, String> object)=> ApplicationsModel(
     name: object['name'],
   );

}