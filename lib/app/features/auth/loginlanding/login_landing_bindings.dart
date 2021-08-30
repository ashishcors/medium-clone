import 'package:get/get.dart';

import 'login_landing_controller.dart';

class LoginLandingBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginLandingController>(LoginLandingController());
  }
}

