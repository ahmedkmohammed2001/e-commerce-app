import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:new_test_99/components/Nav_Bar.dart';
import 'package:new_test_99/config/user_information.dart';
import 'package:new_test_99/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_test_99/constant.dart';
import 'package:new_test_99/lang/localization_service.dart';
import 'package:new_test_99/lang/localization_service.dart';
import 'package:new_test_99/modules/Search/Search.dart';
import 'package:new_test_99/modules/about_us/about_us.dart';
import 'package:new_test_99/modules/homepage/home_controller.dart';
import 'package:new_test_99/native_service.dart/secure_storage.dart';
import 'package:new_test_99/product/Product_controller.dart';
import 'package:new_test_99/product/product.dart';

import '../../constant.dart';

class Homepage extends StatelessWidget {
  Homepage();
  HomeComtroller controller = Get.find();
  List imagelist = [
    'assets/images/R (1).jpg',
    'assets/images/R(2).jpg',
    'assets/images/R(3).jpg'
  ];
  void OnClickLogout() async {
    EasyLoading.show(status: 'loading');
    await controller.logout();
    if (controller.sighnstatus) {
      EasyLoading.showSuccess(controller.msg!);
      Get.offAllNamed('/login');
    } else {
      EasyLoading.showError(controller.msg!);
      print('Error here');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      secondBackColor,
                      firstBackColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          color: secondBackColor.withAlpha(100),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Categories'.tr,
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    CarouselSlider(
                        items: imagelist.map((imageurl) {
                          return Container(
                              width: double.infinity,
                              child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.8),
                                      BlendMode.dstATop),
                                  child: Image.asset(imageurl,
                                      fit: BoxFit.cover)));
                        }).toList(),
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            autoPlay: true,
                            height: MediaQuery.of(context).size.height * 0.30)),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      if (controller.isLoadingCategories.value) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 5,
                           children: List.generate(
                              controller.categoriesList.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(Product(),
                                      arguments:
                                          controller.categoriesList[index].id);

                                  print('data');
                                },
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.22,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      decoration: BoxDecoration(
                                        color: white.withAlpha(100),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Obx(
                                            () => Text(
                                              controller.categoriesList
                                                  .value[index].name,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.amber),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Obx(() {
                                            return ColorFiltered(
                                                colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(0.9),
                                                    BlendMode.dstATop),
                                                child: Image.network(
                                                  controller.categoriesList
                                                      .value[index].icon,
                                                ));
                                          }),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]));
                          }));
                    }),
                    SizedBox(
                      height: 40,
                    )
                  ])))),
      bottomNavigationBar: NavBar(),
      drawer: Drawer(
        child: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              firstBackColor,
              secondBackColor.withAlpha(150),
              firstBackColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: secondBackColor.withAlpha(100),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                    )),
                width: MediaQuery.of(context).size.width,
                height: 306,
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          GestureDetector(
                            onTap: () {
                              OnClickLogout();
                              print('object');

                              print('token${UserInformation.User_token}');
                              print(controller.msg);

                              print('token${UserInformation.User_token}');
                              Get.toNamed('/login');
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  size: 30,
                                ),
                                Text(
                                  'Logout'.tr,
                                  style: TextStyle(fontSize: 20, color: white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  size: 30,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        LocalizationService()
                                            .changeLocale('العربية');
                                      },
                                      child: Text(
                                        "العربية",
                                        style: TextStyle(
                                            fontSize: 20, color: white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "/",
                                      style:
                                          TextStyle(fontSize: 20, color: white),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        LocalizationService()
                                            .changeLocale('English');
                                      },
                                      child: Text(
                                        "English",
                                        style: TextStyle(
                                            fontSize: 20, color: white),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(About());
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info,
                                  size: 30,
                                ),
                                Text(
                                  'About us'.tr,
                                  style: TextStyle(fontSize: 20, color: white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
