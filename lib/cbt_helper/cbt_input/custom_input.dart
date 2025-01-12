// import 'package:dss/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:flutter/material.dart';

import '../widgets/styles/app_color.dart';
import '../widgets/styles/text_style.dart';

// import '../../screens/widgets/styles/app_color.dart';
// import '../../screens/widgets/styles/text_style.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool disabled;
  final EdgeInsetsGeometry margin;
  final bool obsecureText;
  final Widget? suffixIcon;

  CustomInput({
    required this.controller,
    required this.label,
    required this.hint,
    this.disabled = false,
    this.margin = const EdgeInsets.only(bottom: 16),
    this.obsecureText = false,
    this.suffixIcon,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    print("builded");
    return Material(
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 14, right: 14, top: 4),
        margin: widget.margin,
        decoration: BoxDecoration(
          color: (widget.disabled == false)
              ? Colors.transparent
              : CodebrightColor.primaryExtraSoft,
          borderRadius: BorderRadius.circular(8),
          border:
              Border.all(width: 1, color: CodebrightColor.secondaryExtraSoft),
        ),
        child: TextField(
          readOnly: widget.disabled,
          obscureText: widget.obsecureText,
          style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
          maxLines: 1,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon ?? SizedBox(),
            label: Text(
              widget.label,
              style:  TStyle.f14_S.styleWith(
                color: CodebrightColor.secondarySoft,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: TStyle.f14_S.styleWith(
              color: CodebrightColor.secondarySoft,
            ),
          ),
        ),
      ),
    );
  }
}
