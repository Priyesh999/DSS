import 'package:get/get.dart';

import 'edit_profile_controller.dart';
class EditProfileBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(()=>EditProfileController());
  }

}