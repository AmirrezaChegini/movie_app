import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/features/movies/domain/entity/movie_eintity.dart';
import 'package:movie_app/features/movies/domain/usecases/get_all_movie_usecase.dart';
import 'package:movie_app/features/movies/domain/usecases/get_spicific_movie_usecase.dart';
import 'package:movie_app/features/movies/ui/bloc/movie/movie_event.dart';
import 'package:movie_app/features/movies/ui/bloc/movie/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetAllMovieUsecase _allMovieUsecase;
  final GetSpecificMovieUsecase _specificMovieUsecase;

  List<MovieEntity> allMovieList = [];
  List<int> genresId = [];
  int page = 1;

  MovieBloc(
    this._allMovieUsecase,
    this._specificMovieUsecase,
  ) : super(InitMovieState()) {
    on<GetMoviesEvent>((event, emit) async {
      if (allMovieList.isEmpty) {
        emit(LoadingMovieState());
      }

      //if genresId is empty we fetch all movies
      if (genresId.isEmpty) {
        var either = await _allMovieUsecase(page);

        either.fold((errorMessage) {
          emit(FailMovieState(errorMessage));
        }, (movieList) {
          allMovieList.addAll(movieList);
          emit(CompleteMovieState(allMovieList));
        });
        ++page;
      } else {
        //if genresId not empty fetch movie according to genres
        var either = await _specificMovieUsecase(MovieParam(page, genresId));

        either.fold((errorMessage) {
          emit(FailMovieState(errorMessage));
        }, (movieList) {
          allMovieList.addAll(movieList);
          emit(CompleteMovieState(allMovieList));
        });
        ++page;
      }
    });
  }
}
