import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/features/movies/domain/entity/genres_entity.dart';
import 'package:movie_app/features/movies/ui/bloc/posters/posters_bloc.dart';
import 'package:movie_app/features/movies/ui/bloc/posters/posters_event.dart';
import 'package:movie_app/features/movies/ui/cubit/chips_cubit.dart';

class ChoiceGenres extends StatelessWidget {
  const ChoiceGenres({
    super.key,
    required this.genre,
    required this.index,
  });

  final GenresEntity genre;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChipsCubit, int>(
      builder: (context, state) => ChoiceChip(
        label: Text(genre.name),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        backgroundColor: AppColor.white,
        selectedColor: AppColor.orang,
        onSelected: (value) {
          //reset page and posterList for getting new data
          BlocProvider.of<PostersBloc>(context).posterList.clear();
          BlocProvider.of<PostersBloc>(context).page = 1;

          //changing selected ui chips
          BlocProvider.of<ChipsCubit>(context).i == index
              ? BlocProvider.of<ChipsCubit>(context).chnageIndex(-1)
              : BlocProvider.of<ChipsCubit>(context).chnageIndex(index);

          BlocProvider.of<PostersBloc>(context)
              .add(GetPostersEvent(genreID: genre.id));
        },
        selected: state == index,
      ),
    );
  }
}
