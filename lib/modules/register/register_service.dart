import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_test_99/config/server_config.dart';
import 'package:new_test_99/models/user.dart';

class SignupService {
  var msg;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.register);
  Future<bool> register(User user) async {
    var response = await http.post(url, body: {
      'phone': user.phone,
      'firstname': user.firstname,
      'lastname': user.lastname,
      'password': user.password,
    });

    print(response.statusCode);
    print(response.body);
    var jesonresponse = jsonDecode(response.body);
    if (jesonresponse['isOk']==true) {
      msg = jesonresponse['result']['message'];
      return true;
    } else if (jesonresponse['isOk']==false) {
      msg = jesonresponse['message']['content'];
      return false;
    } else {
      return false;
    }
  }
}
