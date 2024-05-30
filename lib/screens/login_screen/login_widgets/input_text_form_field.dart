import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

import '../../../utils/constant/constants.dart';

class InputTextFormField extends StatelessWidget {
  // final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final Widget? suffixIcon;

  const InputTextFormField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    // required this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenPadding.padding16px,
        vertical: ScreenPadding.padding8px,
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeRadius.radius8px)),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextFormField(
        // controller: widget.controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
        style: TobetoTextStyle.inter.captionGrayLightNormal15,
      ),
    );
  }
}
