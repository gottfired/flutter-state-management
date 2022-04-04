import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/getx/pages.dart';
import 'package:state_management/getx/repos/auth_repo.dart';
import 'getx/repos/theme_repo.dart';

void main() {
  Get.put(ThemeRepo(), permanent: true);
  Get.put(AuthRepo(), permanent: true);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      getPages: AppPages.routes,
      initialRoute: Routes.LOGIN,
    );
  }
}
