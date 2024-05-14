import 'package:flutter/material.dart';
import 'package:job_sathi/views/common/exports.dart';

class CustomOutlineBtn extends StatelessWidget {
  const CustomOutlineBtn({super.key, this.width, this.hieght, required this.text, required this.color,  this.color2, this.onTap});
  final double? width;
  final double? hieght;
  final String text;
  final Color color;
  final Color? color2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: hieght,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 1),
          borderRadius: BorderRadius.circular(10),
          color: color2,
        ),
        child: Center(
          child: ReusableText(
            text:text,
            style: appstyle(16, color, FontWeight.w600)
          ),
        ),
      ),
    );
  }
}