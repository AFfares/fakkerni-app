import 'package:flutter/material.dart';

ThemeData buildFakkerniTheme() {
  const primary = Color(0xFF79B9F9);
  const secondary = Color(0xFF6279FF);
  const accent = Color(0xFFB59AFD);
  const background = Color(0xFFF8FBFF);
  const surface = Colors.white;
  const text = Color(0xFF15324D);

  final colorScheme = ColorScheme.fromSeed(
    seedColor: primary,
    primary: primary,
    secondary: secondary,
    tertiary: accent,
    surface: surface,
    brightness: Brightness.light,
  ).copyWith(surfaceContainerHighest: const Color(0xFFEAF3FF));

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: background,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: text,
      elevation: 0,
      centerTitle: false,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: text,
        height: 1.15,
      ),
      headlineMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: text,
        height: 1.15,
      ),
      headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: text,
        height: 1.15,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: text,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: text,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: text,
        height: 1.45,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: text,
        height: 1.45,
      ),
      labelLarge: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: text,
      ),
    ),
    cardTheme: CardTheme(
      color: surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      shadowColor: const Color(0x2215324D),
      surfaceTintColor: Colors.transparent,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFFEAF3FF),
      selectedColor: primary.withValues(alpha: 0.16),
      labelStyle: const TextStyle(color: text),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
