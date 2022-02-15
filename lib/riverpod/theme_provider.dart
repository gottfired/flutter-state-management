import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
    print(isDarkMode);
  }
}

final themeProvider = ChangeNotifierProvider((ref) => ThemeNotifier());
