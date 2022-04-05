import 'package:get/get.dart';

import '../../helper.dart';
import '../pages.dart';

class AuthRepo extends GetxController {
  static AuthRepo instance = Get.find();
  UserInfo? userInfo;

  Future<void> onLogin({required String email, required String password}) async {
    userInfo = await login(email: email, password: password);
    Get.offNamed(Routes.HOME);
  }

  void logout() {
    Get.offNamed(Routes.LOGIN);
  }
}
