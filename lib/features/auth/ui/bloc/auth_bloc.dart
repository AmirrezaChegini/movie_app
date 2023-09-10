import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:movie_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:movie_app/features/auth/ui/bloc/auth_event.dart';
import 'package:movie_app/features/auth/ui/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUsecase _registerUsecase;
  final LoginUsecase _loginUsecase;

  AuthBloc(this._registerUsecase, this._loginUsecase) : super(InitAuthState()) {
    on<RegisterEvent>((event, emit) async {
      emit(LoadingAuthState());

      //no nedd to call, it call authmatically
      var either = await _registerUsecase(event.param);

      //when fold an either we seperate error response with correct response;

      either.fold((l) {
        emit(FailAuthState(l));
      }, (r) {
        emit(CompleteAuthState());
      });
    });

    on<LoginEvent>((event, emit) async {
      emit(LoadingAuthState());

      //no nedd to call, it call authmatically
      var either = await _loginUsecase(event.param);

      //when fold an either we seperate error response with correct response;
      either.fold((l) {
        emit(FailAuthState(l));
      }, (r) {
        emit(CompleteAuthState());
      });
    });
  }
}
