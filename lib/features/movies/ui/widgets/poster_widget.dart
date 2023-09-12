import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/features/movies/domain/entity/poster_eintity.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key, required this.movie});

  final PosterEntity movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: movie.poster,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 10,
              left: 10,
              child: RichText(
                text: TextSpan(
                  text: movie.rating,
                  style: Theme.of(context).textTheme.titleLarge,
                  children: const [
                    TextSpan(
                      text: ' ★',
                      style: TextStyle(
                        color: AppColor.yellow,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
