import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import 'app_colors.dart';
import 'custom_app_font_styles.dart';

class MyAppTheme {
  static ThemeData lightTheme = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: AppColors.white,
      dialTextStyle: CustomAppFontStyle.regular16,
    ),
    bannerTheme: const MaterialBannerThemeData(
      backgroundColor: AppColors.primary,
      contentTextStyle: TextStyle(color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: 16),
      leadingPadding: EdgeInsets.symmetric(horizontal: 16),
    ),
    datePickerTheme: const DatePickerThemeData(
      dayStyle: CustomAppFontStyle.regular16,
      yearStyle: CustomAppFontStyle.regular16,
      weekdayStyle: CustomAppFontStyle.regular16,
      backgroundColor: AppColors.white,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.grayFA,
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      shadowColor: AppColors.white,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.white,
    ),
    dialogTheme: const DialogThemeData(
      backgroundColor: AppColors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    ),
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.grayF5,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.primary,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.white,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary.withValues(alpha: 0.1),
      selectionHandleColor: AppColors.primary,
    ),
    fontFamily: AppConstants.arabicFontFamily,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.center,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xffffffff),
      contentPadding: const EdgeInsets.all(14.0),
      isDense: true,
      hintStyle: const TextStyle(color: Color(0xff9E9E9E)),
      labelStyle: const TextStyle(color: Color(0xff9E9E9E)),
      focusColor: AppColors.primary,
      floatingLabelStyle: const TextStyle(
        color: AppColors.primary,
        fontSize: 18,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Color(0xffDBDBDB)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color(0xffDBDBDB), width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.primary),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.primary),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        overlayColor: WidgetStateProperty.all<Color>(AppColors.primary),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      dragHandleColor: AppColors.grayDD,
      dragHandleSize: Size(48, 6),
      backgroundColor: Color(0xFFF6F6F6),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1E1E1E),
      shadowColor: Colors.black.withValues(alpha: 0.5),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    fontFamily: AppConstants.arabicFontFamily,
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.primary,
    bannerTheme: const MaterialBannerThemeData(
      backgroundColor: AppColors.primary,
      contentTextStyle: TextStyle(color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: 16),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.primary,
      onSecondary: Colors.white,
      surface: const Color(0xFF1E1E1E),
      onSurface: Colors.white,
      error: const Color(0xFFCF6679),
      onError: Colors.black,
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.all<Color>(Colors.grey),
      thumbColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.primary),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      focusColor: AppColors.primary,
      floatingLabelStyle: const TextStyle(
        color: AppColors.primary,
        fontSize: 25,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.primary),
        borderRadius: BorderRadius.circular(15.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.primary),
        borderRadius: BorderRadius.circular(15.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      fillColor: const Color(0xFF333333),
      filled: true,
      hintStyle: const TextStyle(color: Color(0xff9E9E9E)),
      labelStyle: const TextStyle(color: Color(0xff9E9E9E)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.primary),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        overlayColor: WidgetStateProperty.all<Color>(Colors.black26),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xFF333333),
    ),
  );
}
