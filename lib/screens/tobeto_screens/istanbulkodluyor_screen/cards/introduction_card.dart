import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/custom_image.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: TobetoColor.card.navyBlue,
      width: double.infinity,
      child: Column(
        children: [
          CustomImage(
            imagePath: ImagePath.ikLogoLight,
            width: ScreenUtil.getWidth(context) * 0.6,
            height: ScreenUtil.getHeight(context) * 0.14,
          ),
          CenteredText(
            text: TobetoText.istanbulHeadline1,
            style: TobetoTextStyle.poppins(context).subtitleWhiteLight20,
          ),
          const VerticalPadding(),
          const CustomRichText(
            textParts: ['Aradığın ', '“', 'İş', '”', ' Burada!'],
          ),
          const VerticalPadding(),
        ],
      ),
    );
  }
}

class CustomRichText extends StatelessWidget {
  final List<String> textParts;

  const CustomRichText({
    super.key,
    required this.textParts,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: textParts[0],
            style: TobetoTextStyle.poppins(context).subtitleWhiteSemiBold20,
          ),
          TextSpan(
            text: '“',
            style: TextStyle(color: TobetoColor.card.shineGreen, fontSize: ScreenPadding.padding20px),
          ),
          TextSpan(
            text: textParts[2],
            style: TobetoTextStyle.poppins(context).subtitleWhiteSemiBold20,
          ),
          TextSpan(
            text: '”',
            style: TextStyle(color: TobetoColor.card.shineGreen, fontSize: ScreenPadding.padding20px),
          ),
          TextSpan(
            text: textParts[4],
            style: TobetoTextStyle.poppins(context).subtitleWhiteSemiBold20,
          ),
        ],
      ),
    );
  }
}
