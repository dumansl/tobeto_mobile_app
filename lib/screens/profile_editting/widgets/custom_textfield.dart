import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.keyboardType = TextInputType.text,
    required this.title,
    this.maxLength,
    this.maxLines,
    this.controller,
    this.iconButton,
    this.onFieldSubmitted,
    this.validator,
    this.focusNode,
    this.onSaved,
    this.readOnly = false,
  });

  final TextInputType keyboardType;
  final String title;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController? controller;
  final IconButton? iconButton;
  final Function(String)? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final void Function(String?)? onSaved;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly!,
      controller: controller,
      maxLines: maxLines,
      cursorColor: Theme.of(context).colorScheme.onSurface,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      maxLength: maxLength,
      style: TobetoTextStyle.poppins(context).bodyBlackBold16,
      decoration: InputDecoration(
        counterText: "",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(SizeRadius.radius10px)),
          borderSide: BorderSide(color: TobetoColor.purple, width: ScreenPadding.padding2px),
        ),
        labelText: title,
        labelStyle: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
        floatingLabelStyle: TobetoTextStyle.poppins(context).captionPurpleNormal18,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(SizeRadius.radius12px),
        )),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TobetoColor.background.transparent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(SizeRadius.radius10px)),
        ),
      ),
    );
  }
}
