import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:job_sathi/constants/app_constants.dart';
import 'package:job_sathi/controllers/zoom_provider.dart';
import 'package:job_sathi/views/common/drawer/drawerScreen.dart';
import 'package:job_sathi/views/common/exports.dart';
import 'package:job_sathi/views/ui/auth/profile.dart';
import 'package:job_sathi/views/ui/bookmarks/bookmarks.dart';
import 'package:job_sathi/views/ui/chat/chats_list.dart';
import 'package:job_sathi/views/ui/device_mgt/devices_info.dart';
import 'package:job_sathi/views/ui/homepage.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(
      builder: (context, zoomNotifier, child) {
        return ZoomDrawer(
          menuScreen: DrawerScreen(
            indexSetter: (index) {
              zoomNotifier.currentIndex = index;
            },
          ),
          mainScreen: currentSreen(),
          borderRadius: 30,
          showShadow: true,
          angle: 0.0,
          slideWidth: 250,
          menuBackgroundColor: Color(kLightBlue.value),
        );
      },
    );
  }

  Widget currentSreen() {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    switch (zoomNotifier.currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const ChatsList();
      case 2:
        return const BookMarkPage();
      case 3:
        return const DeviceManagement();
      case 4:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}


