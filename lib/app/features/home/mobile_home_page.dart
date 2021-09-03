import 'package:flutter/material.dart';
import 'package:medium_clone/app/uikit/uikit.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks_outlined),
            activeIcon: Icon(Icons.bookmarks),
            label: "Bookmarks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search),
            label: "Account",
          ),
        ],
        selectedItemColor: ColorPalette.green,
        unselectedItemColor: ColorPalette.primary,
        showSelectedLabels: false,
      ),
      body: Placeholder(),
    );
  }
}
