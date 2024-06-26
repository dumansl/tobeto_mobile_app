import 'package:date_format_field/date_format_field.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomDateInput extends StatelessWidget {
  const CustomDateInput({
    super.key,
    required this.controller,
    required this.labelText,
  });

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return DateFormatField(
      addCalendar: false,
      controller: controller,
      decoration: InputDecoration(
        hintText: 'aa/gg/yyyy',
        hintStyle: TextStyle(color: TobetoColor.text.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(SizeRadius.radius10px)),
          borderSide: const BorderSide(color: TobetoColor.purple, width: 2.0),
        ),
        labelText: labelText,
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
      type: DateFormatType.type2,
      onComplete: (date) {
        debugPrint("$date");
      },
    );
  }
}
