import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:new_test_99/constant.dart';


import 'package:new_test_99/productDetials/productD.dart';

import 'Product_controller.dart';

class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              secondBackColor,
              firstBackColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text('Products'.tr,
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 42.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber /*Color(0xFFF17532)*/)),
              ),
            ),
            Expanded(
                flex: 8,
                child: GetBuilder<ProductController>(
                  init: ProductController(),
                  builder: (controller) {
                    return RefreshIndicator(
                        displacement: 250,
                        backgroundColor: white,
                        color: black,
                        strokeWidth: 3,
                        triggerMode: RefreshIndicatorTriggerMode.onEdge,
                        onRefresh: () async {
                          await controller.service.getProduct(controller.id);
                          print(controller.ProductList.value.length);
                        },
                        child: Obx(() {
                          if (controller.isLoadingProducts.value) {
                            return CircularProgressIndicator();
                          }
                          return ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.all(10),
                              itemCount: controller.ProductList.value.length,
                              itemBuilder: (_, index) {
                                return Card(
                                    child: InkWell(onTap: () {
                                  print('object');
                                  print(controller.ProductList.value[index].id);
                                  Get.to(
                                    ProductDetail(),
                                    arguments:
                                        controller.ProductList.value[index].id,
                                  );
                                }, child: Obx(() {
                                  return Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 3.0,
                                                blurRadius: 5.0)
                                          ],
                                          color: Colors.white),
                                      child: Column(children: [
                                        Image.network(
                                          controller
                                              .ProductList.value[index].image,
                                          width: 190.0,
                                          height: 190.0,
                                        ),
                                        Text(
                                            controller
                                                .ProductList.value[index].name,
                                            style: TextStyle(
                                                color: Colors.amber,
                                                fontFamily: 'Varela',
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Obx(() {
                                          return GestureDetector(
                                            onTap: () {},
                                            child: LikeButton(
                                              onTap: (_) async {
                                                return controller.ontaplike(
                                                    controller.ProductList
                                                        .value[index].id);
                                              },
                                              size: 30,
                                              isLiked: controller.ProductList
                                                  .value[index].isLike,
                                              likeCount: controller.ProductList
                                                  .value[index].likesCount,
                                            ),
                                          );
                                        }),
                                        SizedBox(
                                          height: 10,
                                        )
                                      ]));
                                })));
                              });
                        })
                        );
                  },
                )),
          ],
        ),
      ),
    ));
  }
}
