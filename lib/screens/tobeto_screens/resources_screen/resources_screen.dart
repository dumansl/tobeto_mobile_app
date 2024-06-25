import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

import '../widgets/description_title_content.dart';
import 'pdf_screen.dart';
import 'webview_screen.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FixedAppbar(
        isTobetoScreen: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenPadding.padding24px,
          left: ScreenPadding.padding24px,
          right: ScreenPadding.padding24px,
        ),
        child: SingleChildScrollView(
          child: _resources(context),
        ),
      ),
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
