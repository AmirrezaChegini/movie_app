import 'package:movie_app/features/movies/domain/entity/genres_entity.dart';
import 'package:movie_app/features/movies/domain/entity/movie_eintity.dart';

abstract class MovieState {}

class InitMovieState extends MovieState {}

class LoadingMovieState extends MovieState {}

class CompleteMovieState extends MovieState {
  final List<MovieEntity> allMovieList;
  final List<GenresEntity> allGenresList;

  CompleteMovieState(this.allMovieList, this.allGenresList);
}

class FailMovieState extends MovieState {
  final String errorMessage;
  FailMovieState(this.errorMessage);
}
