part of 'app_pages.dart';

abstract class Routes {
  static const HOME = '/home';
  static const WELCOME_PAGE = '/welcome-page';
  static const LOGIN_REGISTER = _Paths.LOGIN_REGISTER;
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
}

abstract class _Paths {
  static const HOME = '/home';
  static const WELCOME_PAGE = '/welcome-page';
  static const LOGIN_REGISTER = '/login-register';
  static const SPLASH_SCREEN = '/splash-screen';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
}
