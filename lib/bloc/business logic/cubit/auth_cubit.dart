import 'package:bloc/bloc.dart';
import 'package:state_management/shared/helper.dart';

import '../../../shared/states/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoggedOut());
  Future<void> handleLogin({required String email, required String password}) async {
    final userInfo = await login(email: email, password: password);
    emit(LoggedIn(userInfo));
  }

  void handleLogout() {
    emit(LoggedOut());
  }
}
