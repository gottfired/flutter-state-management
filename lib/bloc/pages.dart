
class AppPages {
  static final routes = 
    {
      Routes.LOGIN: (context) => LoginPageGet(),
      Routes.HOME: (context) => HomePage(),
    };
}

class Routes {
  static const LOGIN = '/login';
  static const HOME = '/home';
}
