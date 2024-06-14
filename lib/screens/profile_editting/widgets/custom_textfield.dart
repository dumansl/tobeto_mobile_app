import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.keyboardType = TextInputType.text,
    required this.title,
    this.maxLength,
    this.maxLines,
    required this.onSaved,
    required this.controller,
    this.iconButton,
  });

  final TextInputType keyboardType;
  final String title;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController controller;
  final dynamic Function(String?)? onSaved;
  final IconButton? iconButton;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      maxLines: maxLines,
      cursorColor: TobetoColor.card.grey,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      maxLength: maxLength,
      style: TobetoTextStyle.poppins.bodyBlackBold16,
      decoration: InputDecoration(
        counterText: "",
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
        ),
        labelText: title,
        labelStyle: TobetoTextStyle.poppins.bodyGrayLightNormal16,
        floatingLabelStyle: TobetoTextStyle.poppins.captionPurpleNormal18,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(12),
        )),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Lütfen adınızı girin';
        }
        return null;
      },
    );
  }
}
