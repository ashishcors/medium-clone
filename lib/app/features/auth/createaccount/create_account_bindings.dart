import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:medium_clone/data/dynamic_link_helper.dart';

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
