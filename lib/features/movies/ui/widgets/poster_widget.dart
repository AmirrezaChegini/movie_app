import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/features/movies/domain/entity/poster_eintity.dart';
import 'package:movie_app/features/movies/ui/bloc/movie/movie_bloc.dart';
import 'package:movie_app/features/movies/ui/bloc/movie/movie_event.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget({super.key, required this.poster});

  final PosterEntity poster;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<MovieBloc>(context).add(GetMovieEvent(poster.id));
          context.pushNamed('movie page', extra: poster);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: poster.poster,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: RichText(
                  text: TextSpan(
                    text: poster.rating,
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
      ),
    );
  }
}
