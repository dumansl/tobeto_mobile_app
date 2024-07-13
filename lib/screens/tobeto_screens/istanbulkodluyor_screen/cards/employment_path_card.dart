import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
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
          color: TobetoColor.card.darkGrey.withOpacity(0.15),
          spreadRadius: 7,
          blurRadius: 9,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(ScreenPadding.padding2px),
                  child: CircleAvatar(
                    radius: 17.5,
                    backgroundColor: TobetoColor.card.shineGreen,
                  ),
                ),
                SizedBox(
                  width: ScreenUtil.getWidth(context) * 0.2,
                ),
                CenteredText(
                  text: TobetoText.istanbulHeadline4,
                  style: TobetoTextStyle.poppins(context).captionWhiteBold18,
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            PaddedText(
              text: TobetoText.istanbulCard3Title1,
              style: TobetoTextStyle.poppins(context).subtitleWhiteBold20,
              padding: EdgeInsets.only(
                  top: ScreenPadding.padding30px, bottom: ScreenPadding.padding20px, left: ScreenPadding.padding10px),
            ),
            PaddedText(
              text: TobetoText.istanbulCard3Title2,
              style: TobetoTextStyle.poppins(context).subtitleWhiteBold20,
              padding: EdgeInsets.only(bottom: ScreenPadding.padding10px),
            ),
            PaddedText(
              text: TobetoText.istanbulCard3Body1,
              style: TobetoTextStyle.poppins(context).bodyWhiteNormal16,
              padding: EdgeInsets.only(bottom: ScreenPadding.padding10px),
            ),
            Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 60,
            ),
            PaddedText(
              text: TobetoText.istanbulCard3Title3,
              style: TobetoTextStyle.poppins(context).subtitleWhiteBold20,
              padding: EdgeInsets.only(bottom: ScreenPadding.padding10px, top: ScreenPadding.padding20px),
            ),
            PaddedText(
              text: TobetoText.istanbulCard3Body2,
              style: TobetoTextStyle.poppins(context).bodyWhiteNormal16,
              padding: EdgeInsets.only(bottom: ScreenPadding.padding20px),
            ),
          ],
        ),
        const VerticalPadding(),
      ],
    );
  }
}
