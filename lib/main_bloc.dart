import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/business%20logic/bloc/auth/auth_bloc.dart';
import 'package:state_management/shared/helper.dart';
import 'bloc/business logic/cubit/theme/theme_cubit.dart';
import 'bloc/pages.dart';
import 'shared/routes.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(isDarkMode(context) ? DarkTheme() : LightTheme()),
        ),
        BlocProvider(
          create: (context) => AuthBloc.getInstance(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state.theme,
            initialRoute: Routes.LOGIN,
            routes: AppPages.routes,
          );
        },
      ),
    );
  }
}
