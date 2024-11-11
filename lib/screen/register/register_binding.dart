// import 'package:dss/cbtsrc/screens/auth/register/register_controller.dart';
import 'package:dss_code/screen/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }

}