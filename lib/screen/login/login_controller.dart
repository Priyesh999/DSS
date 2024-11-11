import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../app_route/app_pages.dart';
import '../../cbt_helper/dailog/custom_alert_dialog.dart';

class LoginController extends GetxController{
  RxBool obsecureText = true.obs, loading = false.obs;


  Rx<TextEditingController> phone = TextEditingController().obs;
  // Rx<TextEditingController> password = TextEditingController().obs;

  errorMessage(String message) {
    CustomAlertDialog.showPresenceAlertL(
      title: "Alert",
      message: message,
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back();
      },
    );
  }

  Future<void> loginValidation() async {
    if (phone.value.text.isEmpty) {
      errorMessage("please enter number");
      return;
    }
    if (phone.value.text.length!= 10) {
      errorMessage("please enter valid number");
      return;
    }
    if (phone.value.text.length== 10) {
      Get.toNamed(Routes.OTP);
      return;
    }
  }
}
