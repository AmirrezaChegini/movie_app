abstract class AuthState {}

class InitAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class CompleteAuthState extends AuthState {}

class FailAuthState extends AuthState {
  final String errorMessage;
  FailAuthState(this.errorMessage);
}
