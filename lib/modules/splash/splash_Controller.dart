import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_test_99/config/user_information.dart';
import 'package:new_test_99/native_service.dart/secure_storage.dart';

class SplashController extends GetxController {
  @override
  late SecureStorage storage;
  void onInit() async {
    // TODO: implement onInit
    storage = new SecureStorage();
    await checkToken();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> checkToken() async {
    String? token = await storage.read('token');
    print(token);
    print(UserInformation.User_token);
    if (token == null) {
      Get.offAllNamed('/landing');
    } else {
      UserInformation.User_token = token;
      Get.toNamed('/homepage');
    }
  }
}
