abstract class AuthState {
  late final UserInfo? userInfo;
  AuthState(this.userInfo);
}

class LoggedIn extends AuthState {
  LoggedIn(UserInfo userInfo) : super(userInfo);
}

class LoggedOut extends AuthState {
  LoggedOut() : super(null);
}

class UserInfo {
  String email;
  DateTime loginTime;
  UserInfo({required this.email, required this.loginTime});
}
