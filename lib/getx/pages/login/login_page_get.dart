import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/shared/components/email_text_field.dart';
import 'package:state_management/shared/components/loading_button.dart';
import 'package:state_management/shared/components/password_text_field.dart';
import 'package:state_management/shared/components/theme_button.dart';
import 'package:state_management/getx/pages/login/login_controller.dart';
import '../../repos/theme_repo.dart';

class LoginPageGet extends GetView<LoginController> {
  @override
  Widget build(context) {
    final _theme = ThemeRepo.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          Obx(
            () => ThemeButton(isDark: _theme.isDark.value, onPressed: _theme.toggleTheme),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              EmailTextField(initialValue: controller.email, onChanged: controller.handleEmailChanged),
              const SizedBox(height: 20),
              Obx(
                () => PasswordTextField(
                  initialValue: controller.password,
                  onChanged: controller.handlePasswordChanged,
                  visible: controller.visiblePassword.value,
                  toggleVisibility: controller.toggleVisibility,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(
                () => LoadingButton(
                  isLoading: controller.isLoading.value,
                  onPressed: controller.getHandleLogin(),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 20),
        ),
      ),
    );
  }
}
