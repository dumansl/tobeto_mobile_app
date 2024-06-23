import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

Widget communicationTextField(String hintText, int maxLines) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextField(
      style: TobetoTextStyle.poppins(context as BuildContext).captionGrayLightLight15,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: TobetoColor.purple, width: 2.0), // TOBETO mor rengi
        ),
      ),
    ),
  );
}
