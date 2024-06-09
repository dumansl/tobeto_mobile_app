import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomHeadlineText extends StatelessWidget {
  const CustomHeadlineText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      TobetoText.evaluationCard1Title,
      style: TobetoTextStyle.poppins.titlePurpleBold24,
    );
  }
}
