import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Network {
  static void GET(String url, String token, Function callback) async {
    var response = http.get(url, headers: {
      'X-User-Token': token
    });
    response.then((response) {
      return response.body;
    }).then((json) {
      Map<String, dynamic> content = jsonDecode(json);
      callback(content);
    });
  }

  static void getJSON(String url, Function callback) async {
    var response = await http.get(url);
    var content = jsonDecode(response.body);
    callback(content);
  }

  static void pureGet(String url, Function callback) async {
    var response = await http.get(url);
    var content = jsonDecode(response.body);
    callback(content);
  }
}

class DataHandler {
  final Map<String, Function> JSON = {
    'parse': (raw) {
      return jsonDecode(raw);
    },
    'stringify': (raw) {
      return jsonEncode(raw);
    }
  };
}