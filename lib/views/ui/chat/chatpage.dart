import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_sathi/views/common/app_bar.dart';
import 'package:job_sathi/views/common/drawer/drawer_widget.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize:const Size.fromHeight(50), 
      child: CustomAppBar(
      
        child: const Padding(
          padding:  EdgeInsets.all(12.0),
          child: DrawerWidget(),
        ),
      ),
      ),
    );
  }
}