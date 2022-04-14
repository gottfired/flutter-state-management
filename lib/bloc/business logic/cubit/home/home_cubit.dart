import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '../../../../shared/states/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InfoPage());
  void changePage(int index) => emit(index == 0 ? InfoPage() : ThemePage());
}
