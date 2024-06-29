import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/tobeto_success_bloc/tobeto_success_bloc.dart';
import 'package:tobeto_mobile_app/blocs/tobeto_success_bloc/tobeto_success_event.dart';
import 'package:tobeto_mobile_app/blocs/tobeto_success_bloc/tobeto_success_state.dart';
import 'package:tobeto_mobile_app/screens/reviews_screen/reviews_widgets/custom_headline_text.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class TobetoSuccesScreen extends StatefulWidget {
  const TobetoSuccesScreen({super.key});

  @override
  State<TobetoSuccesScreen> createState() => _TobetoSuccesScreenState();
}

class _TobetoSuccesScreenState extends State<TobetoSuccesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BusinessSuccessBloc>().add(FetchBusinessSuccess());
    context.read<BusinessSuccessBloc>().add(FetchQuizResult());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: TobetoColor.purple, size: IconSize.size35px),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Expanded(flex: 15, child: Center(child: CustomHeadlineText())),
          Expanded(
            flex: 85,
            child: _tobetoSuccesContent(context),
          ),
        ],
      ),
    );
  }

  Widget _tobetoSuccesContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(SizeRadius.radius30px),
        ),
      ),
      child: Column(
        children: [
          _startEvaluateButton(context),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenPadding.padding32px,
                vertical: ScreenPadding.padding16px,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      TobetoText.evaluationMain1,
                      style:
                          TobetoTextStyle.poppins(context).bodyGrayDarkNormal16,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: ScreenPadding.padding16px),
                    _tobetoSuccesTable(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _startEvaluateButton(BuildContext context) {
    return BlocBuilder<BusinessSuccessBloc, BusinessSuccessState>(
      builder: (context, state) {
        if (state is BusinessSuccessInitial) {
          return Container(
            height: ScreenUtil.getHeight(context) * 0.12,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: ScreenPadding.padding16px,
                vertical: ScreenPadding.padding32px),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  TobetoColor.purple,
                  TobetoColor.purple.withOpacity(0.8),
                  TobetoColor.purple.withOpacity(0.6),
                  TobetoColor.purple.withOpacity(0.4),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(SizeRadius.radius30px),
                topRight: Radius.circular(SizeRadius.radius30px),
              ),
            ),
            child: Center(
              child: Text(
                'Initializing...',
                style: TobetoTextStyle.poppins(context).captionWhiteNormal14,
              ),
            ),
          );
        } else if (state is QuizResultLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is QuizResultLoaded) {
          final isCompleted = state.quizResults.isNotEmpty
              ? state.quizResults[0].isCompleted
              : false;
          debugPrint("Burada $isCompleted");
          return InkWell(
            onTap: () {
              if (isCompleted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuccessModelResultScreen(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuccessExamScreen(),
                  ),
                );
              }
            },
            child: Container(
              height: ScreenUtil.getHeight(context) * 0.12,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenPadding.padding16px,
                  vertical: ScreenPadding.padding32px),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    TobetoColor.purple,
                    TobetoColor.purple.withOpacity(0.8),
                    TobetoColor.purple.withOpacity(0.6),
                    TobetoColor.purple.withOpacity(0.4),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(SizeRadius.radius30px),
                  topRight: Radius.circular(SizeRadius.radius30px),
                ),
              ),
              child: Center(
                child: Text(
                  isCompleted!
                      ? TobetoText.tmainCard2RaporButton
                      : TobetoText.evaluationCard5,
                  style: TobetoTextStyle.poppins(context).captionWhiteNormal14,
                ),
              ),
            ),
          );
        } else if (state is BusinessSuccessError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Container();
        }
      },
    );
  }

  Widget _tobetoSuccesTable(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Table(
          border: TableBorder.all(color: Colors.grey),
          columnWidths: const {
            0: FlexColumnWidth(1.0),
            1: FlexColumnWidth(4.0),
          },
          children: [
            TableRow(children: [
              _tableCell(context, '--'),
              _tableCell(context, 'Bu konuda hiç ama hiç iyi değilim'),
            ]),
            TableRow(children: [
              _tableCell(context, '-'),
              _tableCell(context, 'Bu konuda pek iyi değilim'),
            ]),
            TableRow(children: [
              _tableCell(context, '0'),
              _tableCell(
                  context, 'Bu konuda ortalama düzeydeyim, ne iyi ne kötü'),
            ]),
            TableRow(children: [
              _tableCell(context, '+'),
              _tableCell(context, 'Bu konuda iyiyim'),
            ]),
            TableRow(children: [
              _tableCell(context, '++'),
              _tableCell(context, 'Bu konuda çok ama çok iyiyim.'),
            ]),
          ],
        ),
      ],
    );
  }

  Widget _tableCell(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.all(ScreenPadding.padding8px),
      child: Text(text,
          style: TobetoTextStyle.poppins(context).captionGrayDarkLight15),
    );
  }
}
