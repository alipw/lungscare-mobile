import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:motion_hack/app/modules/home/views/home_view.dart';
import 'package:motion_hack/app/modules/konsultasi/views/konsultasi_view.dart';
import 'package:motion_hack/app/modules/notifikasi_page/views/notifikasi_page_view.dart';
import 'package:motion_hack/app/modules/profile_page/views/profile_page_view.dart';
import 'package:motion_hack/app/shared/theme/color.dart';
import 'package:motion_hack/app/modules/chat_page/controllers/chat_page_controller.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  final controller = Get.find<NavigationController>();

  @override
  void initState() {
    super.initState();

    Get.put(ChatPageController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Obx(
            () => IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomeView(),
                const KonsultasiView(),
                const NotifikasiPageView(),
                const ProfilePageView(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            showUnselectedLabels: true,
            unselectedItemColor: Colors.black38,
            selectedItemColor: primaryColor,
            type: BottomNavigationBarType.fixed,
            onTap: controller.changeTab,
            currentIndex: controller.tabIndex.value,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/navBeranda.png',
                  width: 27,
                  height: 27,
                ),
                label: 'Beranda',
                activeIcon: Image.asset(
                  'assets/images/icons/navBeranda.png',
                  width: 27,
                  height: 27,
                  color: primaryColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/navKonsultasi.png',
                  width: 27,
                  height: 27,
                ),
                label: 'LungsBot',
                activeIcon: Image.asset(
                  'assets/images/icons/navKonsultasi.png',
                  width: 27,
                  height: 27,
                  color: primaryColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/navNotifikasi.png',
                  width: 27,
                  height: 27,
                ),
                label: 'Notifikasi',
                activeIcon: Image.asset(
                  'assets/images/icons/navNotifikasi.png',
                  width: 27,
                  height: 27,
                  color: primaryColor,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/icons/navProfile.png',
                  width: 27,
                  height: 27,
                ),
                label: 'Profile',
                activeIcon: Image.asset(
                  'assets/images/icons/navProfile.png',
                  width: 27,
                  height: 27,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ));
  }
}
