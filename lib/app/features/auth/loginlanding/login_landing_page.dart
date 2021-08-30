import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:medium_clone/app/routing/navik.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/widgets/app_logo.dart';
import 'package:medium_clone/app/uikit/widgets/wiz_button.dart';

import 'login_landing_controller.dart';

class LoginLandingPage extends GetView<LoginLandingController> {
  const LoginLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const AppLogo(size: 40, showTitle: true),
              const SizedBox(height: 72),
              Text(
                "welcome_back".tr,
                style: Styles.headline4?.copyWith(
                  color: ColorPalette.textSecondary,
                ),
              ),
              const SizedBox(height: 48),
              MobileLoginButton(
                icon: FontAwesomeIcons.google,
                text: "sign_in_with_google".tr,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              MobileLoginButton(
                icon: FontAwesomeIcons.facebook,
                text: "sign_in_with_facebook".tr,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              MobileLoginButton(
                icon: FontAwesomeIcons.twitter,
                text: "sign_in_with_twitter".tr,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              MobileLoginButton(
                icon: FontAwesomeIcons.envelope,
                text: "sign_in_with_email".tr,
                onTap: () {
                  Navik.toLogin();
                },
              ),
              const SizedBox(height: 24),
              RichText(
                  text: TextSpan(
                text: "Don't have an account? ",
                style: Styles.bodyText2?.copyWith(
                  color: ColorPalette.textSecondary,
                ),
                children: [
                  TextSpan(
                    text: "Sign Up.",
                    style: Styles.bodyText2?.copyWith(
                      color: ColorPalette.green,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = Navik.back,
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
