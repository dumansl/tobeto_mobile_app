import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_image.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1E0F41),
      width: double.infinity,
      child: Column(
        children: [
          const VerticalPadding(),
          const CustomImage(
            imagePath: ImagePath.ikLogoLight,
            width: 290,
            height: 120,
          ),
          const VerticalPadding(),
          CenteredText(
            text: 'İlk Kampüs Buluşması \n Gerçekleşti',
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
            style: TobetoTextStyle.poppins(context).subtitleWhiteBold20,
          ),
          const TextSpan(
            text: '“',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 231, 170), fontSize: 20),
          ),
          TextSpan(
            text: textParts[2],
            style: TobetoTextStyle.poppins(context).subtitleWhiteBold20,
          ),
          const TextSpan(
            text: '”',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 231, 170), fontSize: 20),
          ),
          TextSpan(
            text: textParts[4],
            style: TobetoTextStyle.poppins(context).subtitleWhiteBold20,
          ),
        ],
      ),
    );
  }
}
