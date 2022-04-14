import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({Key? key,required this.isDark, this.onPressed}) : super(key: key);

  final void Function()? onPressed;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon:  Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      );
  }
}