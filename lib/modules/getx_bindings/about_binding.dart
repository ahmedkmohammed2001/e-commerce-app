import 'package:get/get.dart';
import 'package:new_test_99/modules/about_us/about_controller.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AboutController());
  }
}