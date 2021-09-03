import 'package:get/get.dart';

import 'lists_tab_controller.dart';

class ListsTabBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ListsTabController>(ListsTabController());
  }
}

