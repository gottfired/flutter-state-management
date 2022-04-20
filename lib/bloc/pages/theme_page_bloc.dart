import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/states/theme_state.dart';
import '../business logic/cubit/theme_cubit.dart';

class ThemePageBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Center(
          child: Text(state is DarkTheme ? 'Dark Theme' : 'Light Theme', style: Theme.of(context).textTheme.headline6),
        );
      },
    );
  }
}
