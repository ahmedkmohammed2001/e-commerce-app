import 'package:get/get.dart';
import 'package:new_test_99/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:new_test_99/config/user_information.dart';
import 'package:new_test_99/models/search_model.dart';
//import 'package:test99/models/product_Details.dart';
import 'package:new_test_99/models/search_model.dart';

class SearshService {
  Future<List<Result>> getfind(var name) async {
    var url =
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.search + name);
    print(url);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${UserInformation.User_token}',
      'Accept': 'application/json'
    });
    print(response.statusCode);
    print(response.body);
    print(url);
    if (response.statusCode == 200 && response.body != null) {
      var search = searchFromJson(response.body);
      return search.result;
    } else {
      return [];
    }
  }
}
