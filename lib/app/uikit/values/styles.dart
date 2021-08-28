import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// All static styles goes here.
/// TODO: Make all styles constant, could be lot more performant.
abstract class Styles {
  static TextStyle? get headline1 => Get.textTheme.headline1;

  static TextStyle? get headline2 => Get.textTheme.headline2;

  static TextStyle? get headline3 => Get.textTheme.headline3;

  static TextStyle? get headline4 => Get.textTheme.headline4;

  static TextStyle? get headline5 => Get.textTheme.headline5;

  static TextStyle? get headline6 => Get.textTheme.headline6;

  static TextStyle? get subtitle1 => Get.textTheme.subtitle1;

  static TextStyle? get subtitle2 => Get.textTheme.subtitle2;

  static TextStyle? get bodyText1 => Get.textTheme.bodyText1;

  static TextStyle? get bodyText2 => Get.textTheme.bodyText2;

  static TextStyle? get caption => Get.textTheme.caption;

  static TextStyle? get button => Get.textTheme.button;

  static TextStyle? get overline => Get.textTheme.overline;
}
