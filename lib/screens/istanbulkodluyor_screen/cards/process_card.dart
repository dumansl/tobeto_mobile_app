import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ProcessCard extends StatelessWidget {
  const ProcessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: const Color(0xFF1E0F41),
      children: [
        const VerticalPadding(),
        const CenteredText(
          text: 'SÜREÇ',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 231, 170),
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

  static const List<Map<String, String>> _steps = [
    {'number': '1', 'text': 'Başvuru ve Ön Değerlendirme'},
    {'number': '2', 'text': '"Herkes için Kodlama" Eğitimleri'},
    {'number': '3', 'text': 'Seçme ve Değerlendirme'},
    {'number': '4', 'text': 'Mesleki ve Profesyonel Eğitimler'},
    {'number': '5', 'text': 'İstihdam'},
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
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          const SizedBox(width: 30),
          CircleAvatar(
            backgroundColor: TobetoColor.card.white,
            child: Center(
              child: Text(
                number,
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 0, 231, 170),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Text(
            text,
            style: TobetoTextStyle.poppins(context).bodyWhiteBold16,
          ),
        ],
      ),
    );
  }
}
