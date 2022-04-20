import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../shared/states/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(ThemeState initial) : super(initial);
  void toggle() => emit(state is DarkTheme ? LightTheme() : DarkTheme());
}
