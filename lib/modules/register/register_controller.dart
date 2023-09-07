import 'package:get/get.dart';
import 'package:new_test_99/models/user.dart';
import 'package:new_test_99/modules/register/register_service.dart';

class RegisterController extends GetxController {
  var firstname = '';
  var lastname = "";
  var password = "";
  var phone = "";
  var signupstatus = false;
  SignupService service = SignupService();
  var msg;
  Future<void> RegisterOnClick() async {
    User user = User(
        firstname: firstname,
        lastname: lastname,
        password: password,
        phone: phone);
    signupstatus = await service.register(user);
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
