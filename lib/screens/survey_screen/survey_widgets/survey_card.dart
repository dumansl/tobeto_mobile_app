import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class SurveyCard extends StatelessWidget {
  final String headline;
  final Color lineerColor1;
  final Color lineerColor2;
  final bool isThereButton;

  const SurveyCard({
    super.key,
    required this.headline,
    required this.lineerColor1,
    required this.lineerColor2,
    required this.isThereButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: ScreenPadding.padding16px,
          vertical: ScreenPadding.padding32px),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            lineerColor1.withOpacity(0.5),
            lineerColor2,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeRadius.radius30px),
          bottomRight: Radius.circular(SizeRadius.radius30px),
          topRight: Radius.circular(SizeRadius.radius30px),
        ),
      ),
      child: Column(
        children: [
          Text(
            headline,
            style: TobetoTextStyle.poppins(context).subtitleWhiteSemiBold20,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

ButtonStyle elevatedButtonStyle(BuildContext context) {
  return ElevatedButton.styleFrom(
    backgroundColor: TobetoColor.purple,
    textStyle: TobetoTextStyle.poppins(context).bodyWhiteBold16,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
  );
}
