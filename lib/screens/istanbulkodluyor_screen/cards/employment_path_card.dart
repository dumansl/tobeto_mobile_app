import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class EmploymentPathCard extends StatelessWidget {
  const EmploymentPathCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: TobetoColor.card.shineGreen,
      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
      boxShadow: [
        BoxShadow(
          color: TobetoColor.card.grey.withOpacity(0.45),
          spreadRadius: 7,
          blurRadius: 25,
          offset: const Offset(2, 4),
        ),
      ],
      children: [
        const VerticalPadding(),
        CustomContainer(
          backgroundColor: TobetoColor.card.navyBlue,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: CircleAvatar(
                    radius: 17.5,
                    backgroundColor: TobetoColor.card.shineGreen,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: CenteredText(
                    text: TobetoText.istanbulHeadline4,
                    style: TobetoTextStyle.poppins(context).subtitleWhiteBold20,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            PaddedText(
              text: TobetoText.istanbulCard3Title1,
              style: TobetoTextStyle.poppins(context).captionWhiteBold18,
              padding: const EdgeInsets.only(top: 30, bottom: 20, left: 10),
            ),
            PaddedText(
              text: TobetoText.istanbulCard3Title2,
              style: TobetoTextStyle.poppins(context).captionWhiteBold18,
              padding: const EdgeInsets.only(bottom: 10),
            ),
            PaddedText(
              text: TobetoText.istanbulCard3Body1,
              style: TobetoTextStyle.poppins(context).bodyWhiteNormal16,
              padding: const EdgeInsets.only(bottom: 10),
            ),
            Icon(
              Icons.add,
              color: TobetoColor.card.white,
              size: 60,
            ),
            PaddedText(
              text: TobetoText.istanbulCard3Title3,
              style: TobetoTextStyle.poppins(context).captionWhiteBold18,
              padding: const EdgeInsets.only(bottom: 10, top: 20),
            ),
            PaddedText(
              text: TobetoText.istanbulCard3Body2,
              style: TobetoTextStyle.poppins(context).bodyWhiteNormal16,
              padding: const EdgeInsets.only(bottom: 20),
            ),
          ],
        ),
        const VerticalPadding(),
      ],
    );
  }
}
