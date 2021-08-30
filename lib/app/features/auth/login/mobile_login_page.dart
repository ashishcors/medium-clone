import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/routing/navik.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/widgets/app_logo.dart';
import 'package:medium_clone/app/uikit/widgets/magic_link_send_view.dart';
import 'package:medium_clone/app/uikit/widgets/wiz_button.dart';

import 'login_controller.dart';

class MobileLoginPage extends GetView<LoginController> {
  const MobileLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.loginState.value.when(
            idle: _buildInitialState,
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (email) => MagicLinkSentView(
              description: "Click the link we sent to $email to sign in.",
              onCloseClicked: Navik.back,
            ),
            error: (message) {
              return _buildInitialState(errorMessage: message);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInitialState({String? errorMessage}) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppLogo(size: 40, showTitle: true),
          const SizedBox(height: 60),
          Text(
            "Sign in with email.",
            style: Styles.headline4?.copyWith(
              color: ColorPalette.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          const Text("Your email"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(controller: controller.emailController),
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: WizButton(
                    "Continue",
                    color: ColorPalette.green,
                    textColor: ColorPalette.white,
                    onPressed: controller.submitData,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          if (errorMessage != null)
            Text(
              errorMessage,
              style: Styles.caption?.copyWith(color: ColorPalette.red),
            ),
        ],
      ),
    );
  }
}
