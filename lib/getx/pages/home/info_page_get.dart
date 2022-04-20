import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/shared/helper.dart';
import 'package:state_management/shared/pages/loading_page.dart';
import 'package:state_management/shared/routes.dart';
import 'package:state_management/shared/states/auth_state.dart';
import '../../repos/auth_repo.dart';

class InfoPageGet extends StatelessWidget {
  final _authRepo = AuthRepo.instance;
  @override
  Widget build(BuildContext context) {
    final authState = _authRepo.authState.value;
    if (authState is LoggedIn) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(authState.userInfo.email, style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 16),
            Text(formatDateTime(authState.userInfo.loginTime), style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _authRepo.handleLogout();
                Get.offNamed(Routes.LOGIN);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      );
    } else {
      return const LoadingPage();
    }
  }
}
