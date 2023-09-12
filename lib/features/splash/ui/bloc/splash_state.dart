abstract class SplashState {}

class LoadingSplashState extends SplashState {}

class NotAuthorizedState extends SplashState {}

class AuthorizedState extends SplashState {}

class NotConnectivityState extends SplashState {
  final String errorMessage;

  NotConnectivityState(this.errorMessage);
}
