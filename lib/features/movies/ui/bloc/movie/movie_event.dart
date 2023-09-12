abstract class MovieEvent {}

class GetMovieEvent extends MovieEvent {
  final int movieId;
  GetMovieEvent(this.movieId);
}
