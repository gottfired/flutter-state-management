import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/helper.dart';
import 'package:state_management/riverpod/login_screen_riverpod.dart';
import 'package:state_management/riverpod/theme_provider.dart';

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(themeProvider.notifier).state.themeMode = isDarkMode(context) ? ThemeMode.dark : ThemeMode.light;
    final themeState = ref.watch(themeProvider);
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeState.themeMode,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPageRiverpod(),
      },
    );
  }
}
