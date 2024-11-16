

import '../../../cbt_helper/widgets/my_form_validator.dart';
import '../../my_controller.dart';

class EditProfileController extends MyController {
  MyFormValidator validation = MyFormValidator();
  bool showPassword = false;

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }
}
