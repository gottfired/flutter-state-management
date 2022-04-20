import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/states/theme_state.dart';

class ThemeRepo extends GetxController {
  static ThemeRepo instance = Get.find();

  final theme = Rx<ThemeState>(LightTheme());
  void toggleTheme() {
    theme.value = theme.value is LightTheme ? DarkTheme() : LightTheme();
    Get.changeThemeMode(theme.value.theme);
  }
}
