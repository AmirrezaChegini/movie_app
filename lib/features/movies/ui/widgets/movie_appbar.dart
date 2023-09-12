import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';

class MovieAppbar extends StatelessWidget {
  const MovieAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColor.tranparent,
      expandedHeight: 300,
      collapsedHeight: 56,
      elevation: 0,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/images/scream.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
