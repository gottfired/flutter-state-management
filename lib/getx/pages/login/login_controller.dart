import 'package:get/get.dart';
import 'package:state_management/getx/repos/auth_repo.dart';
import 'package:state_management/shared/helper.dart';
import 'package:state_management/shared/states/login_states.dart';

import '../../../shared/routes.dart';

class LoginController extends GetxController {
  final AuthRepo _auth = AuthRepo.instance;
  String? email;
  String? password;

  final loginState = Rx<LoginState>(LoginInitial());

  final visiblePassword = false.obs;

  toggleVisibility() => visiblePassword.toggle();

  void handleEmailChanged(String? input) {
    email = input;
    validateInput();
  }

  void handlePasswordChanged(String? input) {
    password = input;
    validateInput();
  }

  void validateInput() {
    if (validateEmail(email) && validatePassword(password)) {
      loginState.value = ValidInput();
    } else {
      loginState.value = InvalidInput();
    }
  }

  void _handleLogin() async {
    loginState.value = Loading();
    await _auth.handleLogin(email: email!, password: password!);
    loginState.value = LoginInitial();
    Get.offNamed(Routes.HOME);
  }

  void Function()? getHandleLogin() {
    if (loginState.value is ValidInput) {
      return _handleLogin;
    }
    return null;
  }
}
