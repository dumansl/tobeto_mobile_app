import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class InputTextFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final bool obscureText;
  final String hintText;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  const InputTextFormField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    this.suffixIcon,
    this.onSaved,
    this.validator,
    this.keyboardType,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: TobetoTextStyle.inter(context).captionGrayLightNormal15,
        contentPadding: EdgeInsets.symmetric(
          horizontal: ScreenPadding.padding16px,
          vertical: ScreenPadding
              .padding16px, // Yüksekliği artırmak için burayı değiştirin
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeRadius.radius8px),
          borderSide: BorderSide(
            color: TobetoColor.frame.lightGrey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeRadius.radius8px),
          borderSide: BorderSide(
            color: TobetoColor.frame.lightGrey,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeRadius.radius8px),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeRadius.radius8px),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
        ),
      ),
      style: TobetoTextStyle.inter(context).captionGrayLightNormal15,
      validator: validator,
    );
  }
}
