import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordObscured());

  void toggle() {
    emit(state is PasswordVisible ? PasswordObscured() : PasswordVisible());
  }
}
