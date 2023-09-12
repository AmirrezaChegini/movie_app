import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/widgets/loading_widget.dart';
import 'package:movie_app/core/widgets/textbtn.dart';
import 'package:movie_app/features/movies/ui/bloc/genres/genres_bloc.dart';
import 'package:movie_app/features/movies/ui/bloc/genres/genres_event.dart';
import 'package:movie_app/features/movies/ui/bloc/genres/genres_state.dart';
import 'package:movie_app/features/movies/ui/bloc/movie/movie_bloc.dart';
import 'package:movie_app/features/movies/ui/bloc/movie/movie_event.dart';
import 'package:movie_app/features/movies/ui/bloc/movie/movie_state.dart';
import 'package:movie_app/features/movies/ui/cubit/loading_cubit.dart';
import 'package:movie_app/features/movies/ui/widgets/choice_genres.dart';
import 'package:movie_app/features/movies/ui/widgets/movie_widget.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final ScrollController _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();

    BlocProvider.of<MovieBloc>(context).add(GetMoviesEvent());
    BlocProvider.of<GenresBloc>(context).add(GetGenresEvent());

    _scrollCtrl.addListener(() {
      if (_scrollCtrl.position.pixels == _scrollCtrl.position.maxScrollExtent) {
        BlocProvider.of<MovieBloc>(context).add(GetMoviesEvent());
        BlocProvider.of<LoadingCubit>(context).showLoading(true);
      } else {
        BlocProvider.of<LoadingCubit>(context).showLoading(true);
      }
    });
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollCtrl,
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
            child: BlocBuilder<GenresBloc, GenresState>(
              builder: (context, state) {
                if (state is CompletedGenresState) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.genresList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ChoiceGenres(
                        genres: state.genresList[index],
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
        BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is LoadingMovieState) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width / 1.5),
                  child: const LoadingWidget(),
                ),
              );
            }

            if (state is FailMovieState) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 100,
                    right: 100,
                    top: MediaQuery.of(context).size.width / 1.5,
                  ),
                  child: TextBtn(
                    backgroundColor: AppColor.tranparent,
                    foregroundColor: AppColor.white,
                    ontap: () {
                      BlocProvider.of<MovieBloc>(context).add(GetMoviesEvent());
                      BlocProvider.of<GenresBloc>(context)
                          .add(GetGenresEvent());
                    },
                    child: const Text('Refresh'),
                  ),
                ),
              );
            }

            if (state is CompleteMovieState) {
              return SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.allMovieList.length,
                  (context, index) => MovieWidget(
                    movie: state.allMovieList[index],
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              );
            }

            return const SliverToBoxAdapter();
          },
        ),
        BlocBuilder<LoadingCubit, bool>(
          builder: (context, state) => SliverToBoxAdapter(
            child: Visibility(
              visible: state,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: LoadingWidget(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
