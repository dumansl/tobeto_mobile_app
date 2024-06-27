import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ApplyNowCard extends StatelessWidget {
  const ApplyNowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: TobetoColor.card.shineGreen,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      boxShadow: [
        BoxShadow(
          color: TobetoColor.card.darkGrey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 6,
          offset: const Offset(2, 6),
        ),
      ],
      children: [
        const VerticalPadding(),
        CustomContainer(
          backgroundColor: TobetoColor.card.navyBlue,
          borderRadius: const BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CenteredText(
                  text: TobetoText.istanbulHeadline6,
                  style: TobetoTextStyle.poppins(context).captionWhiteBold18,
                ),
                SizedBox(width: ScreenUtil.getWidth(context) * 0.2),
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
        ),
        const VerticalPadding(),
        PaddedText(
          text: TobetoText.istanbulCard4Title,
          style: TobetoTextStyle.poppins(context).subtitleWhiteBold20,
          padding: const EdgeInsets.all(0),
        ),
        const VerticalPadding(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNumberedText(
              number: ' 1',
              text: TobetoText.istanbulCard4Body1,
            ),
            CustomNumberedText(
              number: '2',
              text: TobetoText.istanbulCard4Body2,
            ),
            CustomNumberedText(
              number: '3',
              text: TobetoText.istanbulCard4Body3,
            ),
          ],
        ),
      ],
    );
  }
}

class CustomNumberedText extends StatelessWidget {
  final String number;
  final String text;

  const CustomNumberedText({
    super.key,
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: ScreenPadding.padding2px, bottom: ScreenPadding.padding20px),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: number,
              style: GoogleFonts.poppins(
                color: TobetoColor.text.darkGreen,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '    $text',
              style: TobetoTextStyle.poppins(context).bodyWhiteBold16,
            ),
          ],
        ),
      ),
    );
  }
}
