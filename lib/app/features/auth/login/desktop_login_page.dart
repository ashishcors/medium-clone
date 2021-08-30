import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/features/auth/landing/authdialog/auth_dialog_controller.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/widgets/magic_link_send_view.dart';
import 'package:medium_clone/app/uikit/widgets/wiz_button.dart';

import 'login_controller.dart';

class DesktopLoginPage extends GetView<LoginController> {
  const DesktopLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.loginState.value.when(
          idle: _buildInitialState,
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (email) => MagicLinkSentView(
            description: "Click the link we sent to $email to sign in.",
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
            "Sign in with email.",
            style: Styles.headline5?.copyWith(
              color: ColorPalette.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          Text(
            "Enter the email address associated with\nyou account, and we'll send magic link ton\nyour inbox.",
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
              "Continue",
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
          _allSignInOptions(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _allSignInOptions() {
    return TextButton(
      onPressed: Get.find<AuthDialogController>().toLoginLandingPage,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.keyboard_arrow_left_sharp,
            color: ColorPalette.green,
          ),
          Text(
            "All sign in options",
            style: Styles.subtitle2?.copyWith(color: ColorPalette.green),
          ),
        ],
      ),
    );
  }
}
