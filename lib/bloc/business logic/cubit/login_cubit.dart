import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/business%20logic/cubit/auth_cubit.dart';
import '../../../shared/helper.dart';
import '../../../shared/states/login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final emailCubit = EmailCubit();
  final passwordCubit = PasswordCubit();
  final passwordVisibilityCubit = PasswordVisibilityCubit();
  void handleInputChanged({String? email, String? password}) {
    if (email != null) emailCubit.emit(email);
    if (password != null) passwordCubit.emit(password);

    if (validateEmail(emailCubit.state) && validatePassword(passwordCubit.state)) {
      emit(ValidInput());
    } else {
      emit(InvalidInput());
    }
  }

  Future<void> handleLogin(BuildContext context) async {
    emit(Loading());
    await context.read<AuthCubit>().handleLogin(email: emailCubit.state, password: passwordCubit.state);
    emit(LoginInitial());
  }

  void toggleVisibility() {
    passwordVisibilityCubit.emit(!passwordVisibilityCubit.state);
  }
}

class EmailCubit extends Cubit<String> {
  EmailCubit() : super("");
}

class PasswordCubit extends Cubit<String> {
  PasswordCubit() : super("");
}

class PasswordVisibilityCubit extends Cubit<bool> {
  PasswordVisibilityCubit() : super(false);
}
