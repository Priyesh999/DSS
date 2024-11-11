import 'package:get/get.dart';

import '../screen/bottom_nav_bar/bottom_nav_bar.dart';
import '../screen/bottom_nav_bar/bottom_nav_bar_binding.dart';
import '../screen/login/login_binding.dart';
import '../screen/login/login_view.dart';
import '../screen/otp/otp_binding.dart';
import '../screen/otp/otp_view.dart';
import '../screen/register/register_binding.dart';
import '../screen/register/register_view.dart';
import '../screen/splash/splash_binding.dart';
import '../screen/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: _Paths.BOTTOM_NAVIGATION,
      page: () => BottomNavBar(),
      binding: BottomNavBarBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
