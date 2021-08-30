import 'package:get/get.dart';
import 'package:medium_clone/data/dynamic_link_helper.dart';
import 'package:medium_clone/domain/usecase/auth/login/send_login_magic_link_use_case.dart';
import 'package:medium_clone/domain/usecase/auth/login/verify_login_magic_link_use_case.dart';

import 'login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SendLoginMagicLinkUseCase(Get.find()));
    Get.put(DeeplinkHelper());
    Get.put(VerifyLoginMagicLinkUseCase(Get.find()));
    Get.put<LoginController>(
        LoginController(Get.find(), Get.find(), Get.find()));
  }
}
