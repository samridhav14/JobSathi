import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_sathi/views/common/app_bar.dart';
import 'package:job_sathi/views/common/drawer/drawer_widget.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50), 
      child: CustomAppBar(
        child:  Padding(
          padding:  EdgeInsets.all(12.0),
          child: DrawerWidget(),
        ),
      ),
      ),
    );
  }
}