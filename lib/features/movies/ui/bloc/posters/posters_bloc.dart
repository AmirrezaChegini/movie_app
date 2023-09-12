import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/features/movies/domain/entity/poster_eintity.dart';
import 'package:movie_app/features/movies/domain/usecases/get_posters_usecase.dart';
import 'package:movie_app/features/movies/domain/usecases/get_spicific_poster_usecase.dart';
import 'package:movie_app/features/movies/ui/bloc/posters/posters_event.dart';
import 'package:movie_app/features/movies/ui/bloc/posters/posters_state.dart';

class PostersBloc extends Bloc<PostersEvent, PostersState> {
  final GetPostersUsecase _postersUsecase;
  final GetSpecificPosterUsecase _specificPosterUsecase;

  List<PosterEntity> posterList = [];
  List<int> genresId = [];
  int page = 1;

  PostersBloc(
    this._postersUsecase,
    this._specificPosterUsecase,
  ) : super(InitPostersState()) {
    on<GetPostersEvent>((event, emit) async {
      //for show loading in center of page
      if (posterList.isEmpty) {
        emit(LoadingPostersState());
      }

      //if genresId is empty we fetch all posters
      if (genresId.isEmpty) {
        var either = await _postersUsecase(page);

        either.fold((errorMessage) {
          emit(FailPostersState(errorMessage));
        }, (movieList) {
          posterList.addAll(movieList);
          emit(CompletePostersState(posterList));
        });
        ++page;
      } else {
        //if genresId not empty fetch posters according to genres
        var either = await _specificPosterUsecase(MovieParam(page, genresId));

        either.fold((errorMessage) {
          emit(FailPostersState(errorMessage));
        }, (movieList) {
          posterList.addAll(movieList);
          emit(CompletePostersState(posterList));
        });
        ++page;
      }
    });
  }
}
