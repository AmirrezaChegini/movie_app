import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/features/movies/domain/entity/poster_eintity.dart';
import 'package:movie_app/features/movies/domain/usecases/get_posters_usecase.dart';
import 'package:movie_app/features/movies/domain/usecases/get_spicific_poster_usecase.dart';
import 'package:movie_app/features/movies/ui/bloc/posters/posters_event.dart';
import 'package:movie_app/features/movies/ui/bloc/posters/posters_state.dart';

class PostersBloc extends Bloc<PostersEvent, PostersState> {
  final GetPostersUsecase _allMovieUsecase;
  final GetSpecificPosterUsecase _specificMovieUsecase;

  List<PosterEntity> allMovieList = [];
  List<int> genresId = [];
  int page = 1;

  PostersBloc(
    this._allMovieUsecase,
    this._specificMovieUsecase,
  ) : super(InitPostersState()) {
    on<GetPostersEvent>((event, emit) async {
      //for show loading in center of page
      if (allMovieList.isEmpty) {
        emit(LoadingPostersState());
      }

      //if genresId is empty we fetch all posters
      if (genresId.isEmpty) {
        var either = await _allMovieUsecase(page);

        either.fold((errorMessage) {
          emit(FailPostersState(errorMessage));
        }, (movieList) {
          allMovieList.addAll(movieList);
          emit(CompletePostersState(allMovieList));
        });
        ++page;
      } else {
        //if genresId not empty fetch posters according to genres
        var either = await _specificMovieUsecase(MovieParam(page, genresId));

        either.fold((errorMessage) {
          emit(FailPostersState(errorMessage));
        }, (movieList) {
          allMovieList.addAll(movieList);
          emit(CompletePostersState(allMovieList));
        });
        ++page;
      }
    });
  }
}
