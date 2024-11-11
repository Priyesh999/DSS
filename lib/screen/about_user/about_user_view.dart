import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'about_user_controller.dart';

class AboutUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(AboutUserController());
    return SizedBox();
  }
}

class AboutUserState extends GetView<AboutUserController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
