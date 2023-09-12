import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/widgets/loading_widget.dart';
import 'package:movie_app/core/widgets/textbtn.dart';
import 'package:movie_app/features/movies/ui/bloc/genres/genres_bloc.dart';
import 'package:movie_app/features/movies/ui/bloc/genres/genres_event.dart';
import 'package:movie_app/features/movies/ui/bloc/genres/genres_state.dart';
import 'package:movie_app/features/movies/ui/bloc/posters/posters_bloc.dart';
import 'package:movie_app/features/movies/ui/bloc/posters/posters_event.dart';
import 'package:movie_app/features/movies/ui/bloc/posters/posters_state.dart';
import 'package:movie_app/features/movies/ui/cubit/loading_cubit.dart';
import 'package:movie_app/features/movies/ui/widgets/choice_genres.dart';
import 'package:movie_app/features/movies/ui/widgets/poster_widget.dart';

class PosterPage extends StatefulWidget {
  const PosterPage({super.key});

  @override
  State<PosterPage> createState() => _PosterPageState();
}

class _PosterPageState extends State<PosterPage> {
  final ScrollController _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();

    BlocProvider.of<PostersBloc>(context).add(GetPostersEvent());
    BlocProvider.of<GenresBloc>(context).add(GetGenresEvent());

    //create a listener for implement pagination
    _scrollCtrl.addListener(() {
      if (_scrollCtrl.position.pixels == _scrollCtrl.position.maxScrollExtent) {
        BlocProvider.of<PostersBloc>(context).add(GetPostersEvent());
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
            child: BlocConsumer<GenresBloc, GenresState>(
              listener: (context, state) =>
                  BlocProvider.of<LoadingCubit>(context).showLoading(false),
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
        BlocBuilder<PostersBloc, PostersState>(
          builder: (context, state) {
            if (state is LoadingPostersState) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width / 1.5),
                  child: const LoadingWidget(),
                ),
              );
            }

            if (state is FailPostersState) {
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
                      BlocProvider.of<PostersBloc>(context)
                          .add(GetPostersEvent());
                      BlocProvider.of<GenresBloc>(context)
                          .add(GetGenresEvent());
                    },
                    child: const Text('Refresh'),
                  ),
                ),
              );
            }

            if (state is CompletePostersState) {
              return SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.postersList.length,
                  (context, index) => MovieWidget(
                    poster: state.postersList[index],
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
