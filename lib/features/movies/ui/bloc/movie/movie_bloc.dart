import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/domain/usecases/get_movie_usecase.dart';
import 'package:movie_app/features/movies/ui/bloc/movie/movie_event.dart';
import 'package:movie_app/features/movies/ui/bloc/movie/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovieUsecase _movieUsecase;

  MovieBloc(this._movieUsecase) : super(InitMovieState()) {
    on<GetMovieEvent>((event, emit) async {
      emit(LoadingMovieState());

      var either = await _movieUsecase(event.movieId);

      either.fold((errorMessage) {
        emit(FailMovieState(errorMessage));
      }, (movie) {
        emit(CompleteMovieState(movie));
      });
    });
  }
}
