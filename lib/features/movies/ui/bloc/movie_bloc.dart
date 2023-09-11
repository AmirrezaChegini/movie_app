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
  int page = 1;

  MovieBloc(this._allMovieUsecase, this._allGenresUsecase)
      : super(InitMovieState()) {
    on<GetAllMovieEvent>((event, emit) async {
      Future.delayed(const Duration(seconds: 1));

      var movieEither = await _allMovieUsecase(page);
      var genresEither = await _allGenresUsecase(null);

      //for getting first list we must increase after calling movie usecase
      page = page + 1;

      //first fold one either and get data if an error emit failed stated
      //we must add data to own list for pagination
      movieEither.fold((message) {
        emit(FailMovieState(message));
      }, (allMovieList) {
        this.allMovieList.addAll(allMovieList);
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
