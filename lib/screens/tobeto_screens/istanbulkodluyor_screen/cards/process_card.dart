import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ProcessCard extends StatelessWidget {
  const ProcessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: TobetoColor.card.navyBlue,
      children: [
        const VerticalPadding(),
        CenteredText(
          text: TobetoText.istanbulProcess,
          style: TextStyle(
            color: TobetoColor.card.shineGreen,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalPadding(),
        Column(
          children: [
            for (var step in _steps)
              CustomStepRow(
                number: step['number']!,
                text: step['text']!,
              ),
          ],
        ),
        const VerticalPadding(),
      ],
    );
  }

  static final List<Map<String, String>> _steps = [
    {'number': '1', 'text': TobetoText.istanbulProcessBox1},
    {'number': '2', 'text': TobetoText.istanbulProcessBox2},
    {'number': '3', 'text': TobetoText.istanbulProcessBox3},
    {'number': '4', 'text': TobetoText.istanbulProcessBox4},
    {'number': '5', 'text': TobetoText.istanbulProcessBox5},
  ];
}

class CustomStepRow extends StatelessWidget {
  final String number;
  final String text;

  const CustomStepRow({
    super.key,
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: ScreenPadding.padding5px),
      child: Row(
        children: [
          SizedBox(width: ScreenUtil.getWidth(context) * 0.07),
          CircleAvatar(
            backgroundColor: TobetoColor.card.white,
            child: Center(
              child: Text(
                number,
                style: GoogleFonts.poppins(
                  color: TobetoColor.card.shineGreen,
                  fontSize: ScreenPadding.padding16px,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: ScreenUtil.getHeight(context) * 0.013),
          Text(
            text,
            style: TobetoTextStyle.poppins(context).bodyWhiteSemiBold16,
          ),
        ],
      ),
    );
  }
}
