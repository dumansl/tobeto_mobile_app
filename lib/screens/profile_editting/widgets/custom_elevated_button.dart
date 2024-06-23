// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.text = 'Ekle',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), //
          ),
          backgroundColor: TobetoColor.purple,
          fixedSize: Size(ScreenUtil.getWidth(context), ScreenUtil.getHeight(context) * 0.07),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TobetoTextStyle.poppins(context).bodyWhiteBold16,
        ),
      ),
    );
  }
}
