import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/pages/info_page_bloc.dart';
import 'package:state_management/bloc/pages/theme_page_bloc.dart';
import '../../shared/components/theme_button.dart';
import '../../shared/states/home_state.dart';
import '../../shared/states/theme_state.dart';
import '../business logic/cubit/home_cubit.dart';
import '../business logic/cubit/theme_cubit.dart';

class HomePageBloc extends StatelessWidget {
  Widget getPage(int index) {
    switch (index) {
      case 0:
        return InfoPageBloc();
      case 1:
        return ThemePageBloc();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Home Bloc'),
                actions: [
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      return ThemeButton(isDark: state is DarkTheme, onPressed: context.read<ThemeCubit>().toggle);
                    },
                  ),
                ],
              ),
              body: getPage(state.index),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.index,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.info),
                    label: 'Info',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.image),
                    label: 'Theme',
                  ),
                ],
                onTap: context.read<HomeCubit>().changePage,
              ));
        },
      ),
    );
  }
}
