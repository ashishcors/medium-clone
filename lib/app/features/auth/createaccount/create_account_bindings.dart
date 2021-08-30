import 'package:get/get.dart';
import 'package:medium_clone/data/dynamic_link_helper.dart';
import 'package:medium_clone/domain/usecase/auth/signup/send_sign_up_magic_link_usecase.dart';
import 'package:medium_clone/domain/usecase/auth/signup/verify_sign_up_with_magic_link_use_case.dart';

import 'create_account_controller.dart';

class CreateAccountBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SendSignUpMagicLinkUseCase(Get.find()));
    Get.put(DeeplinkHelper());
    Get.put(CompleteSignUpWithMagicLinkUseCase(Get.find()));
    Get.put<CreateAccountController>(
        CreateAccountController(Get.find(), Get.find(), Get.find()));
  }
}
