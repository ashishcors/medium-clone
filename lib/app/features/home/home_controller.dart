import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/base/base_controller.dart';
import 'package:medium_clone/app/features/home/mobiletabs/accounttab/account_tab_bindings.dart';
import 'package:medium_clone/app/features/home/mobiletabs/accounttab/account_tab_page.dart';
import 'package:medium_clone/app/features/home/mobiletabs/hometab/home_tab_bindings.dart';
import 'package:medium_clone/app/features/home/mobiletabs/hometab/home_tab_page.dart';
import 'package:medium_clone/app/features/home/mobiletabs/liststab/lists_tab_bindings.dart';
import 'package:medium_clone/app/features/home/mobiletabs/liststab/lists_tab_page.dart';
import 'package:medium_clone/app/features/home/mobiletabs/searchtab/search_tab_bindings.dart';
import 'package:medium_clone/app/features/home/mobiletabs/searchtab/search_tab_page.dart';

class HomeController extends BaseController {
  HomeController();

  final _selectedBottomNav = 0.obs;

  int get selectedBottomNav => _selectedBottomNav.value;

  final Rx<Widget> selectedTab = Rx(const HomeTabPage());

  @override
  void onInit() {
    super.onInit();
    HomeTabBindings().dependencies();
  }

  void setSelectedNav(int index) {
    // injecting dependencies as and when required
    // TODO: bad idea
    switch (index) {
      case 0:
        {
          selectedTab.value = const HomeTabPage();
        }
        break;
      case 1:
        {
          SearchTabBindings().dependencies();
          selectedTab.value = const SearchTabPage();
        }
        break;
      case 2:
        {
          ListsTabBindings().dependencies();
          selectedTab.value = const ListsTabPage();
        }
        break;
      case 3:
        {
          AccountTabBindings().dependencies();
          selectedTab.value = const AccountTabPage();
        }
        break;
      default:
        {
          selectedTab.value = const HomeTabPage();
        }
        break;
    }
    _selectedBottomNav.value = index;
  }
}
