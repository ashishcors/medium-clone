import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/home/home_controller.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/values/color_palette.dart';
import 'package:medium_clone/app/uikit/widgets/user_avatar.dart';

class MobileHomePage extends StatelessWidget {
  final HomeController controller;

  const MobileHomePage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.post_add_outlined,
          color: ColorPalette.white,
        ),
        backgroundColor: ColorPalette.green,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.search),
              label: "Search",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_outlined),
              activeIcon: Icon(Icons.bookmarks),
              label: "Bookmarks",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: UserAvatar(controller.currentUser.imageUrl),
              ),
              activeIcon: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorPalette.green, width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.all(2),
                child: UserAvatar(controller.currentUser.imageUrl),
              ),
              label: "Account",
            ),
          ],
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorPalette.green,
          unselectedItemColor: ColorPalette.primary,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: controller.setSelectedNav,
          currentIndex: controller.selectedBottomNav,
        ),
      ),
      body: SafeArea(child: Obx(() => controller.selectedTab.value)),
    );
  }
}
