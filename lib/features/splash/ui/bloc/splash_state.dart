abstract class SplashState {}

class InitSplashState extends SplashState {}

class NotAuthorizedSplashState extends SplashState {}

class AuthorizedSplashState extends SplashState {}

class NotConnectivitySplashState extends SplashState {
  final String errorMessage;

  NotConnectivitySplashState(this.errorMessage);
}
