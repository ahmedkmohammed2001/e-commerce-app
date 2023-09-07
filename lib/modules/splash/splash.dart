import 'package:flutter/material.dart';
import 'package:new_test_99/constant.dart';

class Splash extends StatelessWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Container(height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: gradiantBackground,
      child:Image.asset('assets/images/splash.png'),
   
      )),
    );
  }
}