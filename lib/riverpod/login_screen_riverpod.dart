import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/components/loading_button.dart';
import 'package:state_management/components/visibility_icon.dart';
import 'package:state_management/riverpod/loading_provider.dart';
import 'package:state_management/riverpod/theme_provider.dart';
import '../components/email_text_field.dart';
import '../components/password_text_field.dart';
import '../components/theme_button.dart';
import '../helper.dart';
import 'login_provider.dart';

class LoginPageRiverpod extends ConsumerWidget {
  @override
  Widget build(context, ref) {
    final themeState = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          ThemeButton(isDark: themeState.themeMode == ThemeMode.dark, onPressed: themeState.toggle),
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
              // EmailTextField(initialValue: controller.email, onChanged: controller.handleEmailChanged),
              const SizedBox(height: 20),
              // PasswordTextField(
              //   initialValue: controller.password,
              //   onChanged: controller.handlePasswordChanged,
              //   visible: controller.visiblePassword.value,
              //   toggleVisibility: controller.toggleVisibility,
              // ),
              const SizedBox(
                height: 40,
              ),
              // LoadingButton(
              //   isLoading: controller.isLoading.value,
              //   onPressed: controller.getHandleLogin(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
