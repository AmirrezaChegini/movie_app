import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/features/movies/domain/entity/genres_entity.dart';

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
        setState(() {
          isChoice = !isChoice;
        });
      },
      selected: isChoice,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
