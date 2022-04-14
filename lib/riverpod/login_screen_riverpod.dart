import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/riverpod/provider/auth_provider.dart';
import 'package:state_management/riverpod/provider/theme_provider.dart';
import 'package:state_management/shared/routes.dart';
import '../shared/components/email_text_field.dart';
import '../shared/components/loading_button.dart';
import '../shared/components/password_text_field.dart';
import '../shared/components/theme_button.dart';
import 'provider/login_provider.dart';

class LoginPageRiverpod extends ConsumerWidget {
  @override
  Widget build(context, ref) {
    final themeNotifier = ref.watch(themeProvider.notifier);
    final themeState = ref.watch(themeProvider);
    final loginNotifier = ref.watch(loginProvider.notifier);
    final loginState = ref.watch(loginProvider);

    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final passwordVisible = ref.watch(passwordVisibilityProvider);
    final authState = ref.watch(authProvider);

    if (authState is LoggedOut) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          actions: [
            ThemeButton(isDark: themeState.theme == ThemeMode.dark, onPressed: themeNotifier.toggle),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                EmailTextField(initialValue: email, onChanged: (value) => loginNotifier.handleInputChanged(email: value)),
                const SizedBox(height: 20),
                PasswordTextField(
                  initialValue: password,
                  onChanged: (value) => loginNotifier.handleInputChanged(password: value),
                  visible: passwordVisible,
                  toggleVisibility: loginNotifier.toggleVisibility,
                ),
                const SizedBox(
                  height: 40,
                ),
                LoadingButton(
                  isLoading: loginState is Loading,
                  onPressed: loginState is ValidInput ? loginNotifier.handleLogin : null,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.HOME);
      return CircularProgressIndicator();
    }
  }
}
