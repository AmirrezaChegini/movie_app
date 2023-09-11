abstract class MovieEvent {}

class GetAllMovieEvent extends MovieEvent {
  final int page;
  GetAllMovieEvent(this.page);
}
