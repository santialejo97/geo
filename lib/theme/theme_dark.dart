import 'package:flutter/material.dart';

class ThemeDark {
  static final primaryColor = Colors.purple;

  static final ThemeData themeDark = ThemeData.dark().copyWith(
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: primaryColor),
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(color: primaryColor, shadowColor: primaryColor),
  );
}
