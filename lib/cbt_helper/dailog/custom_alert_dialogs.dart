// // import 'package:gyantantra/cbtsrc/cbt_helpers/cbt_input/custom_input.dart';
// // import 'package:gyantantra/cbtsrc/cbt_helpers/dxwidget/dx_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../screens/widgets/codebright_text.dart';
// import '../../screens/widgets/styles/app_color.dart';
// import '../../screens/widgets/styles/text_style.dart';
// import '../../utils/app_color.dart';
// import '../cbt_input/custom_input.dart';
// // import '../../utils/app_color.dart';
//
// class CustomAlertDialog {
//   static confirmAdmin({
//     required String title,
//     required String message,
//     required void Function() onConfirm,
//     required void Function() onCancel,
//     required TextEditingController controller,
//   }) {
//     Get.defaultDialog(
//       title: "",
//       contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
//       radius: 8,
//       titlePadding: EdgeInsets.zero,
//       titleStyle: const TextStyle(fontSize: 0),
//       content: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TStyle.f14_B.styleWith(
//                     color: CodebrightColor.secondarySoft,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   message,
//                   style: TStyle.f14_R.styleWith(
//                     color: CodebrightColor.secondarySoft,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           CustomInput(
//             margin: const EdgeInsets.only(bottom: 24),
//             controller: controller,
//             label: 'password',
//             hint: '*************',
//             obsecureText: true,
//           ),
//           Container(
//             margin: const EdgeInsets.only(bottom: 16),
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 6,
//                   child: ElevatedButton(
//                     onPressed: onCancel,
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       backgroundColor: CodebrightColor.primaryExtraSoft,
//                       elevation: 0,
//                       // onPrimary: CodebrightColor.primary,
//                     ),
//                     child: Text(
//                       "cancel",
//                       style: TStyle.f14_R.styleWith(
//                         color: CodebrightColor.secondarySoft,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   flex: 6,
//                   child: ElevatedButton(
//                     onPressed: onConfirm,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: CodebrightColor.primary,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       elevation: 0,
//                     ),
//                     child: const Text("confirm"),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   static showPresenceAlert({
//     required String title,
//     required String message,
//     String confirmText = "Confirm",
//     String cancelText = "Cancel",
//     required void Function() onConfirm,
//     required void Function() onCancel,
//   }) {
//     Get.defaultDialog(
//       title: "",
//       contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
//       radius: 8,
//       titlePadding: EdgeInsets.zero,
//       titleStyle: const TextStyle(fontSize: 0),
//       content: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.only(bottom: 32, top: 24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CBTText(
//                   title,
//                   style: TStyle.f14_B.style,
//                 ),
//                 const SizedBox(height: 16),
//                 CBTText(
//                   message,
//                   style: TStyle.f12_R.style,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(bottom: 16),
//             child: Row(
//               children: [
//                 Visibility(
//                   visible: cancelText.isNotEmpty,
//                   child: Expanded(
//                     flex: 6,
//                     child: ElevatedButton(
//                       onPressed: onCancel,
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         backgroundColor: CodebrightColor.primaryExtraSoft,
//                         elevation: 0,
//                         // onPrimary: CodebrightColor.primary,
//                       ),
//                       child: Text(
//                         cancelText,
//                         style: TStyle.f14_R.styleWith(
//                           color: CodebrightColor.secondarySoft,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Visibility(
//                   visible: confirmText.isNotEmpty,
//                   child: Expanded(
//                     flex: 6,
//                     child: ElevatedButton(
//                       onPressed: onConfirm,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xffe88131),
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         elevation: 0,
//                       ),
//                       child: Text(confirmText,style: const TextStyle(color: Colors.white),),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   static showPresenceAlertLA({
//     required String title,
//     required String message,
//     String confirmText = "Ok",
//     String cancelText = "",
//     required void Function() onConfirm,
//     required void Function() onCancel,
//   }) {
//     Get.defaultDialog(
//       backgroundColor: Colors.white,
//       cancelTextColor: Colors.red,
//       confirmTextColor: Colors.white,
//       title: "",
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
//       radius: 8,
//       titlePadding: EdgeInsets.zero,
//       titleStyle: const TextStyle(fontSize: 0),
//       content: Column(
//         children: [
//           Container(
//             // color: Colors.white,
//             margin: const EdgeInsets.only(bottom: 20, top: 12),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CBTText(
//                   title,
//                   style: TStyle.f16_B.style,
//                 ),
//                 const SizedBox(height: 16),
//                 CBTText(
//                   message,
//                   style: TStyle.f14_R.styleWith(
//                       color: Colors.black, fontWeight: FontWeight.w600),
//                   maxLine: 10,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(bottom: 8, right: 8),
//             child: Row(
//               children: [
//                 const Expanded(child: SizedBox()),
//                 Visibility(
//                   visible: cancelText.isNotEmpty,
//                   child: InkWell(
//                     onTap: () => onCancel(),
//                     child: CBTText(
//                       cancelText,
//                       style: TStyle.f14_R.styleWith(
//                           color: Colors.black, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Visibility(
//                   visible: confirmText.isNotEmpty,
//                   child: InkWell(
//                       onTap: () => onConfirm(),
//                       child: CBTText(
//                         confirmText,
//                         style: TStyle.f14_R.styleWith(
//                             color: Colors.black, fontWeight: FontWeight.w500),
//                       )),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//
//
//
//   static showForceUpdateDialog({
//     required String title,
//     required String message,
//     String confirmText = "Update Now",
//     bool barrierDismissable = true,
//     required void Function() onConfirm,
//     required void Function() onCancel,
//   }) {
//     Get.defaultDialog(
//       backgroundColor: Colors.white,
//       title: "",
//       contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
//       radius: 8,
//       barrierDismissible: barrierDismissable,
//       titlePadding: EdgeInsets.zero,
//       titleStyle: const TextStyle(fontSize: 0),
//       content: Column(
//         children: [
//           Container(
//             color: Colors.transparent,
//             margin: const EdgeInsets.only(bottom: 32, top: 24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CBTText(
//                   title,
//                   style: TStyle.f20_B.style,
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   message,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       color: AppColor.secondarySoft, height: 150 / 100),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(bottom: 16),
//             child: Visibility(
//               visible: confirmText.isNotEmpty,
//               child: ElevatedButton(
//                 onPressed: onConfirm,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColor.primaryColor,
//                   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//                   elevation: 0,
//                 ),
//                 child: Text(
//                   confirmText,
//                   style: TStyle.f14_R.styleWith(color: Colors.white),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
