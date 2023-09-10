import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColor.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
