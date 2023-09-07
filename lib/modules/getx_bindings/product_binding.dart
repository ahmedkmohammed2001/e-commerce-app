import 'package:get/get.dart';
//import 'package:test71/modules/product/Product_controller.dart';
import 'package:new_test_99/product/Product_controller.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
