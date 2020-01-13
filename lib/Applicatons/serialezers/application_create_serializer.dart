import 'package:jarvis/jarvis.dart';

class ApplicationCreateSerializer extends Serializable{
  String name;
  @override
  Map<String, String> asMap()=>{'name': name};

  @override
  void readFromMap(Map<String, dynamic> object) {
    name = object['name'].toString();
  }

}