import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeUtils(ColorScheme colorScheme) {
    final theme = ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      brightness: colorScheme.brightness,
      fontFamily: null,
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
    );
    return theme;
  }

  static ColorScheme defaultLightColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF1772b4),
    brightness: Brightness.light,
  );

  static ColorScheme defaultDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF1772b4),
    brightness: Brightness.dark,
  );
}
