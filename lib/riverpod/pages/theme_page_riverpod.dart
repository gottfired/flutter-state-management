import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/riverpod/provider/theme_provider.dart';

import '../../shared/states/theme_state.dart';

class ThemePageRiverpod extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    return Center(
      child: Text(themeState is DarkTheme ? 'Dark Theme' : 'Light Theme', style: Theme.of(context).textTheme.headline6),
    );
  }
}
