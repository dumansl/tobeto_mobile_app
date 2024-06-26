import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/review_bloc/review_bloc.dart';
import 'package:tobeto_mobile_app/blocs/review_bloc/review_event.dart';
import 'package:tobeto_mobile_app/blocs/review_bloc/review_state.dart';
import 'package:tobeto_mobile_app/screens/reviews_screen/reviews_widgets/custom_headline_text.dart';
import 'package:tobeto_mobile_app/screens/reviews_screen/reviews_widgets/spider_chart.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

import 'reviews_widgets/description_title_content.dart';

class SuccessModelResultScreen extends StatefulWidget {
  const SuccessModelResultScreen({super.key});

  @override
  State<SuccessModelResultScreen> createState() =>
      _SuccessModelResultScreenState();
}

class _SuccessModelResultScreenState extends State<SuccessModelResultScreen> {
  double score = 0.0;

  @override
  void initState() {
    context.read<ReviewBloc>().add(FetchReviews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TobetoColor.background.lightGrey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomHeadlineText(),
                  _subHeadlineText(),
                ],
              ),
            ),
            Expanded(
              flex: 85,
              child: _successModelContent(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subHeadlineText() {
    return Text(
      TobetoText.evaluationHeadlineSubTitle3,
      style: TobetoTextStyle.poppins(context).titleGrayMediumBold24,
    );
  }

  Widget _successModelContent(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: ScreenPadding.padding32px,
          horizontal: ScreenPadding.padding32px),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(SizeRadius.radius30px),
          right: Radius.circular(SizeRadius.radius30px),
        ),
      ),
      child: Column(
        children: [
          _purpleDivider(context),
          BlocBuilder<ReviewBloc, ReviewState>(
            builder: (context, state) {
              if (state is ReviewLoaded) {
                score = (state.reviews.score!) / 5;
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: ScreenPadding.padding24px,
                          ),
                          child: SpiderChart(
                            values: [
                              score,
                              0.95,
                              0.90,
                              0.95,
                              0.68,
                              0.89,
                              0.95,
                              0.98,
                            ],
                          ),
                        ),
                        _spiderDescription(state.reviews.score!),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: ScreenPadding.padding16px,
                          ),
                          child: Column(
                            children: [
                              _successModelDescription(
                                title: TobetoText
                                    .evaluationspiderChartDescription1,
                                score: (state.reviews.score! * 10).round() / 10,
                                description: TobetoText
                                    .successExamResultDescriptionContent,
                                description2: TobetoText
                                    .successExamResultDescription2Content,
                                description3: TobetoText
                                    .successExamResultDescription3Content,
                              ),
                              _successModelDescription(
                                title: TobetoText
                                    .evaluationspiderChartDescription2,
                                score: (state.reviews.score! * 10).round() / 10,
                                description: TobetoText
                                    .successExamResultDescriptionContent,
                                description2: TobetoText
                                    .successExamResultDescription2Content,
                                description3: TobetoText
                                    .successExamResultDescription3Content,
                              ),
                              _successModelDescription(
                                title: TobetoText
                                    .evaluationspiderChartDescription3,
                                score: (state.reviews.score! * 10).round() / 10,
                                description: TobetoText
                                    .successExamResultDescriptionContent,
                                description2: TobetoText
                                    .successExamResultDescription2Content,
                                description3: TobetoText
                                    .successExamResultDescription3Content,
                              ),
                              _successModelDescription(
                                title: TobetoText
                                    .evaluationspiderChartDescription4,
                                score: (state.reviews.score! * 10).round() / 10,
                                description: TobetoText
                                    .successExamResultDescriptionContent,
                                description2: TobetoText
                                    .successExamResultDescription2Content,
                                description3: TobetoText
                                    .successExamResultDescription3Content,
                              ),
                              _successModelDescription(
                                title: TobetoText
                                    .evaluationspiderChartDescription5,
                                score: (state.reviews.score! * 10).round() / 10,
                                description: TobetoText
                                    .successExamResultDescriptionContent,
                                description2: TobetoText
                                    .successExamResultDescription2Content,
                                description3: TobetoText
                                    .successExamResultDescription3Content,
                              ),
                              _successModelDescription(
                                title: TobetoText
                                    .evaluationspiderChartDescription6,
                                score: (state.reviews.score! * 10).round() / 10,
                                description: TobetoText
                                    .successExamResultDescriptionContent,
                                description2: TobetoText
                                    .successExamResultDescription2Content,
                                description3: TobetoText
                                    .successExamResultDescription3Content,
                              ),
                              _successModelDescription(
                                title: TobetoText
                                    .evaluationspiderChartDescription7,
                                score: (state.reviews.score! * 10).round() / 10,
                                description: TobetoText
                                    .successExamResultDescriptionContent,
                                description2: TobetoText
                                    .successExamResultDescription2Content,
                                description3: TobetoText
                                    .successExamResultDescription3Content,
                              ),
                              _successModelDescription(
                                title: TobetoText
                                    .evaluationspiderChartDescription8,
                                score: (state.reviews.score! * 10).round() / 10,
                                description: TobetoText
                                    .successExamResultDescriptionContent,
                                description2: TobetoText
                                    .successExamResultDescription2Content,
                                description3: TobetoText
                                    .successExamResultDescription3Content,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is ReviewLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ReviewError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _purpleDivider(BuildContext context) {
    return Container(
      height: ScreenUtil.getHeight(context) * 0.016,
      decoration: ShapeDecoration(
        color: TobetoColor.purple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeRadius.radius5px)),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
    );
  }

  Widget _spiderDescription(double score) {
    return Column(
      children: [
        _spiderChartDescription(
          color: TobetoColor.card.turquoise,
          score: (score * 10).round() / 10,
          text: TobetoText.evaluationspiderChartDescription1,
        ),
        _spiderChartDescription(
          color: TobetoColor.card.darkGreen,
          score: (score * 10).round() / 10,
          text: TobetoText.evaluationspiderChartDescription2,
        ),
        _spiderChartDescription(
          color: TobetoColor.card.yellow,
          score: (score * 10).round() / 10,
          text: TobetoText.evaluationspiderChartDescription3,
        ),
        _spiderChartDescription(
          color: TobetoColor.card.darkPurple,
          score: (score * 10).round() / 10,
          text: TobetoText.evaluationspiderChartDescription4,
        ),
        _spiderChartDescription(
          color: TobetoColor.card.pink,
          score: (score * 10).round() / 10,
          text: TobetoText.evaluationspiderChartDescription5,
        ),
        _spiderChartDescription(
          color: TobetoColor.card.lightBrown,
          score: (score * 10).round() / 10,
          text: TobetoText.evaluationspiderChartDescription6,
        ),
        _spiderChartDescription(
          color: TobetoColor.card.fuchsia,
          score: (score * 10).round() / 10,
          text: TobetoText.evaluationspiderChartDescription7,
        ),
        _spiderChartDescription(
          color: TobetoColor.card.peach,
          score: (score * 10).round() / 10,
          text: TobetoText.evaluationspiderChartDescription8,
        ),
      ],
    );
  }

  Widget _spiderChartDescription(
      {required Color color, required double score, required String text}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 25,
              width: 35,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(
                  Radius.circular(SizeRadius.radius5px),
                ),
              ),
              child: Center(
                child: Text(
                  "$score",
                  style: TobetoTextStyle.poppins(context).captionWhiteNormal12,
                ),
              ),
            ),
            SizedBox(
              width: ScreenPadding.padding8px,
            ),
            Expanded(
              child: Text(
                text,
                style: TobetoTextStyle.poppins(context).captionGrayNormal12,
              ),
            ),
          ],
        ),
        SizedBox(height: SizeRadius.radius8px),
      ],
    );
  }

  Widget _successModelDescription({
    required String title,
    required double score,
    required String description,
    required String description2,
    required String description3,
  }) {
    return Column(
      children: [
        _successModelDescriptionTitle(
          title: title,
          score: score,
        ),
        SizedBox(height: ScreenPadding.padding16px),
        DescriptionTitleContent(
          title: TobetoText.successExamResultDescription,
          description: description,
        ),
        DescriptionTitleContent(
          title: TobetoText.successExamResultDescription2,
          description: description2,
        ),
        DescriptionTitleContent(
          title: TobetoText.successExamResultDescription3,
          description: description3,
        ),
      ],
    );
  }

  Widget _successModelDescriptionTitle(
      {required String title, required double score}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TobetoTextStyle.poppins(context).captionPurpleBold12,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: ScreenPadding.padding12px,
            horizontal: ScreenPadding.padding8px,
          ),
          decoration: BoxDecoration(
            color: TobetoColor.purple,
            borderRadius: BorderRadius.all(
              Radius.circular(SizeRadius.radius10px),
            ),
          ),
          child: Text(
            "${TobetoText.evaluationScore} : $score",
            style: TobetoTextStyle.poppins(context).captionWhiteBold12,
          ),
        ),
      ],
    );
  }
}
