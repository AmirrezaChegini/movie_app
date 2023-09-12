import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/domain/usecases/get_genres_usecase.dart';
import 'package:movie_app/features/movies/ui/bloc/genres/genres_event.dart';
import 'package:movie_app/features/movies/ui/bloc/genres/genres_state.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  final GetGenresUsecase _genresUsecase;

  GenresBloc(this._genresUsecase) : super(InitGenresState()) {
    on<GetGenresEvent>((event, emit) async {
      var either = await _genresUsecase(null);

      //l:left that means we have an error message
      //r:left that means we have genres list
      either.fold((l) {
        emit(InitGenresState());
      }, (r) {
        emit(CompletedGenresState(r));
      });
    });
  }
}
