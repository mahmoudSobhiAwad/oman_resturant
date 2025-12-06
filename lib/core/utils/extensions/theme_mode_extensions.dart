import 'package:flutter/material.dart';

extension ThemeModeExtensions on BuildContext {
  /// True when current theme brightness is dark
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// True when current theme brightness is light
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  Brightness get currentBrightness => Theme.of(this).brightness;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
