import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../repos/theme_repo.dart';

class ThemePage extends StatelessWidget {
  final _theme = ThemeRepo.instance;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => Text(_theme.isDark.value ? 'Dark Theme' : 'Light Theme', style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}
