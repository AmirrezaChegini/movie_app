import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/widgets/loading_widget.dart';
import 'package:movie_app/core/widgets/textbtn.dart';
import 'package:movie_app/features/movies/ui/bloc/movie_bloc.dart';
import 'package:movie_app/features/movies/ui/bloc/movie_event.dart';
import 'package:movie_app/features/movies/ui/bloc/movie_state.dart';
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

    BlocProvider.of<MovieBloc>(context).add(GetAllMovieEvent());

    _scrollCtrl.addListener(() {
      if (_scrollCtrl.position.pixels == _scrollCtrl.position.maxScrollExtent) {
        BlocProvider.of<MovieBloc>(context).add(GetAllMovieEvent());
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
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is InitMovieState) {
          return const Center(
            child: LoadingWidget(),
          );
        }

        if (state is FailMovieState) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: TextBtn(
                backgroundColor: AppColor.tranparent,
                foregroundColor: AppColor.white,
                ontap: () {
                  BlocProvider.of<MovieBloc>(context).add(GetAllMovieEvent());
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Refresh'),
                    SizedBox(width: 10),
                    Icon(Icons.refresh),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is CompleteMovieState) {
          return CustomScrollView(
            controller: _scrollCtrl,
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.allGenresList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ChoiceGenres(
                        genres: state.allGenresList[index],
                      ),
                    ),
                  ),
                ),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.allMovieList.length,
                  (context, index) => MovieWidget(
                    movie: state.allMovieList[index],
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LoadingWidget(),
                ),
              )
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
