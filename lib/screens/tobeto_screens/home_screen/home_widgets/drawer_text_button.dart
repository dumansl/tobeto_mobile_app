import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class DrawerTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const DrawerTextButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TobetoTextStyle.poppins(context).captionGrayBold18,
      ),
    );
  }
}
