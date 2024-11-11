import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../cbt_helper/widgets/styles/text_style.dart';

class CBTText extends StatelessWidget {
  String mTitle;
  TextAlign? textAlign;
  TextOverflow overflow;
  TextStyle? style;
  int? maxLine;
  bool mBold;
  double mSize;
  Color? color;
  bool? isBlink;

  CBTText(this.mTitle,
      {this.textAlign,
        this.maxLine = 1,
        this.mBold = false,
        this.mSize = 14,
        this.color,
        this.overflow = TextOverflow.ellipsis,
        this.style});

  Rx<bool> _show = false.obs;


  @override
  void initState() {


    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(mTitle,
        maxLines: maxLine,
        textAlign: textAlign,
        style: style == null ? TStyle.f14_M.style : style);
  }
}