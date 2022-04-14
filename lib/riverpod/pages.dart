import 'package:state_management/riverpod/login_screen_riverpod.dart';

import '../shared/routes.dart';
import 'home_page_riverpod.dart';

class AppPages {
  static final routes = {
    Routes.LOGIN: (context) => LoginPageRiverpod(),
    Routes.HOME: (context) => HomePageRiverpod(),
  };
}
