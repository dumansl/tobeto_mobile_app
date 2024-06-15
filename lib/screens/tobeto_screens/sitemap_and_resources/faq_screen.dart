import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/sitemap_and_resources/sitemap_and_resources_widget/custom_dropdown_input.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/sitemap_and_resources/sitemap_and_resources_widget/description_title_content.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sıkça Sorular Sorular"),
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenPadding.padding24px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: ScreenPadding.padding16px),
              child: Text(
                "S.S.S.",
                style: TobetoTextStyle.poppins.subtitleGrayDarkBold20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: ScreenPadding.padding24px),
              child: CustomDropDownInput(
                items: ['Tobeto', 'Eğitim', 'Destek']
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                title: "Tobeto",
                onChanged: (value) {},
              ),
            ),
            const DescriptionTitleContent(
                title: "Neden Tobeto’yu tercih etmeliyim?",
                description:
                    "Platformda profil bilgilerindeki ayarlar sekmesinden hesabını silebilirsin. Hesabını sildiğinde kazandığın tüm rozetlerin silineceğini ve eğitim yolculuğunun sıfırlanacağını unutma."),
            const DescriptionTitleContent(
                title: "Neden Tobeto’yu tercih etmeliyim?",
                description:
                    "Platformda profil bilgilerindeki ayarlar sekmesinden hesabını silebilirsin. Hesabını sildiğinde kazandığın tüm rozetlerin silineceğini ve eğitim yolculuğunun sıfırlanacağını unutma."),
          ],
        ),
      ),
    );
  }
}
