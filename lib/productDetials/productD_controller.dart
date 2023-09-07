import 'package:get/get.dart';
import 'package:new_test_99/models/product_Details.dart';
//import 'package:test71/models/product_model.dart';
//import 'package:test71/models/categories_model.dart';
import 'package:new_test_99/productDetials/productD_service.dart';

class ProductDController extends GetxController {
  Rx<List<Result>> ProductList = Rx<List<Result>>([]);
  var id = Get.arguments;
  var isloading = true.obs;
  ProductDService service = new ProductDService();
  // List<Map<String, dynamic>> Productlist = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    print(Get.arguments);
    print('controleer');
    print(id.toString());

    ProductList.value = await service.getProductViews(id);
    isloading(!isloading.value);
    print(ProductList.value[0].expire);

    super.onReady();
  }
}
