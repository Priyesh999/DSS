// import 'package:dss/cbtsrc/screens/auth/register/register_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dss_code/screen/register/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../app_route/app_pages.dart';
import '../../utils/appImages.dart';
// import '../../../utils/app_images.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RegisterController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff3274AD),
        body: Column(children: [
          // to give space card from top
          const Expanded(flex: 2, child: SizedBox()),

          //page content
          Expanded(flex: 10, child: buildCard(size))
        ]));
  }

  Widget buildCard(Size size) {
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
                        left: 20, right: 20, top: 20, bottom: 20)
                    : const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 20)
                : const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              children: [
                Get.width > 1050
                    ? Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16)),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/cbt_icons/veryfy.jpg"),
                                    fit: BoxFit.contain))))
                    : SizedBox.shrink(),
                // SizedBox(width: 16),
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                      SizedBox(height: 16),
                      Center(
                          child: SizedBox(
                              width: Get.width > 500 ? 440 : null,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // logo(140, 240)
                                          Image.asset(AppImages.logo,
                                              height: size.height / 7),
                                          SizedBox(width: 12),
                                          // Image.asset(
                                          //     "assets/images/dsslogo.jpg",
                                          //     height: size.height / 7)
                                        ]),
                                    SizedBox(height: 10),
                                    Text('Name',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(height: size.height * 0.01),
                                    nameTextField(size),
                                    SizedBox(height: size.height * 0.02),
                                    Text('Class',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(height: size.height * 0.01),
                                    dropdownClass(),
                                    // classTextField(size),
                                    SizedBox(height: size.height * 0.02),
                                    Text('Email',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(height: size.height * 0.01),
                                    emailTextField(size),
                                    SizedBox(height: size.height * 0.02),
                                    Text(
                                      'Phone Number',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.01),
                                    phoneTextField(size),
                                    SizedBox(height: size.height * 0.02),
                                    Text(
                                      'Pincode',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.01),
                                    pincodeTextField(size),
                                    SizedBox(height: size.height * 0.02),
                                    signInButton(size),
                                    SizedBox(height: size.height * 0.02),

                                    //we can connect text
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                      //footer section
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: buildFooter(size),
                      )
                    ])))
              ],
            )));
  }

  Widget logo(double height_, double width_) {
    return Image.asset(
      AppImages.logo,
      height: height_,
      width: width_,
      fit: BoxFit.cover,
    );
  }

  Widget richText(double fontSize) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          color: const Color(0xFF21899C),
          letterSpacing: 2.000000061035156,
        ),
        children: const [
          TextSpan(
            text: 'LOGIN',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'PAGE',
            style: TextStyle(
              color: Color(0xFFFE9879),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

// email
  Widget emailTextField(Size size) {
    return SizedBox(
      height: size.height / 18,
      child: TextField(
        controller: controller.emailController.value,
        style: TextStyle(
          fontSize: 18.0,
          color: const Color(0xFF151624),
        ),
        maxLines: 1,
        keyboardType: TextInputType.text,
        cursorColor: const Color(0xFF151624),
        decoration: InputDecoration(
          hintText: 'Enter your Email address',
          hintStyle: TextStyle(
            fontSize: 16.0,
            color: const Color(0xFF151624).withOpacity(0.5),
          ),
          filled: true,
          fillColor: controller.emailController.value.text.isEmpty
              ? const Color.fromRGBO(248, 247, 251, 1)
              : Colors.transparent,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: controller.emailController.value.text.isEmpty
                    ? Colors.transparent
                    : Color(0xff3274AD),
                //const Color.fromRGBO(44, 185, 176, 1),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xff3274AD),
                // Color.fromRGBO(44, 185, 176, 1),
              )),
          prefixIcon: Icon(
            Icons.email_rounded,
            color: controller.emailController.value.text.isEmpty
                ? const Color(0xFF151624).withOpacity(0.5)
                : Color(0xff3274AD),
            // const Color.fromRGBO(44, 185, 176, 1),
            size: 16,
          ),
          suffix: Container(
            alignment: Alignment.center,
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: Color(0xff3274AD),
              // const Color.fromRGBO(44, 185, 176, 1),
            ),
            child: controller.emailController.value.text.isEmpty
                ? const Center()
                : const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 13,
                  ),
          ),
        ),
      ),
    );
  }

