

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_test_99/modules/Search/Search.dart';
import 'package:new_test_99/modules/Search/searshController.dart';
import 'package:new_test_99/modules/about_us/about_us.dart';
import 'package:new_test_99/modules/getx_bindings/home_binding.dart';
import 'package:new_test_99/modules/getx_bindings/login_binding.dart';
import 'package:new_test_99/modules/getx_bindings/productD_binding.dart';
import 'package:new_test_99/modules/getx_bindings/product_binding.dart';
import 'package:new_test_99/modules/getx_bindings/register_bindings.dart';
import 'package:new_test_99/modules/getx_bindings/splash_binding.dart';
import 'package:new_test_99/modules/homepage/home.dart';
import 'package:new_test_99/modules/login/login.dart';
import 'package:new_test_99/modules/register/register.dart';
import 'package:new_test_99/modules/splash/splash.dart';
import 'package:new_test_99/product/product.dart';
import 'package:new_test_99/productDetials/productD.dart';
import 'lang/localization_service.dart';
import 'modules/getx_bindings/about_binding.dart';
import 'modules/getx_bindings/landing_binding.dart';
import 'modules/getx_bindings/search_binding.dart';
import 'modules/landing/landing.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  
  runApp(
   GetMaterialApp(
      locale: LocalizationService.locale,
    fallbackLocale: LocalizationService.fallbackLocale,
    translations: LocalizationService(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        getPages: [
          GetPage(
            name: '/landing',
            page: () => Landing(),
            binding: LandingBinding(),
          ),
          GetPage(name: '/login', page: () => Login(), binding: LoginBinding()),
          GetPage(
              name: '/register',
              page: () => Register(),
              binding: RegisterBinding()),
          GetPage(
              name: '/homepage',
              page: () => Homepage(),
              binding: HomeBinding()),
          GetPage(
              name: '/splash', page: () => Splash(), binding: SplashBinding()),
          GetPage(
              name: '/product',
              page: () => Product(),
              binding: ProductBinding()),
          GetPage(
              name: '/producD',
              page: () => ProductDetail(),
              binding: ProductDBinding()),
          GetPage(
              name: '/search', page: () => Search(), binding: SearchBinding()),
          GetPage(
            name: '/About',
            page: () => About(),
            binding: AboutBinding(),
          ),
        ],
        builder: EasyLoading.init(),
    
    )  );}


