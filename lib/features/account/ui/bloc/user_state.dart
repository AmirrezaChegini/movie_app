import 'package:movie_app/features/account/domain/entity/user_entity.dart';

abstract class UserState {}

class InitUserState extends UserState {}

class LoadingUserState extends UserState {}

class CompleteUserState extends UserState {
  final UserEntity user;
  CompleteUserState(this.user);
}

class FailUserState extends UserState {
  final String errorMessage;
  FailUserState(this.errorMessage);
}
