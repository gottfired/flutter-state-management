import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/components/email_text_field.dart';
import 'package:state_management/components/loading_button.dart';
import 'package:state_management/components/password_text_field.dart';
import 'package:state_management/components/theme_button.dart';
import '../business logic/bloc/auth/auth_bloc.dart';

class LoginPageBloc extends StatefulWidget {
  @override
  State<LoginPageBloc> createState() => _LoginPageBlocState();
}

class _LoginPageBlocState extends State<LoginPageBloc> {
  final _email = "";
  final _password = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          actions: [
            //ThemeButton(isDark: _theme.isDark.value, onPressed: _theme.toggleTheme),
          ],
        ),
        body: BlocConsumer<AuthBloc, AuthState>(listener: ((context, state) {
          if (state is AuthSuccess) {
            Navigator.of(context).pushReplacementNamed('/home');
          }
        }), builder: (context, state) {
          return SafeArea(
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
                  EmailTextField(
                      initialValue: _email,
                      onChanged: (value) {
                        BlocProvider.of<AuthBloc>(context).add(ChangeInput(email: _email, password: _password));
                      }),
                  const SizedBox(height: 20),
                  PasswordTextField(
                    initialValue: _password,
                    onChanged: (value) {
                      BlocProvider.of<AuthBloc>(context).add(ChangeInput(email: _email, password: _password));
                    },
                    visible: controller.visiblePassword.value,
                    toggleVisibility: controller.toggleVisibility,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  LoadingButton(
                    isLoading: controller.isLoading.value,
                    onPressed: controller.getHandleLogin(),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20),
            ),
          );
        }));
  }
}
