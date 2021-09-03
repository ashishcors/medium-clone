import 'package:get/get.dart';

import 'home_tab_controller.dart';

class HomeTabBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeTabController>(HomeTabController());
  }
}

