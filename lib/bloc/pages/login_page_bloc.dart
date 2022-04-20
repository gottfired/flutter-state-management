import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/business%20logic/cubit/auth_cubit.dart';
import 'package:state_management/bloc/business%20logic/cubit/login_cubit.dart';
import 'package:state_management/shared/components/email_text_field.dart';
import 'package:state_management/shared/components/loading_button.dart';
import 'package:state_management/shared/components/password_text_field.dart';
import 'package:state_management/shared/components/theme_button.dart';
import 'package:state_management/shared/routes.dart';
import '../../shared/states/auth_state.dart';
import '../../shared/states/login_states.dart';
import '../../shared/states/theme_state.dart';
import '../business logic/cubit/theme_cubit.dart';

class LoginPageBloc extends StatelessWidget {
  @override
  Widget build(context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Bloc'),
          actions: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return ThemeButton(isDark: state is DarkTheme, onPressed: context.read<ThemeCubit>().toggle);
              },
            ),
          ],
        ),
        body: BlocListener<AuthCubit, AuthState>(
          listener: ((context, state) {
            if (state is LoggedIn) {
              Navigator.of(context).pushReplacementNamed(Routes.HOME);
            }
          }),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              final loginCubit = context.read<LoginCubit>();
              final emailCubit = loginCubit.emailCubit;
              final passwordCubit = loginCubit.passwordCubit;
              final passwordVisibilityCubit = loginCubit.passwordVisibilityCubit;

              return SafeArea(
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
                      EmailTextField(
                        initialValue: emailCubit.state,
                        onChanged: (value) => loginCubit.handleInputChanged(email: value),
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<PasswordVisibilityCubit, bool>(
                        bloc: passwordVisibilityCubit,
                        builder: (context, state) {
                          return PasswordTextField(
                            initialValue: passwordCubit.state,
                            onChanged: (value) => loginCubit.handleInputChanged(password: value),
                            visible: state,
                            toggleVisibility: loginCubit.toggleVisibility,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      LoadingButton(
                        isLoading: state is Loading,
                        onPressed: state is ValidInput
                            ? () async {
                                await loginCubit.handleLogin(context);
                              }
                            : null,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
