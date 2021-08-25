import 'package:flutter/material.dart';
import 'package:medium_clone/app/uikit/uikit.dart';

class WizTextButton extends WizButton {
  WizTextButton(
    String text, {
    Key? key,
    required void Function()? onPressed,
    Color? textColor,
  }) : super(
          text,
          key: key,
          onPressed: onPressed,
          color: Colors.transparent,
          textColor: textColor ?? ColorPalette.textPrimary,
        );
}

class WizButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;

  const WizButton(
    this.text, {
    Key? key,
    required,
    required this.onPressed,
    this.color,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border:
                Border.all(color: borderColor ?? color ?? ColorPalette.primary),
            color: color ?? ColorPalette.primary,
          ),
          child: Text(
            text,
            style: Styles.button?.copyWith(
              color: textColor ?? ColorPalette.white,
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onTap;

  const LoginButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: ColorPalette.textSecondary)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(icon, size: 20),
            ),
            Expanded(
                child: Center(
                    child: Text(
              text,
              style: Styles.subtitle2,
            ))),
          ],
        ),
      ),
    );
  }
}
