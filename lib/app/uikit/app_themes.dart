import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'values/color_palette.dart';

abstract class AppTheme {
  static final light = ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: ColorPalette.primaryLight,
      primaryVariant: ColorPalette.primaryLightVariant,
      secondary: ColorPalette.secondaryLight,
      secondaryVariant: ColorPalette.secondaryLightVariant,
    ),
    textTheme: textTheme.apply(
      displayColor: ColorPalette.textPrimaryLight,
      bodyColor: ColorPalette.textSecondaryLight,
    ),
  );

  static final dark = ThemeData.from(
    colorScheme: const ColorScheme.dark(
      primary: ColorPalette.primaryDark,
      primaryVariant: ColorPalette.primaryDarkVariant,
      secondary: ColorPalette.secondaryDark,
      secondaryVariant: ColorPalette.secondaryDarkVariant,
    ),
    textTheme: textTheme.apply(
      displayColor: ColorPalette.textPrimaryDark,
      bodyColor: ColorPalette.textSecondaryDark,
    ),
  );

  static final textTheme = TextTheme(
    headline1: GoogleFonts.notoSerif(
      fontSize: 103,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    headline2: GoogleFonts.notoSerif(
      fontSize: 64,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    headline3: GoogleFonts.notoSerif(
      fontSize: 51,
      fontWeight: FontWeight.w400,
    ),
    headline4: GoogleFonts.notoSerif(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headline5: GoogleFonts.notoSerif(
      fontSize: 26,
      fontWeight: FontWeight.w400,
    ),
    headline6: GoogleFonts.notoSerif(
      fontSize: 21,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: GoogleFonts.nunito(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    subtitle2: GoogleFonts.nunito(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyText1: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyText2: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    button: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    caption: GoogleFonts.openSans(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    overline: GoogleFonts.openSans(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );
}
