import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ApplyNowCard extends StatelessWidget {
  const ApplyNowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: const Color.fromARGB(255, 0, 231, 170),
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      boxShadow: [
        BoxShadow(
          color: TobetoColor.card.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 6,
          offset: const Offset(2, 6), // changes position of shadow
        ),
      ],
      children: [
        const VerticalPadding(),
        CustomContainer(
          backgroundColor: const Color(0xFF1E0F41),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: CenteredText(
                    text: 'Sende Hemen Başvur!',
                    style: TobetoTextStyle.poppins(context).captionWhiteBold18,
                  ),
                ),
                const SizedBox(width: 55),
                const Padding(
                  padding: EdgeInsets.all(3),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 0, 231, 170),
                    radius: 17.5,
                  ),
                ),
              ],
            ),
          ],
        ),
        const VerticalPadding(),
        PaddedText(
          text: 'Yazılım ve Teknoloji Alanında',
          style: TobetoTextStyle.poppins(context).subtitleWhiteBold20,
          padding: const EdgeInsets.all(0),
        ),
        const VerticalPadding(),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNumberedText(
              number: ' 1',
              text: 'Ücretsiz Eğitim Al',
            ),
            CustomNumberedText(
              number: '2',
              text: 'Profesyonel Yetkinlikler Kazan!',
            ),
            CustomNumberedText(
              number: '3',
              text: 'Yeni Mesleğinle İşe Başla!',
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
      padding: const EdgeInsets.only(left: 2, bottom: 20),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: number,
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(230, 31, 127, 10),
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
