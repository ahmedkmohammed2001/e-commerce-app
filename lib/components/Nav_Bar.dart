import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_test_99/modules/Search/Search.dart';

import '../constant.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: white,
      fixedColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Get.toNamed('/homepage');
            },
            child: Icon(
              Icons.home,
              color: secondBackColor,
              size: 30,
            ),
          ),
          label: 
            'Homepage'.tr,
          
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Get.toNamed('/search');
            },
            child: Icon(
              Icons.search,
              color: secondBackColor,
              size: 30,
            ),
          ),
          label:  
            'Search,'.tr,
            
          
        )
      ],
    );
  }
}
