import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:new_test_99/components/custem_textfiled.dart';
import 'package:new_test_99/components/custom_button.dart';
import 'package:new_test_99/constant.dart';
import 'package:new_test_99/modules/register/register_controller.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  RegisterController controller = Get.find();
  @override
  void OnClickRegister() async {
    EasyLoading.show(status: 'loading');
    await controller.RegisterOnClick();
    if (controller.signupstatus) {
      EasyLoading.showSuccess(controller.msg);
      Get.offNamed('/login');
    } else {
      EasyLoading.showError(controller.msg);
      print('Eror here');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: gradiantBackground,
          child: ListView(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(58.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Sign up'.tr,
                        style: TextStyle(
                            fontSize: 40,
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: secondBackColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                    )),
                width: MediaQuery.of(context).size.width,
                height: 280,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  CustemText(
                    hieght: 58,
                    width: MediaQuery.of(context).size.width * 0.95,
                    hintText: 'Phone'.tr,
                    keyboard: TextInputType.phone,
                    onchanged: (Value) {
                      controller.phone = Value;
                    },
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  CustemText(
                    hieght: 58,
                    width: MediaQuery.of(context).size.width * 0.95,
                    hintText: 'First Name'.tr,
                    keyboard: TextInputType.name,
                    onchanged: (Value) {
                      controller.firstname = Value;
                    },
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  CustemText(
                    hieght: 58,
                    width: MediaQuery.of(context).size.width * 0.95,
                    hintText: 'Last Name'.tr,
                    keyboard: TextInputType.name,
                    onchanged: (Value) {
                      controller.lastname = Value;
                    },
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  CustemText(
                    hieght: 58,
                    width: MediaQuery.of(context).size.width * 0.95,
                    hintText: 'Password'.tr,
                    keyboard: TextInputType.visiblePassword,
                    onchanged: (Value) {
                      controller.password = Value;
                    },
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.95,
                    hieght: 48,
                    ontap: () {
                      OnClickRegister();
                    },
                    ButtonName: 'Sign up'.tr,
                    ButtonColor: yalow,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ?'.tr,
                        style: TextStyle(color: white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('object');
                        },
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed('/login');
                          },
                          child: Text(
                            'Sign in'.tr,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: white),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
