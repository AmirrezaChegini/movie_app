import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';

class AppTheme {
  static final ThemeData darktheme = ThemeData(
    scaffoldBackgroundColor: AppColor.black,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColor.white,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        color: AppColor.orang,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        fontSize: 15,
        color: AppColor.white,
      ),
    ),
  );
}
