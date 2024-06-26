import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/exam_bloc/exams_state.dart';
import 'package:tobeto_mobile_app/blocs/export_bloc.dart';
import 'package:tobeto_mobile_app/model/exam_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/snack_bar.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import '../../utils/constant/constants.dart';
import 'reviews_widgets/custom_review_button.dart';

class AreaExamScreen extends StatefulWidget {
  const AreaExamScreen({super.key});

  @override
  State<AreaExamScreen> createState() => _AreaExamScreenState();
}

class _AreaExamScreenState extends State<AreaExamScreen> {
  int _currentQuestionIndex = 0;
  final Map<int, String> _selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TobetoColor.background.lightGrey,
      appBar: FixedAppbar(
        title: Text(
          "Sınav Ekranı",
          style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28,
        ),
      ),
      body: BlocProvider(
        create: (context) => ExamBloc()..add(FetchExams()),
        child: _quizContent(context),
      ),
    );
  }

  Widget _quizContent(BuildContext context) {
    return BlocBuilder<ExamBloc, ExamState>(
      builder: (context, state) {
        if (state is ExamInitialState) {
          context.read<ExamBloc>().add(FetchExams());
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExamLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExamLoaded) {
          final exams = state.exams;
          final currentExam = exams[_currentQuestionIndex];
          final totalQuestions = currentExam.exam.questions.length;
          final currentQuestion =
              currentExam.exam.questions[_currentQuestionIndex];

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
                      style:
                          TobetoTextStyle.poppins(context).bodyGrayDarkNormal16,
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
                      _questionText(currentQuestion.question),
                      for (String answerKey in currentQuestion.answers.keys)
                        _answerButton(
                          answerText: answerKey,
                          isSelected: _selectedAnswers[_currentQuestionIndex] ==
                              answerKey,
                          onTap: () {
                            setState(() {
                              _selectedAnswers[_currentQuestionIndex] =
                                  answerKey;
                            });
                          },
                        ),
                      CustomReviewButton(
                        buttonText: _currentQuestionIndex + 1 == totalQuestions
                            ? "Sonucu Gör"
                            : "Sonraki Soru",
                        backgroundColor: TobetoColor.purple,
                        style: TobetoTextStyle.poppins(context)
                            .bodyWhiteSemiBold16,
                        onPressed:
                            _selectedAnswers.containsKey(_currentQuestionIndex)
                                ? () async {
                                    if (_currentQuestionIndex + 1 ==
                                        totalQuestions) {
                                      await _showResult(context, exams);
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
        } else if (state is ExamError) {
          return Center(child: Text('Hata: ${state.message}'));
        } else {
          return const Center(child: Text('Bilinmeyen Durum'));
        }
      },
    );
  }

  Text _questionText(String question) {
    return Text(
      question,
      style: TobetoTextStyle.poppins(context).bodyGrayDarkNormal16,
      textAlign: TextAlign.justify,
    );
  }

  Future<void> _showResult(BuildContext context, List<UserExam> exams) async {
    int totalScore = 0;
    String userExamId = '';

    // Toplam puanı hesapla
    _selectedAnswers.forEach((index, selectedAnswer) {
      final selectedAnswerValue = exams[_currentQuestionIndex]
          .exam
          .questions[index]
          .answers[selectedAnswer];

      if (selectedAnswerValue == true) {
        totalScore += 20;
      }

      userExamId = exams[index].id;
    });

    BlocProvider.of<ExamBloc>(context)
        .add(UpdateExamResult(userExamId, totalScore));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SuccessModelResultScreen(),
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
              style: TobetoTextStyle.poppins(context).bodyWhiteBold16,
            ),
          ],
        ),
      ),
    );
  }
}
