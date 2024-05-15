import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_sathi/constants/app_constants.dart';
import 'package:job_sathi/views/common/app_style.dart';
import 'package:job_sathi/views/common/exports.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.text, this.child, this.actions});
  final String? text;
  final Widget? child; 
  final List<Widget>? actions;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(),
      backgroundColor: Color(kLight.value),
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 70.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 5.w),
        child: child,
      ),
      actions:actions,
      centerTitle: true,
      title: ReusableText(
        text: text ?? "",
        style: appstyle(20, Color(kDark.value), FontWeight.w600),
      ),
    );
  }
}