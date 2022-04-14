import 'package:flutter/material.dart';

import 'visibility_icon.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.visible,
    required this.toggleVisibility,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  final bool visible;
  final void Function() toggleVisibility;
  final void Function(String)? onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: VisibilityIcon(visible: visible, toggleVisibility: toggleVisibility),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: initialValue,
      onChanged: onChanged,
      obscureText: !visible,
    );
  }
}