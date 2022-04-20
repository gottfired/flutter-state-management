import '../helper.dart';

abstract class AuthState {}

class LoggedIn extends AuthState {
  final UserInfo userInfo;

  LoggedIn(this.userInfo);
}

class LoggedOut extends AuthState {}
