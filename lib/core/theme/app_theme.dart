import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
        colorSchemeSeed: Colors.white,
        scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white));
  }
}
