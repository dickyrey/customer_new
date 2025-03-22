import 'package:flutter/material.dart';
import 'package:shared_common/colors.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/google_fonts/google_fonts.dart';

ThemeData themeLight(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: false,
    primaryIconTheme: const IconThemeData(
      color: ColorLight.fontTitle,
      size: 20,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ColorLight.primary,
      onPrimary: ColorLight.primary,
      secondary: ColorLight.secondary,
      onSecondary: ColorLight.secondary,
      error: ColorLight.error,
      onError: ColorLight.error,
      surface: ColorLight.background,
      onSurface: ColorLight.background,
    ),
    primaryColor: ColorLight.primary,
    cardColor: ColorLight.card,
    cardTheme: CardTheme(
      elevation: 0,
      color: ColorLight.card,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RADIUS),
      ),
    ),
    disabledColor: ColorLight.disabled,
    hintColor: ColorLight.hint,
    indicatorColor: ColorLight.primary,
    buttonTheme: ButtonThemeData(
      disabledColor: ColorLight.disabledButton,
      buttonColor: ColorLight.primary,
      height: 45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RADIUS),
      ),
    ),
    iconTheme: const IconThemeData(color: ColorLight.fontTitle),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorLight.primary,
    ),
    scaffoldBackgroundColor: ColorLight.background,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headlineLarge: GoogleFonts.poppins(
        color: ColorLight.fontTitle,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: GoogleFonts.poppins(
        color: ColorLight.fontTitle,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: GoogleFonts.poppins(
        color: ColorLight.fontTitle,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: GoogleFonts.poppins(
        color: ColorLight.fontTitle,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: GoogleFonts.poppins(
        color: ColorLight.fontTitle,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.poppins(
        color: ColorLight.fontTitle,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: GoogleFonts.poppins(
        color: ColorLight.fontTitle,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: GoogleFonts.poppins(
        color: ColorLight.fontTitle,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: GoogleFonts.poppins(
        color: ColorLight.fontTitle,
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: ColorLight.fontSubtitle,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: ColorLight.fontSubtitle,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: GoogleFonts.poppins(
        color: ColorLight.fontSubtitle,
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
