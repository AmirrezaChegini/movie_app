import 'package:movie_app/features/movies/domain/entity/movie_eintity.dart';

abstract class MovieState {}

class InitMovieState extends MovieState {}

class LoadingMovieState extends MovieState {}

class CompleteMovieState extends MovieState {
  final List<MovieEntity> allMovieList;
  CompleteMovieState(this.allMovieList);
}

class FailMovieState extends MovieState {
  final String errorMessage;
  FailMovieState(this.errorMessage);
}
