import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/shared/helper.dart';

import '../../shared/routes.dart';
import '../../shared/states/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(LoggedOut());

  Future handleLogin(BuildContext context, {required String email, required String password}) async {
    final userInfo = await login(email: email, password: password);
    state = LoggedIn(userInfo);
    Navigator.of(context).pushReplacementNamed(Routes.HOME);
  }

  void handleLogout(BuildContext context) {
    state = LoggedOut();
    Navigator.of(context).pushReplacementNamed(Routes.LOGIN);
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());
