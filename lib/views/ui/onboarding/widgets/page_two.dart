import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_sathi/constants/app_constants.dart';
import 'package:job_sathi/views/common/app_style.dart';
import 'package:job_sathi/views/common/height_spacer.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hieght,
      color: Color(kDarkBlue.value),
      child: Column(
        children: [
          const HeightSpacer(size: 70),
          Padding(
            padding: EdgeInsets.all(8.h),
            child: Image.asset(
              'assets/images/page2.png',
            ),
          ),
          const HeightSpacer(size: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Start Your Career \n With Your Ability",
                textAlign: TextAlign.center,
                style: appstyle(30, Color(kLight.value), FontWeight.w500),
              ),
              const HeightSpacer(size: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                child: Text(
                  "We help you to find your dream job with your ability.",
                  textAlign: TextAlign.center,
                  style:
                      appstyle(14, Color(kLight.value), FontWeight.normal),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
