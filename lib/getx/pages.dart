import 'package:get/get.dart';
import 'package:state_management/getx/login_controller.dart';
import 'package:state_management/getx/login_screen_get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreenGet(),
      binding: BindingsBuilder.put(() => LoginController()),
    ),
  ];
}

class Routes {
  Routes._();
  static const LOGIN = '/login';
  static const PLAYER = '/player';
}
