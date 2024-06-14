import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/sitemap_and_resources/faq_screen.dart';
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
        const DescriptionTitleContent(
            title: "Hakkımızda", description: "description"),
        const DescriptionTitleContent(
          title: "S.S.S.",
          isButton: true,
          navigatorScreen: FAQScreen(),
        ),
      ],
    );
  }

  Widget _resources(BuildContext context) {
    return Column(
      children: [
        _textDivider(context, text: TobetoText.tsourceTitle),
        SizedBox(height: ScreenPadding.padding8px),
        const DescriptionTitleContent(
            title: "Üyelik Sözleşmesi ve Kullanım Koşulları",
            description: "description"),
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
