import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class ThemeState {
  ThemeMode themeMode = ThemeMode.light;
  void toggle() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }
}

final themeProvider = StateProvider<ThemeState>((ref) => ThemeState());
