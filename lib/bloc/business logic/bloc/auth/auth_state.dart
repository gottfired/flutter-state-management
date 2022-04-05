part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthInvalidInput extends AuthState {}

class AuthValidInput extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserInfo userInfo;

  AuthSuccess(this.userInfo);
}
