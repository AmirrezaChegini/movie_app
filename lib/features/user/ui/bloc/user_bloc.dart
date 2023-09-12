import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/user/domain/usecases/get_user_usecase.dart';
import 'package:movie_app/features/user/domain/usecases/logout_user_usecase.dart';
import 'package:movie_app/features/user/ui/bloc/user_event.dart';
import 'package:movie_app/features/user/ui/bloc/user_state.dart';

class Userbloc extends Bloc<UserEvnet, UserState> {
  final GetUserUsecase _userUsecase;
  final LogoutUserUsecase _logoutUserUsecase;

  Userbloc(this._userUsecase, this._logoutUserUsecase)
      : super(InitUserState()) {
    on<GetUserEvent>((event, emit) async {
      emit(LoadingUserState());
      var either = await _userUsecase(null);

      either.fold((errorMessage) {
        emit(FailUserState(errorMessage));
      }, (user) {
        emit(CompleteUserState(user));
      });
    });

    on<LogoutUserEvent>((event, emit) async {
      await _logoutUserUsecase(null);
    });
  }
}
