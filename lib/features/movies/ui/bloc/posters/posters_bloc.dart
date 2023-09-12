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

      //if genresId equals 0 fetch all poster
      if (event.genreID == 0) {
        var either = await _postersUsecase(page);

        either.fold((errorMessage) {
          emit(FailPostersState(errorMessage));
        }, (posterList) {
          this.posterList.addAll(posterList);
          emit(CompletePostersState(this.posterList, posterList.isNotEmpty));
        });
        ++page;
      } else {
        //if genresId not equal 0 fetch poster according to genreID
        var either =
            await _specificPosterUsecase(MovieParam(page, event.genreID));

        either.fold((errorMessage) {
          emit(FailPostersState(errorMessage));
        }, (posterList) {
          this.posterList.addAll(posterList);
          emit(CompletePostersState(posterList, posterList.isNotEmpty));
        });
        ++page;
      }
    });
  }
}
