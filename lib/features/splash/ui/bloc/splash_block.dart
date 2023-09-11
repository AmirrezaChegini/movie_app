import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/splash/domain/usecases/chech_token_usecase.dart';
import 'package:movie_app/features/splash/domain/usecases/check_connectivity_usecase.dart';
import 'package:movie_app/features/splash/ui/bloc/splash_event.dart';
import 'package:movie_app/features/splash/ui/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckConnectivityUsecase _connectivityUsecase;
  final CheckTokenUsecase _tokenUsecase;

  SplashBloc(this._connectivityUsecase, this._tokenUsecase)
      : super(InitSplashState()) {
    on<CheckTokenEvent>((event, emit) async {
      emit(InitSplashState());
      await Future.delayed(const Duration(seconds: 1));

      //check internet connection
      bool connectivity = await _connectivityUsecase(null);

      if (connectivity) {
        //ckeck token
        var either = await _tokenUsecase(null);

        //l:left that means not exist token
        //r:right that means exist token
        either.fold((l) {
          emit(NotAuthorizedSplashState());
        }, (r) {
          emit(AuthorizedSplashState());
        });
      } else {
        emit(NotConnectivitySplashState('No Internet Connection'));
      }
    });
  }
}
