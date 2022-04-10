part of 'password_cubit.dart';

@immutable
abstract class PasswordState {}

class PasswordVisible extends PasswordState {}

class PasswordObscured extends PasswordState {}