// name
  Widget nameTextField(Size size) {
    return SizedBox(
      height: size.height / 18,
      child: TextField(
        controller: controller.nameController.value,
        style: TextStyle(
          fontSize: 18.0,
          color: const Color(0xFF151624),
        ),
        maxLines: 1,
        keyboardType: TextInputType.text,
        cursorColor: const Color(0xFF151624),
        decoration: InputDecoration(
          hintText: 'Enter your Username',
          hintStyle: TextStyle(
            fontSize: 16.0,
            color: const Color(0xFF151624).withOpacity(0.5),
          ),
          filled: true,
          fillColor: controller.nameController.value.text.isEmpty
              ? const Color.fromRGBO(248, 247, 251, 1)
              : Colors.transparent,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: controller.nameController.value.text.isEmpty
                    ? Colors.transparent
                    : Color(0xff3274AD),
                // const Color.fromRGBO(44, 185, 176, 1),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xff3274AD),
                // Color.fromRGBO(44, 185, 176, 1),
              )),
          prefixIcon: Icon(
            Icons.person,
            color: controller.nameController.value.text.isEmpty
                ? const Color(0xFF151624).withOpacity(0.5)
                : Color(0xff3274AD),
            // const Color.fromRGBO(44, 185, 176, 1),
            size: 16,
          ),
          suffix: Container(
            alignment: Alignment.center,
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: Color(0xff3274AD),
              // const Color.fromRGBO(44, 185, 176, 1),
            ),
            child: controller.nameController.value.text.isEmpty
                ? const Center()
                : const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 13,
                  ),
          ),
        ),
      ),
    );
  }

// phone
  Widget phoneTextField(Size size) {
    return SizedBox(
      height: size.height / 18,
      child: TextField(
        controller: controller.phoneController.value,
        style: TextStyle(
          fontSize: 18.0,
          color: const Color(0xFF151624),
        ),
        maxLines: 1,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
          FilteringTextInputFormatter.digitsOnly
        ],
        cursorColor: const Color(0xFF151624),
        decoration: InputDecoration(
          hintText: 'Enter your phone number',
          hintStyle: TextStyle(
            fontSize: 16.0,
            color: const Color(0xFF151624).withOpacity(0.5),
          ),
          filled: true,
          fillColor: controller.phoneController.value.text.isEmpty
              ? const Color.fromRGBO(248, 247, 251, 1)
              : Colors.transparent,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: controller.phoneController.value.text.isEmpty
                    ? Colors.transparent
                    : Color(0xff3274AD),
                // const Color.fromRGBO(44, 185, 176, 1),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xff3274AD),
                // Color.fromRGBO(44, 185, 176, 1),
              )),
          prefixIcon: Icon(
            Icons.phone_android,
            color: controller.phoneController.value.text.isEmpty
                ? const Color(0xFF151624).withOpacity(0.5)
                : Color(0xff206CC2),
            // const Color.fromRGBO(44, 185, 176, 1),
            size: 16,
          ),
          suffix: Container(
            alignment: Alignment.center,
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: Color(0xff3274AD),
              // const Color.fromRGBO(44, 185, 176, 1),
            ),
            child: controller.phoneController.value.text.isEmpty
                ? const Center()
                : const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 13,
                  ),
          ),
        ),
      ),
    );
  }

  Widget pincodeTextField(Size size) {
    return SizedBox(
      height: size.height / 18,
      child: TextField(
        controller: controller.pincode.value,
        style: TextStyle(
          fontSize: 18.0,
          color: const Color(0xFF151624),
        ),
        maxLines: 1,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
          FilteringTextInputFormatter.digitsOnly
        ],
        cursorColor: const Color(0xFF151624),
        decoration: InputDecoration(
          hintText: 'Enter your pincode number',
          hintStyle: TextStyle(
            fontSize: 16.0,
            color: const Color(0xFF151624).withOpacity(0.5),
          ),
          filled: true,
          fillColor: controller.phoneController.value.text.isEmpty
              ? const Color.fromRGBO(248, 247, 251, 1)
              : Colors.transparent,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: controller.phoneController.value.text.isEmpty
                    ? Colors.transparent
                    : Color(0xff3274AD),
                // const Color.fromRGBO(44, 185, 176, 1),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xff3274AD),
                // Color.fromRGBO(44, 185, 176, 1),
              )),
          prefixIcon: Icon(
            Icons.phone_android,
            color: controller.phoneController.value.text.isEmpty
                ? const Color(0xFF151624).withOpacity(0.5)
                : Color(0xff3274AD),
            // const Color.fromRGBO(44, 185, 176, 1),
            size: 16,
          ),
          suffix: Container(
            alignment: Alignment.center,
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: Color(0xff3274AD),
              // const Color.fromRGBO(44, 185, 176, 1),
            ),
            child: controller.pincode.value.text.isEmpty
                ? const Center()
                : const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 13,
                  ),
          ),
        ),
      ),
    );
  }



