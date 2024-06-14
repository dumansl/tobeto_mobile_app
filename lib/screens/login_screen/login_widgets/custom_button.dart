import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), //
        ),
        backgroundColor: TobetoColor.purple,
        elevation: 0,
        fixedSize: Size(
            ScreenUtil.getWidth(context), ScreenUtil.getHeight(context) * 0.07),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TobetoTextStyle.inter(context).captionWhiteSemiBold15,
      ),
    );
  }
}
