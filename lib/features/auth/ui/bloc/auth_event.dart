import 'package:movie_app/core/params/login_param.dart';
import 'package:movie_app/core/params/register_param.dart';

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final RegisterParam param;
  RegisterEvent(this.param);
}

class LoginEvent extends AuthEvent {
  final LoginParam param;
  LoginEvent(this.param);
}
