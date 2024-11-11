// import 'package:dss/cbtsrc/screens/auth/otp/otp_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../app_route/app_pages.dart';
import '../../utils/appImages.dart';
import 'otp_controller.dart';





class OtpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OtpViewState();
  }
}

class OtpViewState extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff3274AD),
        body: SingleChildScrollView(
            child: SizedBox(
                height: Get.height,
                child: Column(children: [
                  //to give space card from top
                  const Expanded(flex: 2, child: SizedBox.expand()),
                  //page content
                  Expanded(flex: 10, child: buildCard(size))
                ]))));
  }
}

Widget buildCard(size) {
  return Container(
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      color: Colors.white,
    ),
    child: Padding(
      padding: MediaQuery.of(Get.context!).size.width > 600
          ? MediaQuery.of(Get.context!).size.width > 800
              ? const EdgeInsets.only(
                  left: 20.0, right: 20, top: 20, bottom: 20)
              : const EdgeInsets.only(
                  left: 20.0, right: 20, top: 20, bottom: 20)
          : const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 20),
      child: Row(
        children: [
          Get.width > 1050
              ? Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                          image: DecorationImage(
                              image: AssetImage("assets/cbt_icons/otp.jpg"),
                              fit: BoxFit.fill))))
              : SizedBox.shrink(),
          // SizedBox(width: 16),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //build minimize icon
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 35,
                      height: 4.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey))),
              SizedBox(height: size.height * 0.02),
              //welcome text
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text('Let’s login for explore continues',
                  style: TextStyle(
                      fontSize: 14.0, color: const Color(0xFF969AA8))),
              SizedBox(height: size.height * 0.01),

              //logo section
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo(size.height / 4, size.height / 4),
                  // Image.asset(AppImages.log, height: size.height / 7),
                  SizedBox(width: 12),
                  Image.asset("assets/images/dsslogo.jpg",
                      height: size.height / 7)
                ],
              ),
              // SizedBox(
              //   height: size.height * 0.02,
              // ),
              // richText(24),
              // SizedBox(
              //   height: size.height * 0.03,
              // ),
              Center(
                  child: SizedBox(
                      width: Get.width > 500 ? 440 : null,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'please enter verification code ',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: size.height * 0.01),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: OtpTextField(
                                alignment: Alignment.centerLeft,
                                borderWidth: 1,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                // keyboardType: TextInputType.number,
                                numberOfFields: 4,
                                focusedBorderColor: Colors.cyan,
                                enabledBorderColor: Colors.black26,
                                fieldWidth: 43,
                                fieldHeight: 62,
                                showFieldAsBox: true,
                                //runs when a code is typed in
                                onCodeChanged: (String code) {
                                  // controller.otpFieldValue = code;
                                },
                                // runs when every textfield is filled
                                // onSubmit: (String verificationCode) {
                                // controller.otpFieldValue = verificationCode;
                                // if (!controller.isLoginProgress.value) {
                                // controller.verifyButton();
                                // }
                                // }, // end onSubmit
                              ),
                            ),
                            // phoneTextField(size),
                            SizedBox(height: size.height * 0.02),

                            // forgetPassword(size),
                            SizedBox(height: size.height * 0.03),
                            signInButton(size),
                            SizedBox(height: size.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Expanded(child: Divider()),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'We can Connect with',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: const Color(0xFF969AA8),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                const Expanded(child: Divider()),
                              ],
                            ),
                          ]))),
              //we can connect text

              //footer section
              buildFooter(size),
            ],
          )))
        ],
      ),
    ),
  );
}

Widget logo(double height_, double width_) {
  return Image.asset(
    AppImages.logo,
    height: height_,
    width: width_,
    fit: BoxFit.contain,
  );
}

