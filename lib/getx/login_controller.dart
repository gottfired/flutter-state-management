import 'package:get/get.dart';
import 'package:state_management/getx/pages.dart';

import '../helper.dart';

class LoginController extends GetxController {
  String? email;
  String? password;

  final visiblePassword = false.obs;

  toggleVisibility() => visiblePassword.toggle();

  void onEmailChanged(String? input) {
    final result = validateEmail(input);
    email = null;
    if (result == null) {
      email = input;
    }
  }

  void onLogin() {
    Get.toNamed(Routes.PLAYER);
  }
}
