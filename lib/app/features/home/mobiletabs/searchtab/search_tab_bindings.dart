import 'package:get/get.dart';

import 'search_tab_controller.dart';

class SearchTabBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SearchTabController>(SearchTabController());
  }
}

