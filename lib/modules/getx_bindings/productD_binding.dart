import 'package:get/get.dart';
//import 'package:test71/modules/product_details/product_details_controller.dart';
import 'package:new_test_99/product/Product_controller.dart';
import 'package:new_test_99/productDetials/productD_controller.dart';
//import 'package:test71/productdetails/product_details_controller.dart';
//import 'package:test71/product/product_details_controller.dart';

class ProductDBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductDController);
  }
}
