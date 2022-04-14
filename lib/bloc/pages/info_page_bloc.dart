import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/helper.dart';
import '../../shared/routes.dart';
import '../business logic/bloc/auth/auth_bloc.dart';

class InfoPageBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.of(context).pushReplacementNamed(Routes.LOGIN);
          }
        },
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.userInfo.email, style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 16),
                Text(formatDateTime(state.userInfo.loginTime), style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<AuthBloc>().add(Logout()),
                  child: const Text('Logout'),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
