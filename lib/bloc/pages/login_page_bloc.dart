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
import '../business logic/cubit/password/password_cubit.dart';
import '../business logic/cubit/theme/theme_cubit.dart';


class LoginPageBloc extends StatelessWidget {

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
      body: BlocListener<AuthCubit, AuthState>(listener: ((context, state) {
        if (state is LoggedIn) {
          Navigator.of(context).pushReplacementNamed(Routes.HOME);
        }
      }), child: 
         BlocBuilder<LoginCubit, LoginState>(
           builder: (context, state) {
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
                             initialValue: ,
                             onChanged: (value) {
                               _email = value;
                               _authBloc.add(ChangeInput(email: _email, password: _password));
                             }),
                         const SizedBox(height: 20),
                         BlocBuilder<PasswordCubit, PasswordState>(
                           bloc: _passwordCubit,
                           builder: (context, state) {
                             return PasswordTextField(
                               initialValue: _password,
                               onChanged: (value) {
                                 _password = value;
                                 _authBloc.add(ChangeInput(email: _email, password: _password));
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
                                   _authBloc.add(Login(email: _email, password: _password));
                                 }
                               : null,
                         ),
                       ],
                     ),
                   ),
                 );
           },
         );
      }),
    );
  }
}
