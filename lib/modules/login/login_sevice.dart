import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_test_99/config/server_config.dart';
import 'package:new_test_99/config/user_information.dart';
import 'package:new_test_99/models/user.dart';
import 'package:new_test_99/native_service.dart/secure_storage.dart';

class LoginService {
  var msg;
  var token;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.login);
  Future<bool> login(User user, bool checkbox) async {
    var response = await http.post(url, body: {
      'phone': user.phone,
      'password': user.password,
    });
    print(response.statusCode);
    print(response.body);
    var jesonresponse = jsonDecode(response.body);
    if (jesonresponse['isOk'] == true &&
        jesonresponse['result']['token'] != null) {
      msg = jesonresponse['result']['resultText'];
      token = jesonresponse['result']['token'];
      UserInformation.User_token = token;
      print('token ${token}');
      if (checkbox) {
        SecureStorage storage = new SecureStorage();
        print(UserInformation.User_token);
        await storage.save('token', UserInformation.User_token);
      }
      print('test');
      print(UserInformation.User_token);
      return true;
    } else if (jesonresponse['isOk'] == false) {
      msg = jesonresponse['message']['content'];
      return false;
    } else {
      msg = jesonresponse['result']['resultText'];
      return false;
    }
  }
}
