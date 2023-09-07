import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:new_test_99/components/Nav_Bar.dart';
import 'package:new_test_99/constant.dart';
import 'package:new_test_99/modules/Search/searshController.dart';
import 'package:new_test_99/product/Product_controller.dart';
import 'package:new_test_99/productDetials/productD.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: GetBuilder<SearchController>(
              init: SearchController(),
              builder: (controller) {
                return FloatingSearchBar(
                  hint: 'Search'.tr,
                  openAxisAlignment: 0.0,
                  openWidth: 600,
                  axisAlignment: 0.0,
                  scrollPadding: EdgeInsets.only(top: 16, bottom: 20),
                  elevation: 4.0,
                  physics: BouncingScrollPhysics(),
                  onQueryChanged: (query) {
                    controller.name = query;
                    controller.find(query);
                  },
                  transitionCurve: Curves.easeInOut,
                  transitionDuration: Duration(milliseconds: 500),
                  transition: CircularFloatingSearchBarTransition(),
                  debounceDelay: Duration(milliseconds: 500),
                  actions: [
                    FloatingSearchBarAction.searchToClear(
                      showIfClosed: false,
                    ),
                  ],
                  builder: (context, transition) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Material(
                        child: Container(
                            height: 900,
                            width: 330.0,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [firstBackColor, secondBackColor])),
                            child: Obx(
                              () => ListView.builder(
                                  itemCount: controller.result.value.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(ProductDetail(),
                                            arguments: controller
                                                .result.value[index].id);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              controller
                                                  .result.value[index].name,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.amber),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Image.network(controller
                                                .result.value[index].image),
                                            SizedBox(height: 25),
                                            Divider(
                                              thickness: 1,
                                              color: white,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            )),
                      ),
                    );
                  },
                );
              })),
      bottomNavigationBar: NavBar(),
    );
  }
}
