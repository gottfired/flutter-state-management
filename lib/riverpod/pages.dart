import 'package:state_management/riverpod/pages/home_page_riverpod.dart';
import 'package:state_management/riverpod/pages/login_page_riverpod.dart';
import '../shared/routes.dart';

class AppPages {
  static final routes = {
    Routes.LOGIN: (context) => LoginPageRiverpod(),
    Routes.HOME: (context) => HomePageRiverpod(),
  };
}
