import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/shared/helper.dart';

abstract class AuthState {}

class LoggedIn extends AuthState {
  final UserInfo userInfo;

  LoggedIn(this.userInfo);
}

class LoggedOut extends AuthState {}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(LoggedOut());

  Future handleLogin({required String email, required String password}) async {
    final userInfo = await login(email: email, password: password);
    state = LoggedIn(userInfo);
  }

  void handleLogout() {
    state = LoggedOut();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());
