import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'com_emp_controller.dart';

class Com_emp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Get.put(Com_emp_Controller());
    return Com_empState();
  }

}

class Com_empState extends GetView<Com_emp_Controller>{
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }

}