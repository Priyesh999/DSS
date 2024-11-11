import 'dart:math';

import 'package:flutter/cupertino.dart';

class AppColor {
  static LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xff3274AD)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Color primary = Color(0xff3274AD);
  static Color primary1 = Color(0xff438ccb);
  static Color primarySoft = Color(0xff5094d0);
  static Color primaryLight = Color(0xff3c81bd);
  static Color primaryLightq1 = Color(0xff4885b9);
  static Color primaryExtraSoft = Color(0xFFEFF3FC);
  static Color secondary = Color(0xff193248);
  static Color secondarySoft = Color(0xFF9D9D9D);
  static Color secondaryExtraSoft = Color(0xFFE9E9E9);
  static Color error = Color(0xFFD00E0E);
  static Color success = Color(0xFF16AE26);
  static Color warning = Color(0xFFEB8600);
  static Color white = Color(0xFFFFFFFF);

  static var headerL = Color(0xFFE0E0E0);

  static var textInput = Color(0XFFE0E0E0);
  static var textInputH = Color(0xFF27063B);

  static var textInputTitle = Color(0XFF303030);
  static var textInputTitleSub = Color(0XFF787878);

  static LinearGradient get primaryGradientLR => LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[AppColor.primary, AppColor.primary1]);

  static Color get bg => const Color(0xFF1D012F);

  static Color get primaryColor => const Color(0xff3274AD);

  static Color get primaryColorP => const Color(0xff3274AD);

  static Color get primaryColorD => const Color(0xff3274AD);

  static Color get primaryColorlight => const Color(0xff3274AD);

  static Color randomOpaqueColor({int color = 0xffffff}) =>
      Color((Random().nextInt(primaryColor.hashCode))).withOpacity(.8);

  static double get randomShimmerHeight => Random().nextInt(180) + 80;
}
