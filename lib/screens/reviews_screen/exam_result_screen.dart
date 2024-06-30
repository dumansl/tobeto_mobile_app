import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import 'package:tobeto_mobile_app/blocs/exam_bloc/exams_bloc.dart';
import 'package:tobeto_mobile_app/blocs/exam_bloc/exams_event.dart';
import 'package:tobeto_mobile_app/blocs/exam_bloc/exams_state.dart';
import 'reviews_widgets/reviews_appbar.dart';

class ExamResultScreen extends StatelessWidget {
  final String examId;
  const ExamResultScreen({super.key, required this.examId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamBloc()..add(FetchExamResult(examId)),
      child: Scaffold(
        backgroundColor: TobetoColor.background.lightGrey,
        appBar: const ReviewsAppbar(
          title: "Sınav Sonucu",
        ),
        body: BlocBuilder<ExamBloc, ExamState>(
          builder: (context, state) {
            if (state is ExamResultLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ExamResultLoaded) {
              final examResult = state.examResult;
              return Column(
                children: [
                  Expanded(
                      flex: 25,
                      child: _resultCard(context,
                          assetName: ImagePath.trueLight,
                          text: "${examResult.correctAnswers}\nDoğru")),
                  Expanded(
                      flex: 25,
                      child: _resultCard(context,
                          assetName: ImagePath.falseLight,
                          text: "${examResult.incorrectAnswers}\nYanlış")),
                  Expanded(
                      flex: 25,
                      child: _resultCard(context,
                          assetName: ImagePath.emptyLight,
                          text: "${examResult.unansweredQuestions}\nBoş")),
                  Expanded(
                      flex: 25,
                      child: _resultCard(context,
                          assetName: ImagePath.pointLight,
                          text: "${examResult.score}\nPuan")),
                ],
              );
            } else if (state is ExamResultError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text("Bir hata oluştu"));
            }
          },
        ),
      ),
    );
  }

  Widget _resultCard(BuildContext context,
      {required String assetName, required String text}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: ScreenPadding.screenpadding,
          vertical: ScreenPadding.padding8px),
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(assetName),
          fit: BoxFit.fitWidth,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TobetoTextStyle.poppins(context).headlinePurpleSemiBold32,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
