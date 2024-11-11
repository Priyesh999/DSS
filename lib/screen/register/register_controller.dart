// import 'package:gyantantra/cbtsrc/app_route/app_pages.dart';
// import 'package:gyantantra/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
// import 'package:gyantantra/cbtsrc/screens/cbt_mobile/auth/register/registration_repo.dart';
// import 'package:gyantantra/cbtsrc/screens/cbt_mobile/auth/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cbt_helper/dailog/custom_alert_dialog.dart';
// import '../../../../cbt_data/cbt_db/cache/preference_handler.dart';
// import '../../../../constants/api_urls.dart';
// import '../../../cbt_api/cbt_api.dart';
// import '../../../cbt_helper/dailog/custom_alert_dialog.dart';
// import '../../../cbt_model/response.dart';
// import '../../../constants/api_urls.dart';
// import 'registration_model.dart';

class RegisterController extends GetxController {
  RxBool obsecureText = true.obs,
      loading = false.obs,
      obsecureTexts = true.obs;
  RxInt count = 0.obs;
  RxString passstrength = "".obs;

  // RxList<ClassModal> classList = List<ClassModal>.empty(growable: true).obs;

  RxBool isClick = false.obs;
  RxString countryCode = "🇮🇳".obs;
  RxString countryCodeS = "91".obs;
  Rx<TextEditingController> employeeName = TextEditingController().obs;
  Rx<TextEditingController> empEmail = TextEditingController().obs;
  Rx<TextEditingController> empPhone = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> pincode = TextEditingController().obs;

  // Rx<UserModel> checkUserData = UserModel().obs;

  RxString useremail = "".obs,
      uid = "".obs,
      username = "".obs,
      photourl = "".obs;

  @override
  void onInit() {
    super.onInit();
    // getClassList();
  }

  RxString chooseClass = "".obs;
  RxBool isloading = false.obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> classController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;

  var isAgent = true.obs;

