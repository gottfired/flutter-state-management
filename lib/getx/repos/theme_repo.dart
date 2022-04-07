import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeRepo extends GetxController {
  static ThemeRepo instance = Get.find();

  final isDark = false.obs;
  void toggleTheme() {
    isDark.value = !Get.isDarkMode;
    Get.changeThemeMode(!isDark.value ? ThemeMode.light : ThemeMode.dark);
  }
}
