import 'package:get/get.dart';
import 'package:new_test_99/modules/homepage/home_controller.dart';
import 'package:new_test_99/product/Product_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeComtroller());
  }
}