//   Widget classTextField(Size size) {
//   return Obx(() => controller.isloading.value
//       ? SizedBox(child: Center(child: const CircularProgressIndicator()))
//       : Container(
//     decoration: const BoxDecoration(
//         color: Color.fromRGBO(248, 247, 251, 1),
//         borderRadius: BorderRadius.all(Radius.circular(8))),
//     child:
//
//     Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: DropdownButton<String>(
//         value: controller.chooseClass.value,
//         underline: SizedBox.shrink(),
//         isExpanded: true,
//         elevation: 16,
//         style: const TextStyle(color: Colors.black),
//         onChanged: (String? value) {
//           controller.chooseClass.value = value!;
//         },
//         items: controller.classList.value
//             .map<DropdownMenuItem<String>>((ClassModal value) {
//           return DropdownMenuItem<String>(
//             value: value.prName,
//             child: Text(value.prName!),
//           );
//         }).toList(),
//       ),
//     ),
//   ));
// }





  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;



  Widget dropdownClass(){
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xFF151624).withOpacity(0.5),
            ),
          ),
          items: items
              .map((String item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            // setState(() {
            //   selectedValue = value;
            // });
          },
          buttonStyleData:  ButtonStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              // color: Colors.blue,
              border: Border.all(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 48,
            width: double.maxFinite,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }



// password
  Widget passwordTextField(Size size) {
    return Obx(
      () => SizedBox(
          height: size.height / 18,
          child: TextField(
              controller: controller.passwordController.value,
              onChanged: (value) {
                // controller.checkPasswordCompatibilty(value);
              },
              style: TextStyle(
                fontSize: 18.0,
                color: const Color(0xFF151624),
              ),
              maxLines: 1,
              obscureText: controller.obsecureText.value,
              keyboardType: TextInputType.text,
              cursorColor: const Color(0xFF151624),
              decoration: InputDecoration(
                hintText: 'Enter your password',
                hintStyle: TextStyle(
                  fontSize: 16.0,
                  color: const Color(0xFF151624).withOpacity(0.5),
                ),
                filled: true,
                fillColor: controller.passwordController.value.text.isEmpty
                    ? const Color.fromRGBO(248, 247, 251, 1)
                    : Colors.transparent,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: controller.passwordController.value.text.isEmpty
                            ? Colors.transparent
                            : const Color.fromRGBO(44, 185, 176, 1))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(44, 185, 176, 1))),
                prefixIcon: Icon(Icons.password,
                    color: controller.passwordController.value.text.isEmpty
                        ? const Color(0xFF151624).withOpacity(0.5)
                        : const Color.fromRGBO(44, 185, 176, 1),
                    size: 16),
                suffix: InkWell(
                  // padding: EdgeInsetsDirectional.only(end: 12),
                  child: controller.obsecureText.value
                      ? const Icon(
                          Icons.visibility_off,
                          color: const Color.fromRGBO(44, 185, 176, 1),
                        )
                      : const Icon(
                          Icons.visibility,
                          color: const Color.fromRGBO(44, 185, 176, 1),
                        ),
                  onTap: () {
                    controller.obsecureText.value =
                        !controller.obsecureText.value;
                    controller.update();
                  },
                ),
                // Container(
                //     alignment: Alignment.center,
                //     width: 24.0,
                //     height: 24.0,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(100.0),
                //       color: const Color.fromRGBO(44, 185, 176, 1),
                //     ),
                //     child: controller.passwordController.value.text.isEmpty
                //         ? const Center()
                //         : const Icon(Icons.check,
                //             color: Colors.white, size: 13)
                // )
              ))),
    );
  }

