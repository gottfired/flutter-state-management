import 'package:flutter/material.dart';

abstract class ThemeState {
  late final ThemeMode theme;
}

class DarkTheme extends ThemeState {
  DarkTheme() {
    theme = ThemeMode.dark;
  }
}

class LightTheme extends ThemeState {
  LightTheme() {
    theme = ThemeMode.light;
  }
}
