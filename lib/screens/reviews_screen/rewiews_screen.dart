import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import 'reviews_widgets/custom_review_button.dart';

class RewiewsScreen extends StatelessWidget {
  const RewiewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Değerlendirmeler"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenPadding.screenpadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _reviewsHeadline(),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding32px),
                  child: _reviewsCard(
                    isThereButton: true,
                    lineerColor1: TobetoColor.purple,
                    lineerColor2: TobetoColor.purple,
                    headline: TobetoText.evaluationCard1Title,
                    subheading: TobetoText.evaluationCard1Body,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                  child: _reviewsCard(
                    lineerColor1: TobetoColor.card.darkBlue,
                    lineerColor2: TobetoColor.card.darkBlue,
                    headline: TobetoText.evaluationCard2Title,
                    subheading: TobetoText.evaluationCard2Body,
                    dividerText: TobetoText.evaluationCard2Button,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                  child: Column(
                    children: [
                      _examCard(title: "Front End"),
                      _examCard(title: "Front End"),
                      _examCard(title: "Front End"),
                      _examCard(title: "Front End"),
                      _examCard(title: "Front End"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                  child: _rainbowDivider(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding8px),
                  child: _reviewsHeadline2(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding32px),
                  child: _reviewsCard(
                    isThereButton: false,
                    headline: TobetoText.evaluationCard3Title,
                    subheading: TobetoText.evaluationCard3Body,
                    lineerColor1: TobetoColor.card.linearpurple,
                    lineerColor2: TobetoColor.card.darkBlue,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                  child: _reviewsCard(
                    isThereButton: false,
                    headline: TobetoText.evaluationCard4Title,
                    subheading: TobetoText.evaluationCard4Main,
                    title: TobetoText.evaluationCard4Main2,
                    subTitle: TobetoText.evaluationCard4Subtitle,
                    lineerColor1: TobetoColor.card.linearpurple,
                    lineerColor2: TobetoColor.card.darkBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _reviewsHeadline() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: TobetoText.evaluationHeadline1part1,
        style: TobetoTextStyle.poppins.titlePurpleNormal24,
        children: <TextSpan>[
          TextSpan(
            text: TobetoText.evaluationHeadline1part2,
            style: TobetoTextStyle.poppins.titleGrayDarkNormal24,
          ),
          TextSpan(
            text: TobetoText.evaluationHeadline1part3,
            style: TobetoTextStyle.poppins.titlePurpleNormal24,
          ),
          TextSpan(
            text: TobetoText.evaluationHeadline1part4,
            style: TobetoTextStyle.poppins.titleGrayDarkNormal24,
          ),
        ],
      ),
    );
  }

  Widget _reviewsCard({
    required Color lineerColor1,
    required Color lineerColor2,
    required String headline,
    required String subheading,
    String? dividerText,
    String? title,
    String? subTitle,
    bool isThereButton = false,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: ScreenPadding.padding16px,
          vertical: ScreenPadding.padding32px),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            lineerColor1.withOpacity(0.5),
            lineerColor2,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeRadius.radius30px),
          bottomRight: Radius.circular(SizeRadius.radius30px),
          topRight: Radius.circular(SizeRadius.radius30px),
        ),
      ),
      child: Column(
        children: [
          Text(
            headline,
            style: TobetoTextStyle.poppins.subtitleWhiteSemiBold20,
            textAlign: TextAlign.center,
          ),
          Text(
            subheading,
            style: TobetoTextStyle.poppins.captionWhiteNormal14,
            textAlign: TextAlign.center,
          ),
          isThereButton
              ? Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                  child: CustomReviewButton(
                      buttonText: TobetoText.evaluationCardButton,
                      backgroundColor: TobetoColor.purple,
                      style: TobetoTextStyle.poppins.captionWhiteNormal14),
                )
              : dividerText != null
                  ? Padding(
                      padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                      child: Text(
                        dividerText,
                        style: TobetoTextStyle.poppins.bodyWhiteNormal16,
                      ),
                    )
                  : const SizedBox(),
          title != null
              ? Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                  child: Text(
                    title,
                    style: TobetoTextStyle.poppins.bodyWhiteSemiBold16,
                    textAlign: TextAlign.center,
                  ),
                )
              : const SizedBox(),
          subTitle != null
              ? Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                  child: Text(
                    subTitle,
                    style: TobetoTextStyle.poppins.captionWhiteSemiBold8,
                    textAlign: TextAlign.center,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _examCard({required String title}) {
    return Container(
      margin: EdgeInsets.only(top: ScreenPadding.padding8px),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: ScreenPadding.padding16px,
          vertical: ScreenPadding.padding8px),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            TobetoColor.card.darkBlue.withOpacity(0.5),
            TobetoColor.card.darkBlue,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(SizeRadius.radius30px),
        ),
      ),
      child: Row(
        children: [
          Image.asset(height: 48, width: 48, ImagePath.platformIcon),
          const SizedBox(width: 8),
          Text(
            title,
            style: TobetoTextStyle.poppins.subtitleWhiteSemiBold20,
          ),
          const Spacer(),
          CustomReviewButton(
            backgroundColor: TobetoColor.card.white,
            buttonText: TobetoText.evaluationCardButton,
            style: TobetoTextStyle.poppins.captionBlackBold12,
          ),
        ],
      ),
    );
  }

  Widget _rainbowDivider() {
    return Container(
      height: 121,
      width: 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(SizeRadius.radius5px)),
        gradient: LinearGradient(
          colors: [
            TobetoColor.rainbow.linearpurple,
            TobetoColor.card.linearpurple,
            TobetoColor.card.linearpurple.withOpacity(0.3),
            TobetoColor.card.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _reviewsHeadline2() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: TobetoText.evaluationHeadlineTitle2,
        style: TobetoTextStyle.poppins.titlePurpleNormal24,
        children: <TextSpan>[
          TextSpan(
            text: TobetoText.evaluationHeadlineSubTitle2,
            style: TobetoTextStyle.poppins.titleGrayDarkNormal24,
          ),
        ],
      ),
    );
  }
}
