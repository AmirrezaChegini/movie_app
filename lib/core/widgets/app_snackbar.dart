import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';

showMessage(BuildContext context, String message,
    {SnackBarAction? snackBarAction}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 14,
          color: AppColor.white,
        ),
      ),
      action: snackBarAction,
      backgroundColor: AppColor.orang,
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
