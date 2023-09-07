import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant.dart';

class CustemText extends StatelessWidget {
  final double width, hieght;
  final String hintText;
  final TextInputType? keyboard;
  final Function(String) onchanged;
  const CustemText(
      {required this.hieght,
      required this.width,
      required this.hintText,
      required this.onchanged,
      this.keyboard});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hieght,
      decoration: BoxDecoration(
          color: white.withAlpha(40),
          ),
      child: Center(
        child: TextField(
          onChanged: onchanged,
          cursorColor: white,
          keyboardType: keyboard ?? TextInputType.text,
          style: TextStyle(
              color: white, fontSize: 20, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8)),
        ),
      ),
    );
  }
}
