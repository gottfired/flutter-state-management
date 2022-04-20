import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/business%20logic/cubit/auth_cubit.dart';
import 'package:state_management/shared/pages/loading_page.dart';
import '../../shared/helper.dart';
import '../../shared/routes.dart';
import '../../shared/states/auth_state.dart';

class InfoPageBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoggedOut) {
            Navigator.of(context).pushReplacementNamed(Routes.LOGIN);
          }
        },
        builder: (context, state) {
          if (state is LoggedIn) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.userInfo.email, style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 16),
                Text(formatDateTime(state.userInfo.loginTime), style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<AuthCubit>().handleLogout(),
                  child: const Text('Logout'),
                ),
              ],
            );
          } else {
            return const LoadingPage();
          }
        },
      ),
    );
  }
}
