import 'package:get/get.dart';

import '../modules/goals/bindings/goals_binding.dart';
import '../modules/goals/views/goals_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login-register/bindings/login_register_binding.dart';
import '../modules/login-register/views/login_register_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/welcome_page/bindings/welcome_page_binding.dart';
import '../modules/welcome_page/views/welcome_page_view.dart';

import '../widgets/splash_screen.dart'; // Tambahkan SplashScreen

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // Route awal (Initial Route)
  static const INITIAL = Routes.SPLASH_SCREEN; // Ubah ke SPLASH_SCREEN

  static final routes = [
    // Route SplashScreen
    GetPage(
      name: Routes.SPLASH_SCREEN, // Gunakan Routes.SPLASH_SCREEN
      page: () => const SplashScreen(),
    ),
    // Route Home
    GetPage(
      name: _Paths.HOME, // Gunakan Routes.HOME
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    // Route Welcome Page
    GetPage(
      name: Routes.WELCOME_PAGE, // Gunakan Routes.WELCOME_PAGE
      page: () => const WelcomePageView(),
      binding: WelcomePageBinding(),
    ),
    // Route Login-Register
    GetPage(
      name: Routes.LOGIN_REGISTER, // Gunakan Routes.LOGIN_REGISTER
      page: () => const LoginRegisterPage(),
      binding: LoginRegisterBinding(),
    ),
    // Route Login
    GetPage(
      name: Routes.LOGIN, // Gunakan Routes.LOGIN
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    // Route Register
    GetPage(
      name: Routes.REGISTER, // Gunakan Routes.REGISTER
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.GOALS,
      page: () => const GoalsView(),
      binding: GoalsBinding(),
    ),
  ];
}
