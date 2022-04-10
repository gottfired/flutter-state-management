import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/helper.dart';

import '../../repos/auth_repo.dart';
import '../../repos/theme_repo.dart';

class InfoPageGet extends StatelessWidget {
  final _auth = AuthRepo.instance;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_auth.userInfo!.email, style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 16),
          Text(formatDateTime(_auth.userInfo!.loginTime), style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _auth.logout,
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
