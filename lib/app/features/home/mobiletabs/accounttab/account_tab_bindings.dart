import 'package:get/get.dart';

import 'account_tab_controller.dart';

class AccountTabBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AccountTabController>(AccountTabController());
  }
}

