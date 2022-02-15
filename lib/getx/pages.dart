import 'package:get/get.dart';
import 'package:state_management/getx/login_controller.dart';
import 'package:state_management/getx/login_screen_get.dart';
import 'package:state_management/getx/videoplayer_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreenGet(),
      binding: BindingsBuilder.put(() => LoginController()),
    ),
    GetPage(
      name: Routes.PLAYER,
      page: () => VideoPlayerPage(),
    ),
  ];
}

class Routes {
  Routes._();
  static const LOGIN = '/login';
  static const PLAYER = '/player';
}
