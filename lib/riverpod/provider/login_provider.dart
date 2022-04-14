import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:state_management/shared/helper.dart';
import 'package:state_management/riverpod/provider/auth_provider.dart';

@immutable
abstract class LoginState {}

class Initial extends LoginState {}

class InvalidInput extends LoginState {}

class ValidInput extends LoginState {}

class Loading extends LoginState {}

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(this.ref) : super(Initial());

  final Ref ref;

  void handleInputChanged({String? email, String? password}) {
    if (email != null) ref.read(emailProvider.notifier).state = email;
    if (password != null) ref.read(passwordProvider.notifier).state = password;

    if (validateEmail(ref.read(emailProvider)) && validatePassword(ref.read(passwordProvider))) {
      state = ValidInput();
    } else {
      state = InvalidInput();
    }
  }

  void handleLogin() async {
    state = Loading();
    await ref.read(authProvider.notifier).handleLogin(email: ref.read(emailProvider), password: ref.read(emailProvider));
    state = Initial();
  }

  void toggleVisibility() {
    ref.read(passwordVisibilityProvider.notifier).state = !ref.read(passwordVisibilityProvider);
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) => LoginNotifier(ref));
final emailProvider = StateProvider<String>((_) => "");
final passwordProvider = StateProvider<String>((_) => "");
final passwordVisibilityProvider = StateProvider<bool>((_) => false);
