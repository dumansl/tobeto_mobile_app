import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/export_bloc.dart';
import 'package:tobeto_mobile_app/model/exam_model.dart';
import 'package:tobeto_mobile_app/screens/reviews_screen/reviews_widgets/reviews_appbar.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/snack_bar.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import '../../utils/constant/constants.dart';
import 'reviews_widgets/custom_review_button.dart';

class AreaExamScreen extends StatefulWidget {
  final ExamModel exam;
  const AreaExamScreen({super.key, required this.exam});

  @override
  State<AreaExamScreen> createState() => _AreaExamScreenState();
}

class _AreaExamScreenState extends State<AreaExamScreen> {
  int _currentQuestionIndex = 0;
  final Map<int, String> _selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReviewsAppbar(
        title: "Sınav Ekranı",
      ),
      body: _quizContent(context),
    );
  }

  Widget _quizContent(BuildContext context) {
    final currentExam = widget.exam;
    final totalQuestions = currentExam.questions.length;
    final currentQuestion = currentExam.questions[_currentQuestionIndex];
    return Container(
      height: double.infinity,
      margin: EdgeInsets.only(top: ScreenPadding.padding24px),
      padding: EdgeInsets.all(ScreenPadding.padding24px),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
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
                style: TobetoTextStyle.poppins(context).bodyGrayDarkNormal16,
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
                _questionText(currentQuestion['question']),
                Column(
                  children: currentQuestion['answers'].keys.map<Widget>((key) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: _answerButton(
                        answerText: key,
                        isSelected:
                            _selectedAnswers[_currentQuestionIndex] == key,
                        onTap: () {
                          setState(() {
                            _selectedAnswers[_currentQuestionIndex] = key;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
                CustomReviewButton(
                  buttonText: _currentQuestionIndex + 1 == totalQuestions
                      ? "Sonucu Gör"
                      : "Sonraki Soru",
                  backgroundColor: TobetoColor.purple,
                  style: TobetoTextStyle.poppins(context).bodyWhiteSemiBold16,
                  onPressed: _selectedAnswers.containsKey(_currentQuestionIndex)
                      ? () async {
                          if (_currentQuestionIndex + 1 == totalQuestions) {
                            await _showResult(context, widget.exam);
                          } else {
                            setState(() {
                              _currentQuestionIndex++;
                            });
                          }
                        }
                      : () {
                          snackBar(context, "Lütfen bir cevap seçin.",
                              bgColor: TobetoColor.state.error);
                        },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _questionText(String question) {
    return Text(
      question,
      style: TobetoTextStyle.poppins(context).bodyGrayDarkNormal16,
      textAlign: TextAlign.justify,
    );
  }

  Future<void> _showResult(BuildContext context, ExamModel exam) async {
    int correctCount = 0;
    int incorrectCount = 0;
    int unansweredCount = 0;
    double totalScore = 0;

    exam.questions.asMap().forEach((index, question) {
      if (_selectedAnswers.containsKey(index)) {
        final selectedAnswer = _selectedAnswers[index];
        final isCorrect = question['answers'][selectedAnswer] == true;

        if (isCorrect) {
          correctCount++;
          totalScore += 20;
        } else {
          incorrectCount++;
        }
      } else {
        unansweredCount++;
      }
    });

    context.read<ExamBloc>().add(SaveExamResult(
          correctCount: correctCount,
          incorrectCount: incorrectCount,
          unansweredCount: unansweredCount,
          score: totalScore,
          isCompleted: true,
          examId: exam.examId,
        ));

    debugPrint(
        'Correct: $correctCount, Incorrect: $incorrectCount, Unanswered: $unansweredCount, Score: $totalScore');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExamResultScreen(
          examId: exam.examId,
        ),
      ),
    );
  }

  Widget _answerButton({
    required String answerText,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenPadding.padding16px,
          vertical: ScreenPadding.padding8px,
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
              style: TobetoTextStyle.poppins(context).bodyWhiteBold16,
            ),
          ],
        ),
      ),
    );
  }
}
