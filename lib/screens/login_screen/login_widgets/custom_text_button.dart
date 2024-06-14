import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String textbold;
  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.textbold});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$text ",
              style: TobetoTextStyle.inter(context).captionGrayLightNormal15,
            ),
            TextSpan(
              text: textbold,
              style: TobetoTextStyle.inter(context).captionGrayDarkNormal15,
            ),
          ],
        ),
      ),
    );
  }
}
