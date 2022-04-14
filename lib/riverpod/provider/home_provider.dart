import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/bloc/business%20logic/cubit/home/home_cubit.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(HomeState state) : super(state);
  void changePage(int index) => state = index == 0 ? InfoPage() : ThemePage();
}

final StateNotifierProvider<HomeNotifier, HomeState> homeProvider = StateNotifierProvider((_) => HomeNotifier(InfoPage()));
