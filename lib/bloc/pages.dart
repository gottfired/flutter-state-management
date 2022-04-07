import 'package:state_management/bloc/pages/home_page_bloc.dart';
import 'package:state_management/bloc/pages/login_page_bloc.dart';

class AppPages {
  static final routes = {
    Routes.LOGIN: (context) => LoginPageBloc(),
    Routes.HOME: (context) => HomePageBloc(),
  };
}

class Routes {
  static const LOGIN = '/login';
  static const HOME = '/home';
}
