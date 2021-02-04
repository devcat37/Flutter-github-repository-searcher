import 'package:flutter/material.dart';

class Theming {
  static ThemeData get currentTheme => ThemeData(
        brightness: Brightness.light,
        errorColor: Color(0xFFB00020),
        scaffoldBackgroundColor: Colors.white,
      );
}
