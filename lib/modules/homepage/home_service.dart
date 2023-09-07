import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:new_test_99/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:new_test_99/config/user_information.dart';
import 'package:new_test_99/models/categories_model.dart';
import 'package:new_test_99/native_service.dart/secure_storage.dart';

class HomeService {
  List? data;
  var msg;

  var url =
      Uri.parse(ServerConfig.domainNameServer + ServerConfig.getCategories);
  var urll = Uri.parse(ServerConfig.domainNameServer + ServerConfig.logout);
  Future<List<Result>> getCategories() async {
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${UserInformation.User_token}',
      'Accept': 'application/json'
    });
    print(response.statusCode);
    print('${UserInformation.User_token} ');
    print(response.body);
    if (response.statusCode == 200) {
      // response = await http.get(url);
      var categories = categoriesFromJson(response.body);
      print(categories);
      return categories.result;
    } else {
      return [];
    }
  }

  Future<bool> logout() async {
    var response2 = await http.post(urll, headers: {
      'Authorization': 'Bearer ${UserInformation.User_token}',
      'Accept': 'application/json'
    });
    print(response2.statusCode);
    print(response2.body);
    var jesonresponse = jsonDecode(response2.body);
    if (jesonresponse['isOk'] == true) {
      msg = jesonresponse['message']['content'];
      return true;
    } else {
          msg = jesonresponse['message']['content'];
      return false;
    }
  }
}
