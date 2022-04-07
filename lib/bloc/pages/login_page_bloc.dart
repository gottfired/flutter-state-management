import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/business%20logic/cubit/password_cubit.dart';
import 'package:state_management/components/email_text_field.dart';
import 'package:state_management/components/loading_button.dart';
import 'package:state_management/components/password_text_field.dart';
import 'package:state_management/components/theme_button.dart';
import '../business logic/bloc/auth/auth_bloc.dart';
import '../business logic/bloc/theme/cubit/theme_cubit.dart';

class LoginPageBloc extends StatefulWidget {
  @override
  State<LoginPageBloc> createState() => _LoginPageBlocState();
}

class _LoginPageBlocState extends State<LoginPageBloc> {
  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
  }

  final _passwordCubit = PasswordCubit();

  @override
  Widget build(context) {
    return Scaffold(
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
      body: BlocConsumer<AuthBloc, AuthState>(listener: ((context, state) {
        if (state is AuthSuccess) {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      }), builder: (context, state) {
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
                    initialValue: _email,
                    onChanged: (value) {
                      _email = value;
                      context.read<AuthBloc>().add(ChangeInput(email: _email, password: _password));
                    }),
                const SizedBox(height: 20),
                BlocBuilder<PasswordCubit, PasswordState>(
                  bloc: _passwordCubit,
                  builder: (context, state) {
                    return PasswordTextField(
                      initialValue: _password,
                      onChanged: (value) {
                        _password = value;
                        context.read<AuthBloc>().add(ChangeInput(email: _email, password: _password));
                      },
                      visible: state is PasswordVisible,
                      toggleVisibility: () => _passwordCubit.toggle(),
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                LoadingButton(
                  isLoading: state is AuthLoading,
                  onPressed: state is AuthValidInput
                      ? () {
                          context.read<AuthBloc>().add(Login(email: _email, password: _password));
                        }
                      : null,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
