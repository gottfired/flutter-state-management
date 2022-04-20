import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/shared/states/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(HomeState state) : super(state);
  void changePage(int index) => state = index == 0 ? InfoPage() : ThemePage();
}

final StateNotifierProvider<HomeNotifier, HomeState> homeProvider = StateNotifierProvider((_) => HomeNotifier(InfoPage()));
