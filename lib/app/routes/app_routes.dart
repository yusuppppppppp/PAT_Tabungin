part of 'app_pages.dart';

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const WELCOME_PAGE = _Paths.WELCOME_PAGE;
  static const LOGIN_REGISTER = _Paths.LOGIN_REGISTER;
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN; // Tambahkan SPLASH_SCREEN
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const GOALS = _Paths.GOALS;
}

abstract class _Paths {
  static const HOME = '/home';
  static const WELCOME_PAGE = '/welcome-page';
  static const LOGIN_REGISTER = '/login-register';
  static const SPLASH_SCREEN = '/splash-screen'; // Tambahkan SPLASH_SCREEN
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const GOALS = '/goals';
}
