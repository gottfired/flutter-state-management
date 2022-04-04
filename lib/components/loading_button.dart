import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isLoading;

  const LoadingButton({required this.isLoading, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading ? const Text('Loading...') : const Text('Login'),
    );
  }
}