// confirm password
  Widget confirmPasswordTextField(Size size) {
    return Obx(
      () => SizedBox(
        height: size.height / 18,
        child: TextField(
          controller: controller.confirmPasswordController.value,
          style: TextStyle(
            fontSize: 18.0,
            color: const Color(0xFF151624),
          ),
          maxLines: 1,
          obscureText: controller.obsecureTexts.value,
          keyboardType: TextInputType.text,
          cursorColor: const Color(0xFF151624),
          decoration: InputDecoration(
            hintText: 'Enter confirm password',
            hintStyle: TextStyle(
              fontSize: 16.0,
              color: const Color(0xFF151624).withOpacity(0.5),
            ),
            filled: true,
            fillColor: controller.confirmPasswordController.value.text.isEmpty
                ? const Color.fromRGBO(248, 247, 251, 1)
                : Colors.transparent,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: controller.confirmPasswordController.value.text.isEmpty
                      ? Colors.transparent
                      : const Color.fromRGBO(44, 185, 176, 1),
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(44, 185, 176, 1),
                )),
            prefixIcon: Icon(
              Icons.password,
              color: controller.confirmPasswordController.value.text.isEmpty
                  ? const Color(0xFF151624).withOpacity(0.5)
                  : const Color.fromRGBO(44, 185, 176, 1),
              size: 16,
            ),
            suffix: InkWell(
              // padding: EdgeInsetsDirectional.only(end: 12),
              child: controller.obsecureTexts.value
                  ? const Icon(
                      Icons.visibility_off,
                      color: const Color.fromRGBO(44, 185, 176, 1),
                    )
                  : const Icon(
                      Icons.visibility,
                      color: const Color.fromRGBO(44, 185, 176, 1),
                    ),
              onTap: () {
                controller.obsecureTexts.value =
                    !controller.obsecureTexts.value;
                controller.update();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget signInButton(Size size) {
    return // Group: Button
        InkWell(
            onTap: () {
              controller.registerUser();
            },
            child: Container(
                alignment: Alignment.center,
                height: size.height / 16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff3274AD),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF4C2E84).withOpacity(0.2),
                          offset: const Offset(0, 15.0),
                          blurRadius: 60.0)
                    ]),
                child: Text('Register',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 1.5),
                    textAlign: TextAlign.center)));
  }

  Widget buildFooter(Size size) {
    return Center(
        child: Column(children: <Widget>[
      //social logo: facebook, google & apple here
      SizedBox(
        height: size.height * 0.01,
      ),
      SizedBox(
          width: size.width * 0.6,
          height: 44.0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //facebook logo here
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
                    child: Image.asset(AppImages.help, width: 30, height: 30))
              ])),

      //footer text 'sign up' text here
      SizedBox(
        height: size.height * 0.01,
      ),
      InkWell(
          onTap: () => Get.offAllNamed(Routes.LOGIN),
          child: Text.rich(
              TextSpan(
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black,
                  ),
                  children: const [
                    TextSpan(
                      text: 'You have an Already account? ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                        text: 'Sign In here',
                        style: TextStyle(
                            color: Color(0xff3274AD),
                            fontWeight: FontWeight.w500))
                  ]),
              textAlign: TextAlign.center))
    ]));
  }
}
