import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';

class MovieAppbar extends StatelessWidget {
  const MovieAppbar({
    super.key,
    required this.photo,
  });

  final String photo;

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
        background: CachedNetworkImage(
          imageUrl: photo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
