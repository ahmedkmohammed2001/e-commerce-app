import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color firstBackColor = Color(0xff0099cc);
const Color secondBackColor = Color(0xff081C8E);
const Color thirdBackColor = Color(0xff556AEf);
const Color white = Color(0xffffffff);
const Color black = Color(0xff000000);
const Color yalow = Color(0xffEDFC00);
const Color red = Color(0xffE94F5A);
const Color grey = Color(0xffD9D9D9);
const Color greyblue = Color(0xff4B4972);
const Color darkyalow = Color(0xffFCB622);
const BoxDecoration gradiantBackground = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
      firstBackColor,
      secondBackColor,
      thirdBackColor,
    ]));
