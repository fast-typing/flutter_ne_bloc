import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.pink,
      scaffoldBackgroundColor: Colors.black,
    );
  }
}