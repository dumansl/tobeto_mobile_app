import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

import '../../../utils/constant/constants.dart';

class InputTextFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final bool obscureText;
  final String hintText;
  final Widget? suffixIcon;
  final void Function(String?)? onSave;
  final FormFieldValidator<String>? validator;

  const InputTextFormField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    this.suffixIcon,
    this.onSave,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenPadding.padding16px,
        vertical: ScreenPadding.padding8px,
      ),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
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
        onSaved: onSave,
        obscureText: obscureText,
        keyboardType: keyboardType,
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
