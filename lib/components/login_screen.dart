import 'package:flutter/material.dart';
import 'package:state_management/components/visibility_icon.dart';

import '../helper.dart';

class LoginScreen extends StatelessWidget {
  final Widget toggleDarkmodeButton;
  final String? email;
  final void Function(String) onEmailChanged;
  final void Function(String) onLogin;
  final Widget passwordInputField;
  LoginScreen(
      {required this.toggleDarkmodeButton,
      this.email,
      required this.onEmailChanged,
      required this.onLogin,
      required this.passwordInputField});

  @override
  Widget build(context) {
    final node = FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Login'),
            toggleDarkmodeButton,
          ],
        ),
      ),

      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  'https://blog.kakaocdn.net/dn/tTJsy/btraPuKSP5Y/34aELwuQ5eWBta1trRneU1/img.png', //'https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_logo_full.png',
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validateEmail,
                    initialValue: email,
                    onChanged: onEmailChanged,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: node.nextFocus,
                    autocorrect: false,
                  ),
                ),
                SizedBox(height: 24),
                passwordInputField
              ],
            ),
          ),
        ),
      ),
    );
  }
}
