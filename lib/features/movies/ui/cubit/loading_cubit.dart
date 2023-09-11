import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingCubit extends Cubit<bool> {
  LoadingCubit() : super(false);

  // for show loading when scroll
  void showLoading(bool show) {
    emit(show);
  }
}
