import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/getx/pages.dart';
import 'package:state_management/getx/theme_controller.dart';

void main() {
  Get.put(ThemeRepo());
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
