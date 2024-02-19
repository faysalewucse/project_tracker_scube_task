import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scube_project_tracker/Helper/Constant.dart';
import 'colors.dart';

class MyTheme {
  static ThemeData themeData(){
    return ThemeData.from(colorScheme: const ColorScheme.light()).copyWith(
      scaffoldBackgroundColor: PINK_PINK1,
      primaryColor: PRIMARY_COLOR,
      // fontFamily: "Roboto",
      appBarTheme: const AppBarTheme(
        color: WHITE,
        elevation: 0,

      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.bold,
            fontSize: 24),
        bodyMedium: TextStyle(
          color: BLACK,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        bodySmall: TextStyle(
          color: GRAY_2,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        labelLarge: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w700,
            fontSize: 16),
        labelMedium: TextStyle(
          color: BLACK,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
        labelSmall: TextStyle(
            color: WHITE,
            fontWeight: FontWeight.w700,
            fontSize: 16),
        displayLarge: TextStyle(
            color: WHITE,
            fontWeight: FontWeight.bold,
            fontSize: 14),
        displayMedium: TextStyle(
            color: BLACK,
            fontWeight: FontWeight.w700,
            fontSize: 14),
        displaySmall: TextStyle(
          color: GRAY_2,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
        titleLarge: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
            fontSize: 14),
        titleMedium: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.bold,
            fontSize: 12),
        titleSmall: TextStyle(
          color: GRAY,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
        headlineLarge: TextStyle(
          color: BLACK,
          fontWeight: FontWeight.w400,
          fontSize: 11,
        ),
        headlineMedium: TextStyle(
          color: WHITE,
          fontWeight: FontWeight.w700,
          fontSize: 11,
        ),
        headlineSmall: TextStyle(
          color: NEUTRAL_N700,
          fontWeight: FontWeight.w400,
          fontSize: 10,
        ),

      ),
    );
  }
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: SCAFFOLD_BACKGROUND_COLOR,
    primaryColor: PRIMARY_COLOR,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: const AppBarTheme(
      color: SCAFFOLD_BACKGROUND_COLOR,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodySmall: N300_14_NORMAL,
      bodyMedium: N300_14_W500,
      bodyLarge: N300_16_W500,
      labelLarge: N300_22_NORMAL,
      labelMedium: N700_12_NORMAL,
      labelSmall: N700_12_W500,

      displayLarge: N700_16_W500,
      displayMedium: N700_14_W500,
      displaySmall: N700_14_NORMAL,
      titleLarge: N700_24_W500,
      titleMedium: E500_16_W500,
      titleSmall: N700_18_NORMAL,
      headlineLarge: N700_20_W500,
      headlineMedium: WHITE_18_NORMAL,
      headlineSmall: PRIMARY_14_W500,
    ),
  );
}
