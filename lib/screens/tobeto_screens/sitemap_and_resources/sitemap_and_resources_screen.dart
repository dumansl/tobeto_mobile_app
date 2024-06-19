import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/tobeto_screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

import 'sitemap_and_resources_widget/description_title_content.dart';

class SitemapAndResourcesScreen extends StatelessWidget {
  const SitemapAndResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Site"),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenPadding.padding24px,
          left: ScreenPadding.padding24px,
          right: ScreenPadding.padding24px,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _siteMap(context),
              SizedBox(height: ScreenPadding.padding32px),
              _resources(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _siteMap(BuildContext context) {
    return Column(
      children: [
        _textDivider(context, text: TobetoText.tmapTitle),
        SizedBox(height: ScreenPadding.padding8px),
        DescriptionTitleContent(
          title: TobetoText.tmapAboutBox,
          isButton: true,
          navigatorScreen: const FAQScreen(),
        ),
        DescriptionTitleContent(
          title: TobetoText.tmapPersonBox,
          isButton: true,
          navigatorScreen: const FAQScreen(),
        ),
        DescriptionTitleContent(
          title: TobetoText.tmapCompaniesBox,
          isButton: true,
          navigatorScreen: const FAQScreen(),
        ),
        DescriptionTitleContent(
          title: TobetoText.tmapCorporateBox,
          isButton: true,
          navigatorScreen: const FAQScreen(),
        ),
        DescriptionTitleContent(
          title: TobetoText.tmapFAQBox,
          isButton: true,
          navigatorScreen: const FAQScreen(),
        ),
        DescriptionTitleContent(
          title: TobetoText.tmapCommunicstionBox,
          isButton: true,
          navigatorScreen: const FAQScreen(),
        ),
      ],
    );
  }

  Widget _resources(BuildContext context) {
    return Column(
      children: [
        _textDivider(context, text: TobetoText.tsourceTitle),
        SizedBox(height: ScreenPadding.padding8px),
        DescriptionTitleContent(
          title: TobetoText.tsourceMemberBox,
          isButton: true,
          navigatorScreen: WebViewScreen(
            title: TobetoText.tsourceMemberBox,
            url: "https://tobeto.com/yasal-metinler/tobeto-uyelik-sozlesmesi",
          ),
        ),
        DescriptionTitleContent(
          title: TobetoText.tsourceGDPRBox,
          isButton: true,
          navigatorScreen: WebViewScreen(
            title: TobetoText.tsourceGDPRBox,
            url: "https://tobeto.com/yasal-metinler/kvkk-aydinlatma-metni",
          ),
        ),
        DescriptionTitleContent(
          title: TobetoText.tsourceApplicationBox,
          isButton: true,
          navigatorScreen: PDFScreen(
            title: TobetoText.tsourceApplicationBox,
            pdfUrl:
                "https://tobeto.s3.cloud.ngn.com.tr/Tobeto_Ilgili_Kisi_Basvuru_Formu_b0f79d29ba.pdf",
          ),
        ),
        DescriptionTitleContent(
          title: TobetoText.tsourceCookieBox,
          isButton: true,
          navigatorScreen: WebViewScreen(
            title: TobetoText.tsourceCookieBox,
            url: "https://tobeto.com/yasal-metinler/tobeto-cerez-politikasi",
          ),
        ),
        DescriptionTitleContent(
          title: TobetoText.tsourceEscapeBox,
          isButton: true,
          navigatorScreen: PDFScreen(
            title: TobetoText.tsourceEscapeBox,
            pdfUrl:
                "https://tobeto.s3.cloud.ngn.com.tr/v_Cayma_Formu_6bc3a888a3.pdf",
          ),
        ),
      ],
    );
  }

  Widget _textDivider(BuildContext context, {required String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TobetoTextStyle.poppins(context).subtitleGrayDarkBold20,
        ),
        Divider(color: TobetoColor.frame.lightGrey),
      ],
    );
  }
}
