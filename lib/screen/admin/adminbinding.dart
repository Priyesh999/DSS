import 'package:get/get.dart';
import 'package:dss_code/screen/admin/admincontroller.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class Adminbinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<Admincontroller>(()=>Admincontroller());
  }

}