import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/account/domain/usecases/get_user_usecase.dart';
import 'package:movie_app/features/account/ui/bloc/user_event.dart';
import 'package:movie_app/features/account/ui/bloc/user_state.dart';

class Userbloc extends Bloc<UserEvnet, UserState> {
  final GetUserUsecase _userUsecase;

  Userbloc(this._userUsecase) : super(InitUserState()) {
    on<GetUserEvent>((event, emit) async {
      emit(LoadingUserState());
      var either = await _userUsecase(null);

      either.fold((errorMessage) {
        emit(FailUserState(errorMessage));
      }, (user) {
        emit(CompleteUserState(user));
      });
    });
  }
}
