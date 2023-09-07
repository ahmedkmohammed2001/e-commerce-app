import 'package:get/get.dart';
import 'package:new_test_99/models/search_model.dart';
//import 'package:test99/models/categories_model.dart';
//import 'package:test99/models/product_model.dart';
//import 'package:test99/models/categories_model.dart';
import 'package:new_test_99/modules/Search/searsh_service.dart';

class SearchController extends GetxController {
  String? name;
  var x;
  var SearshList ;
  SearshService service = new SearshService();
  // List<Map<String, dynamic>> Productlist = [];
  Rx<List<Result>> result = Rx<List<Result>>([]);

  @override
  void onInit() async {
    // TODO: implement onInit
    SearshList = await service.getfind(name);
    print('object');
    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    SearshList = await service.getfind(name);

    
    print('object');
    super.onReady();
  }

  void find(String query)async {
    result.value = await service.getfind(query);
  }
}
