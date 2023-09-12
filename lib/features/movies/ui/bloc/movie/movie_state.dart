import 'package:movie_app/features/movies/domain/entity/movie_entity.dart';

abstract class MovieState {}

class InitMovieState extends MovieState {}

class LoadingMovieState extends MovieState {}

class CompleteMovieState extends MovieState {
  final MovieEntity movie;
  CompleteMovieState(this.movie);
}

class FailMovieState extends MovieState {
  final String errorMessage;
  FailMovieState(this.errorMessage);
}
