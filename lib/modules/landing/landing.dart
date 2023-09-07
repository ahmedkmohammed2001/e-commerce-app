import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_test_99/components/custom_button.dart';
import 'package:new_test_99/constant.dart';

class Landing extends StatelessWidget {
  Landing();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: gradiantBackground,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
                width: 180,
                height: 180,
                child: Image.asset('assets/images/R5.png')),
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome'.tr,
              style: TextStyle(fontSize: 40, color: white),
            ),
            SizedBox(
              height: 150,
            ),
            Center(
              child: CustomButton(
                width: MediaQuery.of(context).size.width * 0.9,
                hieght: 60,
                ButtonName: 'Sign in'.tr,
                ontap: () {
                  Get.toNamed('/login');
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              ontap: () {
                Get.toNamed('/register');
                
                
              },
              width: MediaQuery.of(context).size.width * 0.9,
              hieght: 60,
              ButtonName: 'Sign up'.tr,
              ButtonColor: yalow,
            ),
          ],
        ),
      ),
    ));
  }
}
