import 'package:get/get.dart';

import 'app_pages.dart';

/// Navigator for complete app. All routes with appropriate params are define here.
/// NOTE: Don't use `Get` directly for navigation anywhere in the app.
abstract class Navik {
  static back() {
    Get.back();
  }

  static toLanding({bool clearCurrent = false}) {
    if (clearCurrent) {
      Get.offNamed(Routes.LANDING);
    } else {
      Get.toNamed(Routes.LANDING);
    }
  }

  static toHome({bool clearCurrent = false}) {
    if (clearCurrent) {
      Get.offNamed(Routes.HOME);
    } else {
      Get.toNamed(Routes.HOME);
    }
  }

  static void toLogin() {}
}
