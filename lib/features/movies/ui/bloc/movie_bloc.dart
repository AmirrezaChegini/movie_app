import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/domain/entity/genres_entity.dart';
import 'package:movie_app/features/movies/domain/entity/movie_eintity.dart';
import 'package:movie_app/features/movies/domain/usecases/get_all_genres_usecase.dart';
import 'package:movie_app/features/movies/domain/usecases/get_all_movie_usecase.dart';
import 'package:movie_app/features/movies/ui/bloc/movie_event.dart';
import 'package:movie_app/features/movies/ui/bloc/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetAllMovieUsecase _allMovieUsecase;
  final GetAllGenresUsecase _allGenresUsecase;

  List<MovieEntity> allMovieList = [];
  List<GenresEntity> allGenresList = [];

  MovieBloc(this._allMovieUsecase, this._allGenresUsecase)
      : super(InitMovieState()) {
    on<GetAllMovieEvent>((event, emit) async {
      emit(LoadingMovieState());
      Future.delayed(const Duration(seconds: 1));

      var movieEither = await _allMovieUsecase(event.page);
      var genresEither = await _allGenresUsecase(null);

      //first fold one either and get data if an error emit failed stated
      movieEither.fold((message) {
        emit(FailMovieState(message));
      }, (allMovieList) {
        this.allMovieList = allMovieList;
      });

      //than fold second either ...
      genresEither.fold((message) {
        emit(FailMovieState(message));
      }, (allGenresList) {
        this.allGenresList = allGenresList;
      });

      if (allMovieList.isNotEmpty && allGenresList.isNotEmpty) {
        emit(CompleteMovieState(allMovieList, allGenresList));
      }
    });
  }
}