Widget forgetPassword(size) {
  return SizedBox(
      height: size.height * 0.03,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        InkWell(
            // onTap: () => Get.toNamed(Routes.FORGETPASSWORD),
            child: Text.rich(
                TextSpan(
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: '',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                          text: 'Forget Password?',
                          style: TextStyle(
                            color: Color(0xFFFF7248),
                            fontWeight: FontWeight.w500,
                          ))
                    ]),
                textAlign: TextAlign.center))
      ]));
}

Widget signInButton(size) {
  return // Group: Button
      InkWell(
    onTap: () {
      // controller.loginUserTA();
      // Get.toNamed(Routes.OTP);

      Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
    },
    child: Container(
      alignment: Alignment.center,
      height: size.height / 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        // color: const Color(0xFF21899C),
        color: Color(0xff3274AD),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4C2E84).withOpacity(0.2),
            offset: const Offset(0, 15.0),
            blurRadius: 60.0,
          ),
        ],
      ),
      child: Text(
        'Verify Otp',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget buildFooter(size) {
  return Center(
    child: Column(
      children: <Widget>[
        //social logo: facebook, google & apple here
        SizedBox(height: size.height * 0.01),
        SizedBox(
          width: size.width * 0.6,
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // facebook logo here
              Container(
                alignment: Alignment.center,
                width: 44.0,
                height: 44.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: const Color.fromRGBO(246, 246, 246, 1)),
                child: Image.asset(
                  AppImages.fb,
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(width: 16),

              //google logo here
              Container(
                alignment: Alignment.center,
                width: 44.0,
                height: 44.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: const Color.fromRGBO(246, 246, 246, 1)),
                child: Image.asset(
                  AppImages.web,
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(width: 16),

              //apple logo here
              Container(
                alignment: Alignment.center,
                width: 44.0,
                height: 44.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: const Color.fromRGBO(246, 246, 246, 1)),
                child: Image.asset(
                  AppImages.help,
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
        ),

        //footer text 'sign up' text here
        SizedBox(
          height: size.height * 0.01,
        ),
        InkWell(
          onTap: () => Get.toNamed(Routes.REGISTER),
          child: Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: 'Don’t have an account? ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'Sign Up here',
                  style: TextStyle(
                    color: Color(0xff3274AD),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}

// Widget phoneTextField(Size size) {
//   return SizedBox(
//     height: size.height / 18,
//     child: TextField(
//       // controller: controller.phone.value,
//       style: TextStyle(
//         fontSize: 18.0,
//         color: const Color(0xFF151624),
//       ),
//       maxLines: 1,
//       keyboardType: TextInputType.number,
//       inputFormatters: [
//         LengthLimitingTextInputFormatter(10),
//         FilteringTextInputFormatter.digitsOnly
//       ],
//       cursorColor: const Color(0xFF151624),
//       decoration: InputDecoration(
//         hintText: 'Enter your phone number',
//         hintStyle: TextStyle(
//           fontSize: 16.0,
//           color: const Color(0xFF151624).withOpacity(0.5),
//         ),
//         filled: true,
//         fillColor: controller.phone.value.text.isEmpty
//             ? const Color.fromRGBO(248, 247, 251, 1)
//             : Colors.transparent,
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(
//               color: controller.phone.value.text.isEmpty
//                   ? Colors.transparent
//                   : const Color.fromRGBO(44, 185, 176, 1),
//             )),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(
//               color: Color.fromRGBO(44, 185, 176, 1),
//             )),
//         prefixIcon: Icon(
//           Icons.phone_android,
//           color: controller.phone.value.text.isEmpty
//               ? const Color(0xFF151624).withOpacity(0.5)
//               : const Color.fromRGBO(44, 185, 176, 1),
//           size: 16,
//         ),
//         suffix: Container(
//           alignment: Alignment.center,
//           width: 24.0,
//           height: 24.0,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(100.0),
//             color: const Color.fromRGBO(44, 185, 176, 1),
//           ),
//           child: controller.phone.value.text.isEmpty
//               ? const Center()
//               : const Icon(
//                   Icons.check,
//                   color: Colors.white,
//                   size: 13,
//                 ),
//         ),
//       ),
//     ),
//   );
// }



