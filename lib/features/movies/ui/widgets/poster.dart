import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';

class Poster extends StatelessWidget {
  const Poster({
    super.key,
    required this.height,
    this.width,
  });

  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColor.red,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
