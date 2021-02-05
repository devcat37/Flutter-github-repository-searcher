import 'package:flutter/material.dart';

class Theming {
  static ThemeData get currentTheme => ThemeData(
        brightness: Brightness.light,
        errorColor: Color(0xFFB00020),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(
              fontSize: 10.0,
              color: Colors.black,
              fontFamily: 'Sf-Pro-Display'),
          headline5: TextStyle(
              fontSize: 12.0,
              color: Colors.black,
              fontFamily: 'Sf-Pro-Display'),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 1,
          shadowColor: Color(0xFFDFDFDF),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontFamily: 'Sf-Pro-Display',
              letterSpacing: 1.0,
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
            ),
          ),
        ),
      );
}
