import 'package:get/get.dart';

import '../modules/History/bindings/history_binding.dart';
import '../modules/History/views/history_view.dart';
import '../modules/Profile/bindings/profile_binding.dart';
import '../modules/Profile/views/profile_view.dart';
import '../modules/QR_Code/bindings/q_r_code_binding.dart';
import '../modules/QR_Code/views/q_r_code_view.dart';
import '../modules/bottom_navigation/bindings/bottom_navigation_binding.dart';
import '../modules/bottom_navigation/views/bottom_navigation_view.dart';
import '../modules/goals/bindings/goals_binding.dart';
import '../modules/goals/views/goals_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login-register/bindings/login_register_binding.dart';
import '../modules/login-register/views/login_register_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/lupa_pw/bindings/lupa_pw_binding.dart';
import '../modules/lupa_pw/views/lupa_pw_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/reset_pw/bindings/reset_pw_binding.dart';
import '../modules/reset_pw/views/reset_pw_view.dart';
import '../modules/welcome_page/bindings/welcome_page_binding.dart';
import '../modules/welcome_page/views/welcome_page_view.dart';

import '../widgets/splash_screen.dart'; // Tambahkan SplashScreen

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // Route awal (Initial Route)
  // ignore: constant_identifier_names
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
      page: () => GoalsView(),
      binding: GoalsBinding(),
    ),
    GetPage(
      name: Routes.BOTTOM_NAVIGATION,
      page: () => BottomNavigationView(),
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: _Paths.Q_R_CODE,
      page: () => const QRCodeView(),
      binding: QRCodeBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LUPA_PW,
      page: () => const LupaPwView(),
      binding: LupaPwBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PW,
      page: () => const ResetPwView(),
      binding: ResetPwBinding(),
    ),
  ];
}
