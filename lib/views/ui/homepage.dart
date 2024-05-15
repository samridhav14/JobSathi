import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_sathi/views/common/app_bar.dart';
import 'package:job_sathi/views/common/drawer/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(preferredSize:const Size.fromHeight(50), 
      child: CustomAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(12.h),
            child:const CircleAvatar(
              radius: 15,
              backgroundImage:  AssetImage("assets/images/user.jpg"),
            )
          )
        ],
        child: const Padding(
          padding:  EdgeInsets.all(12.0),
          child: DrawerWidget(),
        ),
      ),
      ),
    );
  }
}
