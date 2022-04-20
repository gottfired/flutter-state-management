import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:state_management/shared/helper.dart';
import 'package:state_management/riverpod/provider/auth_provider.dart';
import '../../shared/states/login_states.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(this.ref) : super(ValidInput());

  final Ref ref;
  final emailProvider = StateProvider<String>((_) => "jan@mail.at");
  final passwordProvider = StateProvider<String>((_) => "aaa");
  final passwordVisibilityProvider = StateProvider<bool>((_) => false);

  void handleInputChanged({String? email, String? password}) {
    if (email != null) ref.read(emailProvider.notifier).state = email;
    if (password != null) ref.read(passwordProvider.notifier).state = password;

    if (validateEmail(ref.read(emailProvider)) && validatePassword(ref.read(passwordProvider))) {
      state = ValidInput();
    } else {
      state = InvalidInput();
    }
  }

  Future<void> handleLogin(BuildContext context) async {
    state = Loading();
    await ref.read(authProvider.notifier).handleLogin(context, email: ref.read(emailProvider), password: ref.read(emailProvider));
  }

  void toggleVisibility() {
    ref.read(passwordVisibilityProvider.notifier).state = !ref.read(passwordVisibilityProvider);
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  ref.watch(authProvider);
  return LoginNotifier(ref);
});
