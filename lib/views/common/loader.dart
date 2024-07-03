import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_sathi/constants/app_constants.dart';
import 'package:job_sathi/views/common/app_style.dart';
import 'package:job_sathi/views/common/reusable_text.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h,
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/optimized_search.png"),
                ReusableText(text: "No data Found", style: appstyle(24, Color(kDark.value), FontWeight.w600),),
                 ],
            )
          );
  }
}