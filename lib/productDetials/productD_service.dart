import 'package:new_test_99/config/server_config.dart';
import 'package:new_test_99/config/user_information.dart';

import 'package:http/http.dart' as http;
import 'package:new_test_99/models/product_Details.dart';

class ProductDService {
  Future<List<Result>> getProductViews(id) async {
    

    var url = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.getProductbyid + '${id}');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${UserInformation.User_token}',
      'Accept': 'application/json'
    });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200 && response.body != null) {
      var Product = productshowFromJson(response.body);
      print(url);
      print("Product");
      print('${Product.result[0].views}');

      return Product.result;
    } else {
      return [];
    }
  }
}
