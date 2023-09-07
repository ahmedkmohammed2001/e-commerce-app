import 'package:get/get.dart';
import 'package:new_test_99/models/user.dart';
import 'package:new_test_99/modules/login/login_sevice.dart';
import 'package:new_test_99/native_service.dart/secure_storage.dart';

class LoginController extends GetxController {
  var phone;
  var password;
  var signinstatus;
  var msg;
  var checkBoxStatus;
  late LoginService service;
  @override
  void onInit() {
    phone = "";

    password = "";
    signinstatus = false;
    msg;
    checkBoxStatus = false.obs;
    service = LoginService();
    super.onInit();
  }

  void changeCheckBox() async {
    checkBoxStatus(!(checkBoxStatus.value));
    print(checkBoxStatus);
    SecureStorage storage = new SecureStorage();
    String? test = await storage.read('token');
    print('tesr');
    print(test);
  }

  Future<void> LoginOnClick() async {
    User user = User(
      phone: phone,
      password: password,
    );
    signinstatus = await service.login(user, checkBoxStatus.value);
    msg = service.msg;
    if (msg is List) {
      String temp = "";
      for (String s in msg) {
        temp += s + '\n';
      }
      msg = temp;
    }
  }
}
