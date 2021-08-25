import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// All colors goes here.
abstract class ColorPalette {
  static const primaryLight = Color(0xff191919);
  static const primaryLightVariant = black;
  static const primaryDark = Color(0xff989898);
  static const primaryDarkVariant = white;

  static const secondaryLight = Color(0xFFC4E2FF);
  static const secondaryLightVariant = Color(0xFFC4E2FF);
  static const secondaryDark = Color(0xFF00203f);
  static const secondaryDarkVariant = Color(0xFF00203f);

  static const textPrimaryLight = black;
  static const textPrimaryDark = white;
  static const textSecondaryLight = primaryLight;
  static const textSecondaryDark = primaryDark;

  static const white = Colors.white;
  static const black = Colors.black;
  static const green = Color(0xff309756);

  static Color get primary => Get.theme.colorScheme.primary;

  static Color get primaryVariant => Get.theme.colorScheme.primaryVariant;

  static Color get secondary => Get.theme.colorScheme.secondary;

  static Color get secondaryVariant => Get.theme.colorScheme.secondaryVariant;

  static Color get textPrimary => Get.isDarkMode
      ? ColorPalette.textPrimaryDark
      : ColorPalette.textPrimaryLight;

  static Color get textSecondary => Get.isDarkMode
      ? ColorPalette.textSecondaryDark
      : ColorPalette.textSecondaryLight;
}
