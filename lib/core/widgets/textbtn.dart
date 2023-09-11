import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  const TextBtn({
    super.key,
    required this.child,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.ontap,
  });

  final Widget child;
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
        minimumSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      child: child,
    );
  }
}
