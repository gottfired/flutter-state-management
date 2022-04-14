import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/riverpod/pages.dart';
import 'package:state_management/shared/helper.dart';
import 'package:state_management/riverpod/login_screen_riverpod.dart';
import 'package:state_management/riverpod/provider/theme_provider.dart';
import 'package:state_management/shared/routes.dart';

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeState.theme,
      initialRoute: Routes.LOGIN,
      routes: AppPages.routes,
    );
  }
}
