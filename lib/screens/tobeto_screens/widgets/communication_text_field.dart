import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

Widget communicationTextField(BuildContext context, String hintText, int maxLines) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: ScreenPadding.padding8px),
    child: TextField(
      style: TobetoTextStyle.poppins(context).captionGrayLightLight15,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
        ),
      ),
    ),
  );
}