  bool isValidEmail(String email) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$";
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  void validateEmail(BuildContext context) {
    String email = emailController.value.text;
    if (!isValidEmail(email)) {
      // Show Get.dialog if email is not valid
      Get.dialog(
        AlertDialog(
          title: Text("Invalid Email"),
          content: Text("Please enter a valid email address."),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  void toggleIsAgent(bool value) {
    isAgent.value = value;
  }

  Future<void> registerUser() async {
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



    if (nameController.value.text.isEmpty) {
      errorMessage("Please Enter Full Name");
      return;
    }
    if (!isValidEmail(emailController.value.text)) {
      validateEmail(Get.context!);
      return;
    }
    if (emailController.value.text.isEmpty) {
      errorMessage("Please Enter Email");
    }

    if (phoneController.value.text.isEmpty) {
      errorMessage("Please Enter Phone number");
      return;
    }
    if (phoneController.value.text.length < 10) {
      errorMessage("Please Enter 10 digit phone number");
      return;
    }

    if (passwordController.value.text.isEmpty) {
      errorMessage("Please Enter password");
      return;
    }
    if (passwordController.value.text.length < 8) {
      errorMessage("Please Enter minimum 8 digit Password");
      return;
    }
    if (confirmPasswordController.value.text.isEmpty) {
      errorMessage("Please Enter confirm password");
      return;
    }
    if (passwordController.value.text != confirmPasswordController.value.text) {
      errorMessage("Please enter same password");
      return;
    }
    // if (passstrength.value != "Strong") {
    //   showWeakPasswordDialog();
    //   return;
    // }

    //   int classID = 0;
    //   classList.value.forEach((index) {
    //     if (index.prName == chooseClass.value) {
    //       classID = index.prId!;
    //     }
    //   });
    //   Get.dialog(Container(
    //       color: Colors.black.withOpacity(.5),
    //       child: Center(
    //           child: Card(
    //               child: SizedBox(
    //                   height: 30,
    //                   width: 30,
    //                   child: Padding(
    //                       padding: const EdgeInsets.all(8.0),
    //                       child: CircularProgressIndicator()))))));
    //
    //   try {
    //     RegistrationRepo().userRegistration(
    //         data: {
    //           "PR_NAME": nameController.value.text,
    //           "PR_EMAIL": emailController.value.text,
    //           "PR_PHONE": phoneController.value.text,
    //           "PR_CLASS": classID.toInt(),
    //           "PR_PASSWORD": passwordController.value.text
    //         },
    //         urlStr: ApiUrls.registration,
    //         beforeSend: () {},
    //         onSuccess: (apiResponse) async {
    //           Get.back();
    //           if (apiResponse.isSuccess) {
    //             // Get.toNamed(Routes.LOGIN);
    //             await prefHandler
    //                 .setUserId(apiResponse.resObject!.prUserId!.toString());
    //             await prefHandler.setUserName(apiResponse.resObject!.prName!);
    //             await prefHandler.setUserImage("");
    //             await prefHandler.setMobile(apiResponse.resObject!.prPhone!);
    //             await prefHandler.setLoginToken(apiResponse.resObject!.prToken!);
    //             await prefHandler.setEmployeeCode(apiResponse.resObject!.prCode!);
    //             await prefHandler.setLanguage(apiResponse.resObject!.prLanguage!);
    //             await prefHandler
    //                 .setStudentIsVerified(apiResponse.resObject!.prIsVerified!);
    //             await prefHandler.setDesignationId(
    //                 apiResponse.resObject!.prDesignation!.prName.toString());
    //             if (GetPlatform.isWeb) {
    //               await prefHandler.setLogIn(true);
    //               Get.toNamed(Routes.SPLASH);
    //             } else {
    //               await prefHandler.setLogIn(true);
    //               Get.toNamed(Routes.SPLASH);
    //             }
    //           }
    //           else if (apiResponse.errorCause == "USER_ALREADY_EXISTS") {
    //             // User already exists
    //             errorMessage("This user is already registered. Please try logging in.");
    //           }
    //           else {
    //             errorMessage(apiResponse.errorCause);
    //             print(apiResponse.errorCause);
    //           }
    //         },
    //         onError: (error) {
    //           print('exception is $error');
    //           Get.back();
    //           loading.value = false;
    //           errorMessage(error);
    //         });
    //   } catch (e) {
    //     errorMessage(e.toString());
    //
    //     print("Error" + "Error because : ${e.toString()}");
    //   }
    // }

    // Future<void> getClassList() async {
    //   isloading.value = true;
    //   try {
    //     ClassListRepo().callApi(
    //         urlStr: ApiUrls.classList,
    //         beforeSend: () {},
    //         onSuccess: (data) {
    //           if (data.isSuccess) {
    //             classList.value = data.resObject!;
    //             isloading.value = false;
    //             chooseClass.value = classList.value[0].prName!;
    //           }
    //         },
    //         onError: (e) {});
    //   } catch (e) {}
    // }



    void showWeakPasswordDialog() {
      Get.dialog(
        AlertDialog(
          title: Text("Weak Password"),
          content: Text("Please enter a stronger password"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }

    checkPasswordCompatibilty(String password) {
      count.value = 0;
      if (password.contains(RegExp(r'[A-Z]'))) {
        count++;
      }
      if (password.contains(RegExp(r'[a-z]'))) {
        count++;
      }
      if (password.contains(RegExp(r'[0-9]'))) {
        count++;
      }
      if (count == 3) {
        passstrength.value = "Strong";
        color:
        Colors.green;
      } else if (count == 2) {
        passstrength.value = "Medium";
      }
      else if (count == 1) {
        passstrength.value = "Weak";
      }
      else {
        passstrength.value = "";
      }
    }
  }
}



// class ClassModal {
//   final int? prId;
//   final String? prName;
//
//   ClassModal({
//     this.prId,
//     this.prName,
//   });
//
//   factory ClassModal.fromJson(Map<String, dynamic> json) => ClassModal(
//     prId: json["PR_ID"],
//     prName: json["PR_NAME"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "PR_ID": prId,
//     "PR_NAME": prName,
//   };
// }
//
// class ClassListRepo {
//   List<ClassModal> classlist = List.empty(growable: true);
//
//   Future<void> callApi({
//     required String urlStr,
//     required Function() beforeSend,
//     required Function(ApiResponse<List<ClassModal>> posts) onSuccess,
//     required Function(dynamic error) onError,
//   }) async {
//     CbtRequest(url: urlStr, data: {}).postRequest(
//         beforeSend: () => {if (beforeSend != null) beforeSend()},
//         onSuccess: (data) {
//           try {
//             if (data["STATUS"] == "SUCCESS") {
//               data["DATA"].forEach((v) {
//                 classlist.add(ClassModal.fromJson(v));
//               });
//             }
//           } catch (e) {}
//           onSuccess(ApiResponse(
//               isSuccess: (data["STATUS"] == "SUCCESS"),
//               errorCause: data['MESSAGE'] ?? "",
//               resObject: classlist));
//         },
//         onError: onError);
//   }
// }
