import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/custom_image.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ProjectSupportCard extends StatelessWidget {
  const ProjectSupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalPadding(),
        const VerticalPadding(),
        CustomContainer(
          backgroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: TobetoColor.card.darkGrey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 4,
                offset: const Offset(6, 8)),
          ],
          children: [
            const VerticalPadding(),
            PaddedText(
              text: TobetoText.istanbulReport5Title,
              style: TobetoTextStyle.poppins(context).subtitleWhiteSemiBold20,
              padding: EdgeInsets.zero,
            ),
            const VerticalPadding(),
            PaddedText(
              text: TobetoText.istanbulCard5Body,
              style: TobetoTextStyle.poppins(context).bodyBlackNormal16,
              padding: EdgeInsets.only(left: ScreenPadding.padding30px, right: ScreenPadding.padding30px),
            ),
            Center(
              child: Column(
                children: [
                  CustomImage(
                    imagePath: ImagePath.stb,
                    width: ScreenUtil.getWidth(context) * 0.7,
                    height: ScreenUtil.getHeight(context) * 0.1,
                  ),
                  const VerticalPadding(),
                  CustomImage(
                    imagePath: ImagePath.istka,
                    width: ScreenUtil.getWidth(context) * 0.20,
                    height: ScreenUtil.getHeight(context) * 0.065,
                  ),
                  const VerticalPadding(),
                  CustomImage(
                    imagePath: ImagePath.bop,
                    width: ScreenUtil.getWidth(context) * 0.5,
                    height: ScreenUtil.getHeight(context) * 0.1,
                  ),
                  CustomImage(
                    imagePath: ImagePath.etkiYap,
                    width: ScreenUtil.getHeight(context) * 0.2,
                    height: ScreenUtil.getHeight(context) * 0.1,
                  ),
                  CustomImage(
                    imagePath: ImagePath.enocta,
                    width: ScreenUtil.getWidth(context) * 0.25,
                    height: ScreenUtil.getHeight(context) * 0.1,
                  ),
                  CustomImage(
                    imagePath: ImagePath.greyTobeto,
                    width: ScreenUtil.getWidth(context) * 0.6,
                    height: ScreenUtil.getHeight(context) * 0.1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
