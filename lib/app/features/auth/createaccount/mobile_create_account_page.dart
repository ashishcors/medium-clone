import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/routing/navik.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/values/color_palette.dart';
import 'package:medium_clone/app/uikit/widgets/app_logo.dart';
import 'package:medium_clone/app/uikit/widgets/magic_link_send_view.dart';
import 'package:medium_clone/app/uikit/widgets/wiz_button.dart';

import 'create_account_controller.dart';

class MobileCreateAccountPage extends GetView<CreateAccountController> {
  const MobileCreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.loginState.value.when(
            idle: _buildInitialState,
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (email) => MagicLinkSentView(
              description: "Click the link we sent to $email to sign up.",
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
            "Sign up with email.",
            style: Styles.headline4?.copyWith(
              color: ColorPalette.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          const Text("Your full name"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(controller: controller.nameController),
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
                    "Create account",
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
          const Spacer(),
          _buildTncText(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  RichText _buildTncText() {
    final textStyle = Styles.bodyText2?.copyWith(
      color: ColorPalette.textPrimary,
      fontSize: 13,
    );
    final greenStyle = textStyle?.copyWith(
      color: ColorPalette.green,
      decoration: TextDecoration.underline,
    );
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          const TextSpan(text: "By signing up you agree to our "),
          TextSpan(text: "Terms of Service".nonBreaking, style: greenStyle),
          const TextSpan(text: " and acknowledge that our "),
          TextSpan(text: "Privacy Policy".nonBreaking, style: greenStyle),
          const TextSpan(text: " applies to you."),
        ],
        style: textStyle,
      ),
    );
  }
}
