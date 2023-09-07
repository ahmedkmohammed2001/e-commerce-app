import 'package:get/get.dart';
import 'package:new_test_99/models/categories_model.dart';
import 'package:new_test_99/modules/homepage/home_service.dart';
import 'package:new_test_99/native_service.dart/secure_storage.dart';

class HomeComtroller extends GetxController {
  var categoriesList = [].obs;
  RxBool isLoadingCategories = RxBool(true);
  HomeService service = new HomeService();
  List<Map<String, dynamic>> categorieslist = [];
  String? msg;
  SecureStorage storage = new SecureStorage();
  var sighnstatus;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    categoriesList.value = await service.getCategories();
    isLoadingCategories.value = false;

    super.onReady();
  }

  Future<void> logout() async {
    await storage.delete('token');
    sighnstatus = await service.logout();
    msg = service.msg;
    print('msg${service.msg}');
  }
}
