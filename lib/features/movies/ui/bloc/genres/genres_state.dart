import 'package:movie_app/features/movies/domain/entity/genres_entity.dart';

abstract class GenresState {}

class InitGenresState extends GenresState {}

class CompletedGenresState extends GenresState {
  final List<GenresEntity> genresList;
  CompletedGenresState(this.genresList);
}
