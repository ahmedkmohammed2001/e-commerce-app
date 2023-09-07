import 'dart:convert';
import 'package:new_test_99/config/server_config.dart';
import 'package:new_test_99/config/user_information.dart';
import 'package:new_test_99/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Result>> getProduct(id) async {
    var url = Uri.parse(ServerConfig.domainNameServer +
        ServerConfig.getProduct +
        id.toString());
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${UserInformation.User_token}',
      'Accept': 'application/json'
    });
    print(response.statusCode);
    print(response.body);
    print(url);

    if (response.statusCode == 200) {
      var Product = productdetailsFromJson(response.body);
      print(Product);
      return Product.result;
    } else {
      return [];
    }
  }
  makeLike(bool isliked, int id) async {
    print(id);
    print(isliked);

    var url2 = Uri.parse(ServerConfig.domainNameServer + ServerConfig.makelike);
    print(url2);
    var respone = await http.post(url2, body: {
      'product_id': id.toString(),
      'isLike': isliked.toString(),
    }, headers: {
      'Authorization': 'Bearer ${UserInformation.User_token}',
      'Accept': 'application/json'
    });
    print('ttt');
    print(respone.statusCode);
    print(respone.body);
    var jsonresponse = jsonDecode(respone.body);
    print(jsonresponse);
  }
}
