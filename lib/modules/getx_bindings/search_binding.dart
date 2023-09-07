


import 'package:get/get.dart';
import 'package:new_test_99/modules/Search/searshController.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchController());
  }
}
