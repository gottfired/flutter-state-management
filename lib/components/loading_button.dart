import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final void Function() onPressed;
  final bool isLoading;
  final Widget child;

  LoadingButton(
      {required this.isLoading, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading ? Text('Loading...') : child,
    );
  }
}
