import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:new_test_99/components/custem_textfiled.dart';
import 'package:new_test_99/components/custom_button.dart';
import 'package:new_test_99/components/custom_checkbox.dart';
import 'package:new_test_99/constant.dart';
import 'package:new_test_99/modules/login/login_Controller.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  LoginController controller = Get.find();
  @override
  void OnClickLogin() async {
    EasyLoading.show(status: 'loading');
    await controller.LoginOnClick();
    if (controller.signinstatus) {
      EasyLoading.showSuccess(controller.msg);
      Get.offAllNamed('/homepage');
    } else {
      EasyLoading.showError(controller.msg);
      print('Error here');
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
                          'Login'.tr,
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
                  height: 300,
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    CustemText(
                      hieght: 68,
                      width: MediaQuery.of(context).size.width * 0.95,
                      hintText: 'Phone'.tr,
                      keyboard: TextInputType.phone,
                      onchanged: (Value) {
                        controller.phone = Value;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustemText(
                      hieght: 68,
                      width: MediaQuery.of(context).size.width * 0.95,
                      hintText: 'Password'.tr,
                      onchanged: (Value) {
                        controller.password = Value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      width: MediaQuery.of(context).size.width * 0.95,
                      hieght: 60,
                      ontap: () {
                        OnClickLogin();
                      },
                      ButtonName: 'Sign in'.tr,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(() {
                            return CustomCheckbox(
                              size: 25,
                              iconSize: 20,
                              isSelected: controller.checkBoxStatus.value,
                              onTap: () {
                                controller.changeCheckBox();
                              },
                            );
                          }),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Keep me sign in'.tr,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Acaslon Regular",
                                color: white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account ?'.tr,
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
                              Get.toNamed('/register');
                            },
                            child: Text(
                              'Sign up'.tr,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
