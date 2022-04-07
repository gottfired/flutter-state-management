import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/business%20logic/bloc/home/home_cubit.dart';
import 'package:state_management/bloc/pages/info_page_bloc.dart';
import 'package:state_management/bloc/pages/theme_page_bloc.dart';

import '../../components/theme_button.dart';
import '../business logic/bloc/theme/cubit/theme_cubit.dart';

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

  final home = HomeCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: home,
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
              onTap: home.changePage,
            ));
      },
    );
  }
}
