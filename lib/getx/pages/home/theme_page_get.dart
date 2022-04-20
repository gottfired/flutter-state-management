import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/states/theme_state.dart';
import '../../repos/theme_repo.dart';

class ThemePageGet extends StatelessWidget {
  final _themeRepo = ThemeRepo.instance;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => Text(_themeRepo.theme.value is DarkTheme ? 'Dark Theme' : 'Light Theme', style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}
