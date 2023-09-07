import 'package:get/get.dart';
import 'package:new_test_99/modules/login/login_Controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
