import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/features/movies/domain/entity/genres_entity.dart';
import 'package:movie_app/features/movies/ui/bloc/posters/posters_bloc.dart';
import 'package:movie_app/features/movies/ui/bloc/posters/posters_event.dart';

class ChoiceGenres extends StatefulWidget {
  const ChoiceGenres({
    super.key,
    required this.genres,
  });

  final GenresEntity genres;

  @override
  State<ChoiceGenres> createState() => _ChoiceGenresState();
}

class _ChoiceGenresState extends State<ChoiceGenres>
    with AutomaticKeepAliveClientMixin {
  bool isChoice = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChoiceChip(
      label: Text(widget.genres.name),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      backgroundColor: AppColor.white,
      selectedColor: AppColor.orang,
      onSelected: (value) {
        //this for changing choice chips ui
        setState(() {
          isChoice = !isChoice;
        });

        BlocProvider.of<PostersBloc>(context).posterList.clear();
        BlocProvider.of<PostersBloc>(context).page = 1;
        List<int> genresId = BlocProvider.of<PostersBloc>(context).genresId;

        //for add or remove genresId to list
        genresId.contains(widget.genres.id)
            ? BlocProvider.of<PostersBloc>(context)
                .genresId
                .remove(widget.genres.id)
            : BlocProvider.of<PostersBloc>(context)
                .genresId
                .add(widget.genres.id);

        BlocProvider.of<PostersBloc>(context).add(GetPostersEvent());
      },
      selected: isChoice,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
