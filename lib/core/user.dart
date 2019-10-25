import 'package:study_helper_next/_globalVars.dart';
import 'package:study_helper_next/core/io.dart' as YangIO;

GlobalVars _global = new GlobalVars();

class User{
  User(){}
  static bool Login(String username, String password, Function callback) {
    var url = '${_global.bmobServer}/UserLogin?username=$username&password=$password';
    YangIO.Network.getJSON(url, (data) {
      print(data['flag']);
      callback(data['flag']);
    });
  }
}