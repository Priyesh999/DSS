// import 'package:dss/cbtsrc/screens/auth/login/login_controller.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<LoginController>(()=>LoginController());
  }

}