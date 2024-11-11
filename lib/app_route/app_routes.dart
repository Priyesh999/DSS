part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const OTP = _Paths.OTP;
  static const REGISTER = _Paths.REGISTER;
  static const BOTTOM_NAVIGATION = _Paths.BOTTOM_NAVIGATION;

}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const BOTTOM_NAVIGATION = '/bootom';
  static const LOGIN = '/login';
  static const OTP = '/otp';
  static const REGISTER = '/register';

}
