import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
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
          padding: const EdgeInsets.all(30),
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
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                TobetoText.istanbulHeadline3,
                style: TobetoTextStyle.poppins(context).captionWhiteBold18,
              ),
            ),
            const SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.all(2.0),
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
