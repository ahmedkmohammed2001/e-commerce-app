import 'package:get/get.dart';
import 'package:new_test_99/modules/register/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
