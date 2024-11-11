// import 'package:dss/cbtsrc/cbt_helpers/cbt_input/custom_input.dart';
// import 'package:dss/cbtsrc/screens/widgets/codebright_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cbt_input/custom_input.dart';
import '../widgets/styles/app_color.dart';
import '../widgets/styles/text_style.dart';
//
// import '../../screens/widgets/codebright_text.dart';
// import '../../screens/widgets/styles/app_color.dart';
// import '../../screens/widgets/styles/text_style.dart';
// import '../cbt_input/custom_input.dart';

class CustomAlertDialog {
  static confirmAdmin({
    required String title,
    required String message,
    required void Function() onConfirm,
    required void Function() onCancel,
    required TextEditingController controller,
  }) {
    Get.defaultDialog(
      title: "",
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      radius: 8,
      titlePadding: EdgeInsets.zero,
      titleStyle: TextStyle(fontSize: 0),
      content: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TStyle.f14_B.styleWith(
                    color: CodebrightColor.secondarySoft,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  message,
                  style: TStyle.f14_R.styleWith(
                    color: CodebrightColor.secondarySoft,
                  ),
                ),
              ],
            ),
          ),
          CustomInput(
            margin: EdgeInsets.only(bottom: 24),
            controller: controller,
            label: 'password',
            hint: '*************',
            obsecureText: true,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                    onPressed: onCancel,
                    child: Text(
                      "cancel",
                      style: TStyle.f14_R.styleWith(
                        color: CodebrightColor.secondarySoft,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: CodebrightColor.primaryExtraSoft,
                      elevation: 0,
                      // onPrimary: CodebrightColor.primary,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    child: Text("confirm"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CodebrightColor.primary,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static showPresenceAlertL({
    required String title,
    required String message,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
    required void Function() onConfirm,
    required void Function() onCancel,
  }) {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      cancelTextColor: Colors.red,
      confirmTextColor: Colors.white,
      title: "",
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      radius: 8,
      titlePadding: EdgeInsets.zero,
      titleStyle: TextStyle(fontSize: 0),
      content: Column(
        children: [
          Container(
            // color: Colors.white,
            margin: EdgeInsets.only(bottom: 20, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ShephertzText(
                //   title,
                //   style: TStyle.f16_B.style,
                // ),
                // SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(message, style: TStyle.f14_R.styleWith(color: Colors.black, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(child: SizedBox()),
                Visibility(
                  visible: cancelText.isNotEmpty,
                  child: InkWell(
                    onTap: () => onCancel(),
                    child: Text(
                      cancelText,
                      style: TStyle.f14_R.styleWith(color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Visibility(
                  visible: confirmText.isNotEmpty,
                  child: InkWell(
                      onTap: () => onConfirm(),
                      child: Text(
                        confirmText,
                        style: TStyle.f14_R.styleWith(color: Colors.red, fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static showPresenceAlert({
    required String title,
    required String message,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
    required void Function() onConfirm,
    required void Function() onCancel,
  }) {
    Get.defaultDialog(
      title: "",
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      radius: 8,
      titlePadding: EdgeInsets.zero,
      titleStyle: TextStyle(fontSize: 0),
      content: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 32, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TStyle.f14_B.style,
                ),
                SizedBox(height: 16),
                Text(
                  message,
                  style: TStyle.f12_R.style,
                  // maxLine: 5,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Visibility(
                  visible: cancelText.isNotEmpty,
                  child: Expanded(
                    flex: 6,
                    child: ElevatedButton(
                      onPressed: onCancel,
                      child: Text(
                        cancelText,
                        style: TStyle.f14_R.styleWith(
                          color: CodebrightColor.secondarySoft,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: CodebrightColor.primaryExtraSoft,
                        elevation: 0,
                        // onPrimary: CodebrightColor.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Visibility(
                  visible: confirmText.isNotEmpty,
                  child: Expanded(
                    flex: 6,
                    child: ElevatedButton(
                      onPressed: onConfirm,
                      child: Text(confirmText,style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CodebrightColor.primary,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        elevation: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
