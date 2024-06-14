import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/review_bloc/review_bloc.dart';
import 'package:tobeto_mobile_app/blocs/review_bloc/review_event.dart';
import 'package:tobeto_mobile_app/blocs/review_bloc/review_state.dart';
import 'package:tobeto_mobile_app/screens/reviews_screen/reviews_widgets/custom_review_button.dart';
import 'package:tobeto_mobile_app/screens/reviews_screen/reviews_widgets/reviews_appbar.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/snack_bar.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

import '../screens.dart';

class SuccessExamScreen extends StatefulWidget {
  const SuccessExamScreen({super.key});

  @override
  State<SuccessExamScreen> createState() => _SuccessExamScreenState();
}

class _SuccessExamScreenState extends State<SuccessExamScreen> {
  int _currentQuestionIndex = 0;
  final Map<int, String> _selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TobetoColor.background.lightGrey,
      appBar: const ReviewsAppbar(
        title: "Tobeto İşte Başarı Modeli",
      ),
      body: BlocProvider(
        create: (context) => ReviewBloc()..add(FetchReviews()),
        child: _examContent(context),
      ),
    );
  }

  Widget _examContent(BuildContext context) {
    return BlocBuilder<ReviewBloc, ReviewState>(
      builder: (context, state) {
        if (state is ReviewLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: TobetoColor.purple,
          ));
        } else if (state is ReviewLoaded) {
          final review = state.reviews;
          final totalQuestions = review.questions.length;
          final currentQuestion = review.questions[_currentQuestionIndex];

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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.question_answer,
                      size: IconSize.size25px,
                      color: TobetoColor.icon.darkGrey,
                    ),
                    SizedBox(width: ScreenPadding.padding8px),
                    Text(
                      "${_currentQuestionIndex + 1} / $totalQuestions",
                      style: TobetoTextStyle.poppins.bodyGrayDarkNormal16,
                    ),
                  ],
                ),
                Divider(color: TobetoColor.frame.grey),
                SizedBox(height: ScreenPadding.padding8px),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _questionText(currentQuestion),
                    for (String answerKey in review.answers.keys)
                      _answerButton(
                        answerText: answerKey,
                        isSelected: _selectedAnswers[_currentQuestionIndex] ==
                            answerKey,
                        onTap: () {
                          setState(() {
                            _selectedAnswers[_currentQuestionIndex] = answerKey;
                          });
                        },
                      ),
                    CustomReviewButton(
                      buttonText: _currentQuestionIndex + 1 == totalQuestions
                          ? TobetoText.successExamButtonEnd
                          : TobetoText.successExamButtonNext,
                      backgroundColor: TobetoColor.purple,
                      style: TobetoTextStyle.poppins.bodyWhiteSemiBold16,
                      onPressed: _selectedAnswers
                              .containsKey(_currentQuestionIndex)
                          ? () async {
                              if (_currentQuestionIndex + 1 == totalQuestions) {
                                await _showResult(context);
                              } else {
                                setState(() {
                                  _currentQuestionIndex++;
                                });
                              }
                            }
                          : () {
                              snackBar(context,
                                  "Lütfen uygun bulduğunuz cevabı işaretleyin.",
                                  bgColor: TobetoColor.state.error);
                            },
                    ),
                  ],
                )),
              ],
            ),
          );
        } else if (state is ReviewError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('Bilinmeyen Durum'));
        }
      },
    );
  }

  Text _questionText(currentQuestion) {
    return Text(
      currentQuestion,
      style: TobetoTextStyle.poppins.bodyGrayDarkNormal16,
      textAlign: TextAlign.justify,
    );
  }

  Future<void> _showResult(BuildContext context) async {
    int totalScore = _selectedAnswers.values.fold(0, (sum, answer) {
      switch (answer) {
        case '--':
          return sum + 1;
        case '-':
          return sum + 2;
        case '0':
          return sum + 3;
        case '+':
          return sum + 4;
        case '++':
          return sum + 5;
        default:
          return sum;
      }
    });

    double averageScore = totalScore / _selectedAnswers.length;

    BlocProvider.of<ReviewBloc>(context).add(UpdateReviewStatus(averageScore));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SuccessModelResultScreen(),
      ),
    );
  }

  Widget _answerButton(
      {required String answerText,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenPadding.padding16px,
          vertical: ScreenPadding.padding16px,
        ),
        decoration: BoxDecoration(
          color: TobetoColor.purple,
          borderRadius: BorderRadius.circular(SizeRadius.radius16px),
        ),
        child: Row(
          children: [
            Container(
              height: ScreenUtil.getHeight(context) * 0.02,
              width: ScreenUtil.getHeight(context) * 0.02,
              decoration: BoxDecoration(
                color:
                    isSelected ? TobetoColor.purple : TobetoColor.button.white,
                border: isSelected
                    ? Border.all(color: TobetoColor.frame.white, width: 3)
                    : null,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: ScreenPadding.padding8px),
            Text(
              answerText,
              style: TobetoTextStyle.poppins.bodyWhiteBold16,
            ),
          ],
        ),
      ),
    );
  }
}
