// // import 'package:dss/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
// // import 'package:dss/cbtsrc/screens/widgets/codebright_text.dart';
// // import 'package:dss/cbtsrc/screens/splash/splash_view.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../cbt_data/cbt_db/cache/preference_handler.dart';
// import '../../screens/splash/splash_view.dart';
// import '../../screens/widgets/codebright_text.dart';
//
// class LogoutDailog extends StatefulWidget {
//   _LogoutDailogState createState() => _LogoutDailogState();
// }
//
// class _LogoutDailogState extends State<LogoutDailog> {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//       //this right here
//       child: Container(
//         height: 150,
//         width: 250,
//         padding: EdgeInsets.all(15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             DxTextBlack(
//               "Logout Confirmation?",
//               mBold: true,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             DxTextBlack(
//               "Are you sure want to Logout?",
//               mBold: true,
//               mSize: 14,
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Expanded(
//                   child: Container(
//                     child: OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                           side: BorderSide(width: 0.6, color: Colors.redAccent),
//                           padding: EdgeInsets.only(
//                               left: 4, right: 4, top: 2, bottom: 2)),
//                       onPressed: () async {
//                         prefHandler.clearPref();
//                         // Navigator.pop(context);
//                         await prefHandler.setOtpVerify(false);
//                         await prefHandler.setInitiallySynced(false);
//                         // Navigator.pushAndRemoveUntil(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) => SplashView()),
//                         //     (route) => false);
//
//                         Navigator.pushAndRemoveUntil<void>(
//                           context,
//                           MaterialPageRoute<void>(
//                               builder: (BuildContext context) => SplashView()),
//                           ModalRoute.withName('/SplashView'),
//                         );
//                       },
//                       child: DxTextRed(
//                         "Yes",
//                         mBold: true,
//                       ),
//                     ),
//                     height: 35,
//                     width: 70,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Expanded(
//                   child: Container(
//                     child: OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                           side: BorderSide(width: 0.6, color: Colors.red),
//                           padding: EdgeInsets.only(
//                               left: 4, right: 4, top: 2, bottom: 2)),
//                       onPressed: () {
//                         Navigator.pop(context);
//                         // openScreenAsBottomToTop(
//                         //     context, BottomNavigationScreen());
//                       },
//                       child: DxTextRed(
//                         "No",
//                         mBold: true,
//                       ),
//                     ),
//                     height: 35,
//                     width: 70,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
