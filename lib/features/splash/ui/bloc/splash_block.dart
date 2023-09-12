import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/error_handler/app_exceptions.dart';
import 'package:movie_app/features/splash/domain/usecases/check_token_usecase.dart';
import 'package:movie_app/features/splash/ui/bloc/splash_event.dart';
import 'package:movie_app/features/splash/ui/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckLogginUsecase _logginUsecase;

  SplashBloc(this._logginUsecase) : super(LoadingSplashState()) {
    on<CheckLoggedIn>((event, emit) async {
      emit(LoadingSplashState());
      await Future.delayed(const Duration(seconds: 1));

      var either = await _logginUsecase(null);

      // e: exception => we have an exception
      // r: right => everything is ok and user logged in
      either.fold((e) {
        if (e is FetchDataEx) {
          emit(NotConnectivityState(e.message));
        } else {
          emit(NotAuthorizedState());
        }
      }, (r) {
        emit(AuthorizedState());
      });
    });
  }
}
