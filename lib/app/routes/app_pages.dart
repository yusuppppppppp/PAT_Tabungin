import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login-register/bindings/login_register_binding.dart';
import '../modules/login-register/views/login_register_view.dart';
import '../widgets/splash_screen.dart';
import '../widgets/splash_screen.dart';
import '../modules/welcome_page/bindings/welcome_page_binding.dart';
import '../modules/welcome_page/views/welcome_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(), // Hapus `const` jika widget bukan const
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME_PAGE,
      page: () => WelcomePageView(), // Hapus `const` jika widget bukan const
      binding: WelcomePageBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_REGISTER,
      page: () => LoginRegisterPage(),
      binding: LoginRegisterBinding(),
    ),
  ];
}
