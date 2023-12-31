import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/params/login_param.dart';
import 'package:movie_app/core/params/register_param.dart';
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
      await Future.delayed(const Duration(seconds: 1));

      //no nedd to call, it call authmatically
      var either = await _registerUsecase(RegisterParam(
        event.name,
        event.email,
        event.password,
      ));

      //when fold an either we left and right
      // right it means we have correct data
      // left it means we have an error message

      either.fold((l) {
        emit(FailAuthState(l));
      }, (r) {
        emit(CompleteAuthState());
      });
    });

    on<LoginEvent>((event, emit) async {
      emit(LoadingAuthState());
      await Future.delayed(const Duration(seconds: 1));

      //no nedd to call, it call authmatically
      var either = await _loginUsecase(LoginParam(event.email, event.password));

      //when fold an either we left and right
      // right it means we have correct data
      // left it means we have an error message
      either.fold((l) {
        emit(FailAuthState(l));
      }, (r) {
        emit(CompleteAuthState());
      });
    });
  }
}
