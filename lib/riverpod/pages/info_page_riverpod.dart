import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/riverpod/provider/auth_provider.dart';
import 'package:state_management/shared/helper.dart';

class InfoPageRiverpod extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.watch(authProvider.notifier);
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
              onPressed: authNotifier.handleLogout,
              child: const Text('Logout'),
            ),
          ],
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
