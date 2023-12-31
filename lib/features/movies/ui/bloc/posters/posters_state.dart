import 'package:movie_app/features/movies/domain/entity/poster_eintity.dart';

abstract class PostersState {}

class InitPostersState extends PostersState {}

class LoadingPostersState extends PostersState {}

class CompletePostersState extends PostersState {
  final List<PosterEntity> postersList;
  final bool showLoading;
  CompletePostersState(this.postersList, this.showLoading);
}

class FailPostersState extends PostersState {
  final String errorMessage;
  FailPostersState(this.errorMessage);
}
