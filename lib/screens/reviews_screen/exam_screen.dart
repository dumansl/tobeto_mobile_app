import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/reviews_screen/reviews_widgets/custom_review_button.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ExamScreen extends StatelessWidget {
  final String examType;
  const ExamScreen({super.key, required this.examType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TobetoColor.background.lightGrey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(examType == "success_model"
            ? "Tobeto İşte Başarı Modeli"
            : "Alan Sınavı"),
      ),
      body: _examContent(context),
    );
  }

  Widget _examContent(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: EdgeInsets.only(top: ScreenPadding.padding24px),
      padding: EdgeInsets.all(ScreenPadding.padding24px),
      decoration: BoxDecoration(
        color: TobetoColor.background.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeRadius.radius20px),
          topRight: Radius.circular(SizeRadius.radius20px),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (examType == "") ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.timer,
                          size: IconSize.size25px,
                          color: TobetoColor.icon.darkGrey,
                        ),
                        SizedBox(width: ScreenPadding.padding8px),
                        Text(
                          "30 : 00",
                          style: TobetoTextStyle.poppins.bodyGrayDarkNormal16,
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                  Row(
                    children: [
                      Icon(
                        Icons.question_answer,
                        size: IconSize.size25px,
                        color: TobetoColor.icon.darkGrey,
                      ),
                      SizedBox(width: ScreenPadding.padding8px),
                      Text(
                        "75 / 100",
                        style: TobetoTextStyle.poppins.bodyGrayDarkNormal16,
                      ),
                    ],
                  ),
                ],
              ),
              Divider(color: TobetoColor.frame.grey),
            ],
          ),
          Expanded(
            child: examType == ""
                ? _examQuestion()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _examQuestion(),
                      _examQuestion(),
                      _examQuestion(),
                    ],
                  ),
          ),
          CustomReviewButton(
            buttonText: "İLERİ",
            backgroundColor: TobetoColor.purple,
            style: TobetoTextStyle.poppins.captionWhiteSemiBold14,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuccessModelResultScreen(),
                  ));
            },
          ),
        ],
      ),
    );
  }

  Widget _examQuestion() {
    return Column(
      children: [
        Text(
          "1 - Lorem ipsum dolor sit amet consectetur. Mi justo nisi at fermentum volutpat sit amet. Egestas quam faucibus tortor ut velit netus venenatis vestibulum.",
          style: TobetoTextStyle.poppins.bodyGrayDarkNormal16,
          textAlign: TextAlign.justify,
        ),
        if (examType == "") ...[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _answerButton(aswersText: "--", isSelected: false),
                _answerButton(aswersText: "-", isSelected: false),
                _answerButton(aswersText: "0", isSelected: false),
                _answerButton(aswersText: "+", isSelected: true),
                _answerButton(aswersText: "++", isSelected: false),
              ],
            ),
          ),
        ] else
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _answerButton(aswersText: "--", isSelected: false),
              _answerButton(aswersText: "-", isSelected: false),
              _answerButton(aswersText: "0", isSelected: false),
              _answerButton(aswersText: "+", isSelected: true),
              _answerButton(aswersText: "++", isSelected: false),
            ],
          ),
      ],
    );
  }

  Widget _answerButton({required String aswersText, required bool isSelected}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: examType == "success_model"
            ? ScreenPadding.padding8px
            : ScreenPadding.padding16px,
        vertical: examType == "success_model"
            ? ScreenPadding.padding8px
            : ScreenPadding.padding16px,
      ),
      decoration: BoxDecoration(
        color: TobetoColor.purple,
        borderRadius: BorderRadius.circular(SizeRadius.radius16px),
      ),
      child: Row(
        children: [
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: isSelected ? TobetoColor.purple : TobetoColor.button.white,
              border: isSelected
                  ? Border.all(color: TobetoColor.frame.white, width: 3)
                  : null,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: ScreenPadding.padding8px),
          Text(
            aswersText,
            style: TobetoTextStyle.poppins.bodyWhiteBold16,
          ),
        ],
      ),
    );
  }
}
