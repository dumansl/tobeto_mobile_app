import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class FAQCard extends StatefulWidget {
  const FAQCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FAQCardState createState() => _FAQCardState();
}

class _FAQCardState extends State<FAQCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalPadding(),
        CenteredText(
          text: 'Sıkça Sorulan Sorular',
          style: TobetoTextStyle.poppins.captionBlackBold24,
        ),
        const VerticalPadding(),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: CustomContainer(
            backgroundColor: const Color(0xFF1E0F41),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CenteredText(
                      text: 'Başvuru ve Ön-değerlendirme',
                      style: TobetoTextStyle.poppins.captionWhiteBold15,
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: TobetoColor.text.white,
                    size: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        if (_isExpanded)
          const CustomContainer(
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Yazılım ve teknoloji alanında meslek sahibi olmak isteyen genç yetişkinlere, ücretsiz ve kapsamlı eğitimlerle gerekli bilgi ve becerileri kazandıran, Türkiye’nin önde gelen kurumlarında işe yerleşmelerini  sağlayan bir projedir.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        const VerticalPadding(),
      ],
    );
  }
}
