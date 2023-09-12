import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/utils/extensions/dynamic_list__extension.dart';
import 'package:movie_app/features/movies/domain/entity/movie_entity.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
          color: AppColor.blueGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TIME',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    movie.time,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'RATED',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    movie.rated,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GENRE',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    movie.genres.seperateGenres(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'RELEASE DATE',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    movie.releasedTime,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
