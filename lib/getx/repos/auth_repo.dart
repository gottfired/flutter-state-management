import 'package:get/get.dart';
import 'package:state_management/shared/states/auth_state.dart';
import '../../shared/helper.dart';
import '../../shared/routes.dart';

class AuthRepo extends GetxController {
  static AuthRepo instance = Get.find();

  final authState = Rx<AuthState>(LoggedOut());

  Future<void> handleLogin({required String email, required String password}) async {
    final userInfo = await login(email: email, password: password);
    authState.value = LoggedIn(userInfo);
  }

  void handleLogout() {
    authState.value = LoggedOut();
  }
}
