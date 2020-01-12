import 'package:jarvis/jarvis.dart';

class SmsSendSerializer extends Serializable{
  String phoneNo;
  String message;
  @override
  Map<String, dynamic> asMap() {
    return {
      'phoneNo': phoneNo,
      'message': message,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    message = object['message'].toString();
    phoneNo = object['phoneNo'].toString();
  }

  @override
  void read(Map<String, dynamic> object, {Iterable<String> ignore, Iterable<String> reject, Iterable<String> require}) {
    final String _phoneNo = object['phoneNo'].toString();
    final RegExp _allAreNumbers = RegExp(r'(^[0-9]{12}$)');
    final RegExp _startsWith = RegExp(r'(^2547)');
    Iterable<String> _reject;
    if(_allAreNumbers.hasMatch(_phoneNo) && _startsWith.hasMatch(_phoneNo)){
      _reject = reject;
    } else{
      _reject = ['phoneNo'];
    }
    super.read(object, ignore: ignore, reject: _reject, require: require);
  }

}