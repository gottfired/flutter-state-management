import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/components/visibility_icon.dart';
import 'package:state_management/getx/login_controller.dart';
import 'package:state_management/getx/theme_controller.dart';

import '../helper.dart';

class LoginScreenGet extends GetView<LoginController> {
  @override
  Widget build(context) {
    final node = FocusScope.of(context);
    final themeRepo = ThemeRepo.instance;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Login'),
            IconButton(
              onPressed: () => themeRepo.toggleTheme(),
              icon: Obx(() => Icon(
                  themeRepo.isDark.value ? Icons.light_mode : Icons.dark_mode)),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                'https://blog.kakaocdn.net/dn/tTJsy/btraPuKSP5Y/34aELwuQ5eWBta1trRneU1/img.png', //'https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_logo_full.png',
                height: 100,
              ).paddingAll(10),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validateEmail,
                initialValue: controller.email,
                onChanged: controller.onEmailChanged,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onEditingComplete: node.nextFocus,
                autocorrect: false,
              ).paddingSymmetric(horizontal: 8.0),
              SizedBox(height: 20),
              Obx(
                () => TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: VisibilityIcon(
                        visible: controller.visiblePassword.value,
                        toggleVisibility: controller.toggleVisibility),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validatePassword,
                  initialValue: controller.password,
                  obscureText: !controller.visiblePassword.value,
                  obscuringCharacter: '●',
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => controller.onLogin(),
                ).paddingSymmetric(horizontal: 8),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: controller.onLogin,
                child: Text('Login'),
              ).paddingSymmetric(horizontal: 20)
            ],
          ),
        ),
      ),
    );
  }
}

// LoginScreen(
//   toggleDarkmodeButton: IconButton(
//     onPressed: () => themeRepo.toggleTheme(),
//     icon: Obx(() =>
//         Icon(themeRepo.isDark.value ? Icons.light_mode : Icons.dark_mode)),
//   ),
//   email: controller.email,
//   onEmailChanged: controller.onEmailChanged,
//   onLogin: (_) => controller.onLogin(),
//   passwordInputField: Obx(
//     () => TextFormField(
//       decoration: InputDecoration(
//         labelText: 'Password',
//         suffixIcon: VisibilityIcon(
//             visible: controller.visiblePassword.value,
//             toggleVisibility: controller.toggleVisibility),
//       ),
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       validator: validatePassword,
//       initialValue: controller.password,
//       obscureText: !controller.visiblePassword.value,
//       obscuringCharacter: '●',
//       textInputAction: TextInputAction.done,
//       onFieldSubmitted: (_) => controller.onLogin(),
//     ),
//   ),
// );
