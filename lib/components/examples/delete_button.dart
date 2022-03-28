import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Row(
          children: [Text('Delete'), Icon(Icons.delete)],
        ));
  }
}
