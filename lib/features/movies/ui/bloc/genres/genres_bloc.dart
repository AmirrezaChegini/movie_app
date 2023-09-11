import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/domain/usecases/get_all_genres_usecase.dart';
import 'package:movie_app/features/movies/ui/bloc/genres/genres_event.dart';
import 'package:movie_app/features/movies/ui/bloc/genres/genres_state.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  final GetAllGenresUsecase _genresUsecase;

  GenresBloc(this._genresUsecase) : super(InitGenresState()) {
    on<GetGenresEvent>((event, emit) async {
      var either = await _genresUsecase(null);

      either.fold((l) {
        emit(InitGenresState());
      }, (genresList) {
        emit(CompletedGenresState(genresList));
      });
    });
  }
}
