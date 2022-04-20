import 'package:get/get.dart';
import 'package:state_management/shared/states/home_state.dart';

class HomeController extends GetxController {
  final homeState = Rx<HomeState>(InfoPage());

  void changePage(int index) {
    homeState.value = index == 0 ? InfoPage() : ThemePage();
  }
}
