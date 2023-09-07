import 'package:get/get.dart';
import 'package:new_test_99/models/product_model.dart';
//import 'package:test71/modules/product/product_service.dart';
import 'package:new_test_99/product/product_service.dart';

class ProductController extends GetxController {
  int? id = Get.arguments;
  RxBool isLoadingProducts = RxBool(true);
RxBool isliked = RxBool(false);
  ProductService service = new ProductService();
  Rx<List<Result>> ProductList = Rx<List<Result>>([]);


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    print(Get.arguments);
    print('here');
    print(id);
    ProductList.value = await service.getProduct(id);
    isLoadingProducts.value = false;
    super.onReady();
  }
  Future<bool> ontaplike(var ide) async {
    isliked.value = !isliked.value;
    service.makeLike(isliked.value, ide);
    return isliked.value;
  }
}
