import 'package:get/get.dart';
import 'package:new_test_99/modules/splash/splash_Controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
