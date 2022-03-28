import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:state_management/helper.dart';

import 'loading_provider.dart';

@immutable
class LoginState {
  const LoginState({this.email, this.password, required this.passwordVisibile});

  final String? password;
  final String? email;
  final bool passwordVisibile;

  LoginState copyWith(
      {String? email, String? password, bool? passwordVisibile}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        passwordVisibile: passwordVisibile ?? this.passwordVisibile);
  }
}

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(this.ref)
      : super(
          const LoginState(
              email: 'mail@domain.com',
              password: 'Password1',
              passwordVisibile: false),
        );

  final Ref ref;

  void toggleVisibility() {
    state = state.copyWith(passwordVisibile: !state.passwordVisibile);
  }

  void onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  void onLogin(BuildContext context) async {
    try {
      ref.read(loadingProvider).setLoading(true); //watch not working
      await mockLogin(email: state.email, password: state.password);
      Navigator.pushNamed(context, '/video');
      ref.watch(loadingProvider).setLoading(false);
    } catch (e) {}
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
    (ref) => LoginNotifier(ref));
