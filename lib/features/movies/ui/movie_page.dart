import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/widgets/loading_widget.dart';
import 'package:movie_app/core/widgets/textbtn.dart';
import 'package:movie_app/features/movies/domain/entity/poster_eintity.dart';
import 'package:movie_app/features/movies/ui/bloc/movie/movie_bloc.dart';
import 'package:movie_app/features/movies/ui/bloc/movie/movie_event.dart';
import 'package:movie_app/features/movies/ui/bloc/movie/movie_state.dart';
import 'package:movie_app/features/movies/ui/widgets/info_widget.dart';
import 'package:movie_app/features/movies/ui/widgets/movie_appbar.dart';
import 'package:movie_app/features/movies/ui/widgets/poster.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({
    super.key,
    required this.poster,
  });

  final PosterEntity poster;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is LoadingMovieState) {
            return const Center(child: LoadingWidget());
          }

          if (state is FailMovieState) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: TextBtn(
                  backgroundColor: AppColor.tranparent,
                  foregroundColor: AppColor.white,
                  ontap: () {
                    BlocProvider.of<MovieBloc>(context)
                        .add(GetMovieEvent(poster.id));
                  },
                  child: const Text('Refresh'),
                ),
              ),
            );
          }

          if (state is CompleteMovieState) {
            return CustomScrollView(
              slivers: [
                MovieAppbar(photo: poster.poster),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: Text(
                      state.movie.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 25),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 2,
                    ),
                    child: Text(
                      'Detail',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 2,
                      bottom: 20,
                    ),
                    child: InfoWidget(movie: state.movie),
                  ),
                ),
                if (state.movie.images != null) ...{
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: Text(
                        'Images',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemCount: state.movie.images?.length ?? 0,
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Poster(
                            photo: state.movie.images?[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                },
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      left: 16,
                      top: 20,
                      bottom: 4,
                    ),
                    child: Text(
                      'Plot Summary',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 10,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColor.blueGrey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        state.movie.plot,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
