import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:job_sathi/constants/app_constants.dart';
import 'package:job_sathi/controllers/exports.dart';
import 'package:job_sathi/views/common/app_style.dart';
import 'package:job_sathi/views/common/reusable_text.dart';
import 'package:job_sathi/views/common/width_spacer.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatefulWidget {
  final ValueSetter indexSetter;
  const DrawerScreen({super.key, required this.indexSetter});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(
      builder: (context, zoomNotifier, child) {
        return GestureDetector(
            onDoubleTap: () {
              ZoomDrawer.of(context)!.toggle();
            },
            child: Scaffold(
              backgroundColor: Color(kLightBlue.value),
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    drawerItem(
                      AntDesign.home,
                      "Home",
                      0,
                      zoomNotifier.currentIndex == 0
                          ? Color(kDark.value)
                          : Color(kLightGrey.value),
                    ),
                    drawerItem(
                      Ionicons.chatbubble_outline,
                      "Chat",
                      1,
                      zoomNotifier.currentIndex == 1
                          ? Color(kDark.value)
                          : Color(kLightGrey.value),
                    ),
                    drawerItem(
                      FontAwesome.bookmark,
                      "Bookmarks",
                      2,
                      zoomNotifier.currentIndex == 2
                          ? Color(kDark.value)
                          : Color(kLightGrey.value),
                    ),
                    drawerItem(
                      MaterialCommunityIcons.devices,
                      "Device Mgmt",
                      3,
                      zoomNotifier.currentIndex == 3
                          ? Color(kDark.value)
                          : Color(kLightGrey.value),
                    ),
                    drawerItem(
                      FontAwesome5Regular.user_circle,
                      "Profile",
                      4,
                      zoomNotifier.currentIndex == 4
                          ? Color(kDark.value)
                          : Color(kLightGrey.value),
                    ),
                  ]),
            ));
      },
    );
  }

  Widget drawerItem(IconData icon, String title, int index, Color color) {
    return GestureDetector(
      onTap: () {
        widget.indexSetter(index);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.w, bottom: 20.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            const WidthSpacer(
              width: 12,
            ),
            ReusableText(
                text: title, style: appstyle(12, color, FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
