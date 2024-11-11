import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CodebrightColor {
  static LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xFF06776A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Color primary = Color(0xFF068B7B);
  static Color primarySoft = Color(0xFF00796B);
  static Color primaryExtraSoft = Color(0xFFEFF3FC);
  static Color secondary = Color(0xFF1B1F24);
  static Color secondarySoft = Color(0xFF9D9D9D);
  static Color secondaryExtraSoft = Color(0xFFE9E9E9);
  static Color error = Color(0xFFD00E0E);
  static Color success = Color(0xFF16AE26);
  static Color warning = Color(0xFFEB8600);
  static Color white = Color(0xFFFFFFFF);
  static const Color fontColor = Color(0xFF311B1B);
  static const Color cbtGrey = Color(0xFFABA8A8);
  static const Color cbtPrimarColor = Color(0xFF00796B);
  static Color get borderSideColor => Colors.black26;

  static Color get borderSideFocusedColor => primary;
}
