import 'package:dss_code/controller/apps/members/member_list_controller.dart';
import 'package:get/get.dart';

class MemberListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MemberListController>(()=>MemberListController());
  }

}