import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:state_management/helper.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static final AuthBloc _instance = AuthBloc._();
  AuthBloc._() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is Login) {
        emit(AuthLoading());
        final UserInfo userInfo = await login(email: event.email, password: event.password);
        emit(AuthSuccess(userInfo));
      } else if (event is ChangeInput) {
        if (validateEmail(event.email) && validatePassword(event.password)) {
          emit(AuthValidInput());
        } else {
          emit(AuthInvalidInput());
        }
      } else if (event is Logout) {
        emit(AuthInitial());
      }
    });
  }
  static AuthBloc getInstance() => _instance;
}
