import 'package:flutter/material.dart';

class TextBtnAuth extends StatelessWidget {
  const TextBtnAuth({
    super.key,
    required this.child,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.ontap,
  });

  final String child;
  final Color backgroundColor;
  final Color foregroundColor;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: const Size.fromHeight(50),
      ),
      child: Text(child),
    );
  }
}
