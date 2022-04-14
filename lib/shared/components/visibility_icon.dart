import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VisibilityIcon extends StatelessWidget {
  final bool visible;
  final void Function() toggleVisibility;

  VisibilityIcon({required this.visible, required this.toggleVisibility});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggleVisibility,
      child: Icon(visible ? Icons.visibility_off : Icons.visibility),
    );
  }
}
