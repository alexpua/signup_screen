import 'package:flutter/material.dart';

const appColors = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF383838),
  onPrimary: Color(0xFF4A4E71),
  primaryContainer: Colors.white,
  secondary: Colors.transparent,
  onSecondary: Color(0xFF6F91BC),
  error: Color(0xFFFDEFEE),
  onError: Color(0xFFFF8080),
  tertiary: Color(0xFF27B274),
  surface: Color(0xFFE0EDFB),
  onSurface: Color(0xFFF4F9FF),
);

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: appColors,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: appColors.primaryContainer,
    hintStyle: TextStyle(
      color: appColors.onSecondary,
      fontWeight: FontWeight.w400,
    ),
    errorStyle: TextStyle(color: appColors.onError),
    focusColor: appColors.primary,
  ),
);
