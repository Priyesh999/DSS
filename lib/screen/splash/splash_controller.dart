import 'package:get/get.dart';

import '../../app_route/app_pages.dart';
import '../login/login_view.dart';

class SplashController extends GetxController{

  Future<void> navigateToView() async{
    Future.delayed(Duration(seconds: 3),(){
      // Get.off(() => LoginView());
      Get.toNamed(Routes.LOGIN);
    }

    );
  }

}