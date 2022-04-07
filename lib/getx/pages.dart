import 'package:get/get.dart';
import 'package:state_management/getx/pages/home/home_controller.dart';
import 'package:state_management/getx/pages/home/home_page_get.dart';
import 'package:state_management/getx/pages/login/login_controller.dart';
import 'package:state_management/getx/pages/login/login_page_get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPageGet(),
      binding: BindingsBuilder.put(() => LoginController()),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePageGet(),
      binding: BindingsBuilder.put(() => HomeController()),
    ),
  ];
}

class Routes {
  static const LOGIN = '/login';
  static const HOME = '/home';
}
