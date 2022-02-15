import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/components/loading_button.dart';
import 'package:state_management/components/visibility_icon.dart';
import 'package:state_management/riverpod/loading_provider.dart';
import 'package:state_management/riverpod/theme_provider.dart';
import '../helper.dart';
import 'login_provider.dart';

class LoginScreenRiverpod extends ConsumerWidget {
  @override
  Widget build(context, ref) {
    final node = FocusScope.of(context);
    final themeState = ref.watch(themeProvider);
    final loginState = ref.watch(loginProvider);
    final loadingState = ref.watch(loadingProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Login'),
            IconButton(
              onPressed: () => themeState.toggleTheme(),
              icon: Icon(
                themeState.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.network(
                  'https://riverpod.dev/img/logo.png', //'https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_logo_full.png',
                  height: 100,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validateEmail,
                  initialValue: loginState.email,
                  onChanged: ref.read(loginProvider.notifier).onEmailChanged,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: node.nextFocus,
                  autocorrect: false,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: VisibilityIcon(
                        visible: loginState.passwordVisibile,
                        toggleVisibility:
                            ref.watch(loginProvider.notifier).toggleVisibility),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validatePassword,
                  initialValue: loginState.password,
                  onChanged: ref.read(loginProvider.notifier).onPasswordChanged,
                  obscureText: !loginState.passwordVisibile,
                  obscuringCharacter: '●',
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) =>
                      ref.read(loginProvider.notifier).onLogin(context),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LoadingButton(
                  onPressed: () =>
                      ref.read(loginProvider.notifier).onLogin(context),
                  child: Text('Login'),
                  isLoading: loadingState.isLoading,
                ),
              )
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
