import 'package:get/instance_manager.dart';
import 'package:new_test_99/modules/landing/Landing_Controller.dart';

class LandingBinding implements Bindings {
  @override
  void dependencies() { Get.put(LandingController());
  }
}

