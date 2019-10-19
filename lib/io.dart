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