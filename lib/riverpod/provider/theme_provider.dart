import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
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

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier(ThemeState state) : super(state);
  void toggle() {
    state = state is DarkTheme ? LightTheme() : DarkTheme();
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) => ThemeNotifier(LightTheme()));
