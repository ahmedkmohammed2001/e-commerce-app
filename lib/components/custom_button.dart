import 'package:flutter/material.dart';
import 'package:new_test_99/constant.dart';

class CustomButton extends StatelessWidget {
  final double? width, hieght;
  final double? fontsize;
  final String? ButtonName;
  final Color? ButtonColor, fontcolor;
  final Function() ontap;
  CustomButton(
      {required this.width,
      required this.hieght,
      required this.ontap,
      required this.ButtonName,
      this.ButtonColor,
      this.fontcolor,
      this.fontsize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: hieght,
        width: width,
        decoration: BoxDecoration(
            color: ButtonColor != null ? ButtonColor : white,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            ButtonName!,
            style:
                TextStyle(fontSize: fontsize ?? 20, color: fontcolor ?? black),
          ),
        ),
      ),
    );
  }
}
