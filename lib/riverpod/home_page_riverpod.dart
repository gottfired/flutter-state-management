import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/riverpod/provider/home_provider.dart';
import 'package:state_management/riverpod/provider/theme_provider.dart';
import 'package:state_management/riverpod/theme_page_riverpod.dart';
import '../../../shared/components/theme_button.dart';
import 'info_page_riverpod.dart';

class HomePageRiverpod extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    final themeNotifer = ref.watch(themeProvider.notifier);
    final homeState = ref.watch(homeProvider);
    final homeNotifier = ref.watch(homeProvider.notifier);
    Widget getPage() {
      switch (homeState.index) {
        case 0:
          return InfoPageRiverpod();
        case 1:
          return ThemePageRiverpod();
        default:
          return InfoPageRiverpod();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          ThemeButton(isDark: themeState is DarkTheme, onPressed: themeNotifer.toggle),
        ],
      ),
      body: getPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeState.index,
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
        onTap: (index) => homeNotifier.changePage(index),
      ),
    );
  }
}
