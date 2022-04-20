import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared/states/theme_state.dart';

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier(ThemeState state) : super(state);
  void toggle() {
    state = state is DarkTheme ? LightTheme() : DarkTheme();
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) => ThemeNotifier(LightTheme()));
