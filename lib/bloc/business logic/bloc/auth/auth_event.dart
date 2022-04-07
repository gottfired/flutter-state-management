part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Login extends AuthEvent {
  final String email;
  final String password;

  Login({required this.email, required this.password});
}

class Logout extends AuthEvent {}

class ChangeInput extends AuthEvent {
  final String email;
  final String password;

  ChangeInput({required this.email, required this.password});
}
