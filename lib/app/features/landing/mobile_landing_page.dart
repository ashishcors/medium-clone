import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:medium_clone/app/uikit/uikit.dart';
import 'package:medium_clone/app/uikit/widgets/app_logo.dart';
import 'package:medium_clone/app/uikit/widgets/wiz_button.dart';

class MobileLandingPage extends StatelessWidget {
  const MobileLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLogo(size: 40, showTitle: true),
              const SizedBox(height: 72),
              Text(
                "join_wizdom".tr,
                style: Styles.headline4?.copyWith(
                  color: ColorPalette.textSecondary,
                ),
              ),
              const SizedBox(height: 48),
              LoginButton(
                icon: FontAwesomeIcons.google,
                text: "sign_up_with_google".tr,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              LoginButton(
                icon: FontAwesomeIcons.facebook,
                text: "sign_up_with_facebook".tr,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              LoginButton(
                icon: FontAwesomeIcons.envelope,
                text: "sign_up_with_email".tr,
                onTap: () {},
              ),
              const SizedBox(height: 24),
              RichText(
                  text: TextSpan(
                text: "Already have an account? ",
                style: Styles.bodyText2?.copyWith(
                  color: ColorPalette.textSecondary,
                ),
                children: [
                  TextSpan(
                      text: "Sign in.",
                      style: Styles.bodyText2?.copyWith(
                        color: ColorPalette.green,
                      ))
                ],
              )),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildTncText(),
                ),
              ),
            ],
          ),
        ),
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
