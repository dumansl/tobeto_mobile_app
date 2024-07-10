import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class AboutIstanbulKodluyorCard extends StatelessWidget {
  const AboutIstanbulKodluyorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: TobetoColor.card.shineGreen,
      borderRadius: const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      children: [
        const VerticalPadding(),
        const ProjectAboutHeader(),
        PaddedText(
          text: TobetoText.istanbulCard2Body,
          style: TobetoTextStyle.poppins(context).bodyWhiteBold16,
          padding: EdgeInsets.all(ScreenPadding.padding30px),
        ),
      ],
    );
  }
}

class ProjectAboutHeader extends StatelessWidget {
  const ProjectAboutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: TobetoColor.card.navyBlue,
      borderRadius: const BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              TobetoText.istanbulHeadline3,
              style: TobetoTextStyle.poppins(context).captionWhiteBold18,
            ),
            SizedBox(width: ScreenUtil.getWidth(context) * 0.12),
            Padding(
              padding: EdgeInsets.all(ScreenPadding.padding2px),
              child: CircleAvatar(
                backgroundColor: TobetoColor.card.shineGreen,
                radius: 17.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
