import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/auth/landing/authdialog/auth_dialog_controller.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/values/color_palette.dart';
import 'package:medium_clone/app/uikit/widgets/magic_link_send_view.dart';
import 'package:medium_clone/app/uikit/widgets/wiz_button.dart';

import 'create_account_controller.dart';

class DesktopCreateAccountPage extends GetView<CreateAccountController> {
  const DesktopCreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.isNameRequired = false;
    return Scaffold(
      body: Obx(
        () => controller.loginState.value.when(
          idle: _buildInitialState,
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (email) => MagicLinkSentView(
            description: "Click the link we sent to $email to sign up.",
            showCloseButton: false,
          ),
          error: (message) {
            return _buildInitialState(errorMessage: message);
          },
        ),
      ),
    );
  }

  Widget _buildInitialState({String? errorMessage}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 220),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            "Sign up with email.",
            style: Styles.headline5?.copyWith(
              color: ColorPalette.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          Text(
            "Enter your email address to create an\naccount.",
            style: Styles.subtitle2?.copyWith(
              color: ColorPalette.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 72),
          const Text("Your email"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(controller: controller.emailController),
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: WizButton(
              "Create account",
              color: ColorPalette.primary,
              textColor: ColorPalette.background,
              onPressed: controller.submitData,
            ),
          ),
          const SizedBox(height: 8),
          if (errorMessage != null)
            Text(
              errorMessage,
              style: Styles.caption?.copyWith(color: ColorPalette.red),
            ),
          const SizedBox(height: 24),
          _allSignUpOptions(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _allSignUpOptions() {
    return TextButton(
      onPressed: Get.find<AuthDialogController>().toCreateAccountLandingPage,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.keyboard_arrow_left_sharp,
            color: ColorPalette.green,
          ),
          Text(
            "All sign up options",
            style: Styles.subtitle2?.copyWith(color: ColorPalette.green),
          ),
        ],
      ),
    );
  }
}
