import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:new_test_99/components/custem_textfiled.dart';
import 'package:new_test_99/config/server_config.dart';
import 'package:new_test_99/config/user_information.dart';
import 'package:new_test_99/constant.dart';
import 'package:new_test_99/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:new_test_99/productDetials/productD_controller.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

class ProductDetail extends StatelessWidget {
  ProductDController c = new ProductDController();
  static late var x;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Expanded(
          flex: 8,
          child: GetBuilder<ProductDController>(
            init: ProductDController(),
            builder: (controller) {
              return RefreshIndicator(
                  displacement: 250,
                  backgroundColor: white,
                  color: Colors.black,
                  strokeWidth: 3,
                  triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  onRefresh: () async {
                    await controller.service.getProductViews(controller.id);
                    print(controller.ProductList.value.length);
                  },
                  child: Obx(() => ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10),
                      itemCount: controller.ProductList.value.length,
                      itemBuilder: (_, index) {
                        return Card(
                            child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [firstBackColor, secondBackColor]),
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 3.0,
                                    blurRadius: 5.0)
                              ],
                              color: Colors.white),
                          child: Column(children: [
                            SizedBox(height: 15.0),
                            Text('Products'.tr,
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    fontSize: 42.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber /*Color(0xFFF17532)*/)),
                            SizedBox(height: 10.0),
                            Image.network(
                              controller.ProductList.value[0].image,
                              width: 220,
                              height: 220,
                            ),
                            SizedBox(height: 25.0),
                            Center(
                              child: Text(controller.ProductList.value[0].name,
                                  style: TextStyle(
                                      color: Colors.amber /*Color(0xFF575E67)*/,
                                      fontFamily: 'Varela',
                                      fontSize: 34.0)),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 40.0),
                                  Text('Expier : '.tr,
                                      style: TextStyle(
                                          color: Colors.amber,
                                          fontFamily: 'Varela',
                                          fontSize: 24.0)),
                                  Text(
                                      ' ${controller.ProductList.value[0].expire}',
                                      style: TextStyle(
                                          color: white,
                                          fontFamily: 'Varela',
                                          fontSize: 20.0)),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Text('Category : '.tr,
                                          style: TextStyle(
                                              color: Colors.amber,
                                              fontFamily: 'Varela',
                                              fontSize: 24.0)),
                                      Text(
                                          ' ${controller.ProductList.value[0].category.name}',
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'Varela',
                                              fontSize: 24.0)),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Text('Phone'.tr,
                                          style: TextStyle(
                                              color: Colors.amber,
                                              fontFamily: 'Varela',
                                              fontSize: 24.0)),
                                      Text(
                                          ' : ${controller.ProductList.value[0].user.phone}',
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'Varela',
                                              fontSize: 24.0)),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Text('Quantity : '.tr,
                                          style: TextStyle(
                                              color: Colors.amber,
                                              fontFamily: 'Varela',
                                              fontSize: 24.0)),
                                      Text(
                                          ' ${controller.ProductList.value[0].mount}',
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'Varela',
                                              fontSize: 24.0)),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Text('Price : '.tr,
                                          style: TextStyle(
                                              color: Colors.amber,
                                              fontFamily: 'Varela',
                                              fontSize: 24.0)),
                                      Text(
                                          ' \$${controller.ProductList.value[0].price}',
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'Varela',
                                              fontSize: 24.0)),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Text('Views : '.tr,
                                          style: TextStyle(
                                              color: Colors.amber,
                                              fontFamily: 'Varela',
                                              fontSize: 24.0)),
                                      Text(
                                          ' ${controller.ProductList.value[0].views} ',
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'Varela',
                                              fontSize: 24.0)),
                                      Icon(
                                        Icons.visibility,
                                        color: white,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 48,
                                        width: 280,
                                        decoration: BoxDecoration(
                                          color: white.withAlpha(40),
                                        ),
                                        child: Center(
                                          child: TextField(
                                            onChanged: (Value) {},
                                            cursorColor: white,
                                            keyboardType: TextInputType.text,
                                            style: TextStyle(
                                              color: white,
                                              fontSize: 15,
                                            ),
                                            decoration: InputDecoration(
                                                hintText: 'Add comment ...'.tr,
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                  color: white,
                                                  fontSize: 20,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        20, 8, 8, 8)),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.send,
                                        color: Colors.amber,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ));
                      })));
            },
          )
          ),
    ));
  }
}
