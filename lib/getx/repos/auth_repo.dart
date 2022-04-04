import 'package:get/get.dart';

import '../pages.dart';

class AuthRepo extends GetxController {
  static AuthRepo instance = Get.find();
  final isLoggedIn = false.obs;
  UserInfo? userInfo;

  Future<void> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
    userInfo = UserInfo(email: email, loginTime: DateTime.now());
    isLoggedIn.value = true;
    Get.offNamed(Routes.HOME);
  }

  void logout() {
    isLoggedIn.value = false;
    Get.offNamed(Routes.LOGIN);
  }
}

class UserInfo {
  String email;
  DateTime loginTime;
  UserInfo({required this.email, required this.loginTime});
}
