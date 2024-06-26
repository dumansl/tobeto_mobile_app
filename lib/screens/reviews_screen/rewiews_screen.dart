import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/exam_bloc/exams_bloc.dart';
import 'package:tobeto_mobile_app/blocs/exam_bloc/exams_event.dart';
import 'package:tobeto_mobile_app/blocs/exam_bloc/exams_state.dart';
import 'package:tobeto_mobile_app/model/exam_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import 'reviews_widgets/custom_review_button.dart';

class RewiewsScreen extends StatelessWidget {
  const RewiewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TobetoColor.background.lightGrey,
      appBar: FixedAppbar(
        title: Text(
          TobetoText.evaluationAppBar,
          style: TobetoTextStyle.poppins(context).titlePurpleBold24,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenPadding.screenpadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _reviewsHeadline(context),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding32px),
                  child: _reviewsCard(
                    context,
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
                    context,
                    lineerColor1: TobetoColor.card.darkBlue,
                    lineerColor2: TobetoColor.card.darkBlue,
                    headline: TobetoText.evaluationCard2Title,
                    subheading: TobetoText.evaluationCard2Body,
                    dividerText: TobetoText.evaluationCard2Button,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                  child: BlocBuilder<ExamBloc, ExamState>(
                    builder: (context, state) {
                      if (state is ExamInitialState) {
                        context.read<ExamBloc>().add(FetchExams());
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ExamLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ExamLoaded) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.exams.length,
                          itemBuilder: (context, index) {
                            var exam = state.exams[index];
                            return _examCard(context, exam: exam);
                          },
                        );
                      } else if (state is ExamError) {
                        debugPrint(state.message);
                        return Center(child: Text('Hata: ${state.message}'));
                      } else {
                        return const Center(
                          child: Text('Bilinmeyen bir hata oluştu.'),
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                  child: _rainbowDivider(context),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding8px),
                  child: _reviewsHeadline2(context),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding32px),
                  child: _reviewsCard(
                    context,
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
                    context,
                    isThereButton: false,
                    headline: TobetoText.evaluationCard4Title,
                    subheading: TobetoText.evaluationCard4Main,
                    title: TobetoText.evaluationCard4Main2,
                    subTitle: TobetoText.evaluationCard4Subtitle,
                    lineerColor1: TobetoColor.card.linearpurple,
                    lineerColor2: TobetoColor.card.darkBlue,
                  ),
                ),
                SizedBox(height: ScreenPadding.padding58px * 1.5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _reviewsHeadline(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: TobetoText.evaluationHeadline1part1,
        style: TobetoTextStyle.poppins(context).titlePurpleNormal24,
        children: <TextSpan>[
          TextSpan(
            text: TobetoText.evaluationHeadline1part2,
            style: TobetoTextStyle.poppins(context).titleGrayDarkNormal24,
          ),
          TextSpan(
            text: TobetoText.evaluationHeadline1part3,
            style: TobetoTextStyle.poppins(context).titlePurpleNormal24,
          ),
          TextSpan(
            text: TobetoText.evaluationHeadline1part4,
            style: TobetoTextStyle.poppins(context).titleGrayDarkNormal24,
          ),
        ],
      ),
    );
  }

  Widget _reviewsCard(
    BuildContext context, {
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
            style: TobetoTextStyle.poppins(context).subtitleWhiteSemiBold20,
            textAlign: TextAlign.center,
          ),
          Text(
            subheading,
            style: TobetoTextStyle.poppins(context).captionWhiteNormal14,
            textAlign: TextAlign.center,
          ),
          isThereButton
              ? Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                  child: CustomReviewButton(
                    buttonText: TobetoText.evaluationCardButton,
                    backgroundColor: TobetoColor.purple,
                    style:
                        TobetoTextStyle.poppins(context).captionWhiteNormal14,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TobetoSuccesScreen(),
                        ),
                      );
                    },
                  ),
                )
              : dividerText != null
                  ? Padding(
                      padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                      child: Text(
                        dividerText,
                        style:
                            TobetoTextStyle.poppins(context).bodyWhiteNormal16,
                      ),
                    )
                  : const SizedBox(),
          title != null
              ? Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                  child: Text(
                    title,
                    style: TobetoTextStyle.poppins(context).bodyWhiteSemiBold16,
                    textAlign: TextAlign.center,
                  ),
                )
              : const SizedBox(),
          subTitle != null
              ? Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                  child: Text(
                    subTitle,
                    style:
                        TobetoTextStyle.poppins(context).captionWhiteSemiBold8,
                    textAlign: TextAlign.center,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _examCard(BuildContext context, {required UserExam exam}) {
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
          Image.asset(
              height: ScreenUtil.getHeight(context) * 0.06,
              width: ScreenUtil.getHeight(context) * 0.06,
              ImagePath.platformIcon),
          SizedBox(width: ScreenPadding.padding8px),
          Expanded(
            child: Text(
              exam.exam.exam,
              style: TobetoTextStyle.poppins(context).subtitleWhiteSemiBold20,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          CustomReviewButton(
            onPressed: () {
              _showCustomDialog(context, exam);
            },
            backgroundColor: TobetoColor.card.white,
            buttonText: TobetoText.evaluationCardButton,
            style: TobetoTextStyle.poppins(context).captionBlackBold12,
          ),
        ],
      ),
    );
  }

  Widget _rainbowDivider(BuildContext context) {
    return Container(
      height: ScreenUtil.getHeight(context) * 0.16,
      width: ScreenUtil.getWidth(context) * 0.02,
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

  Widget _reviewsHeadline2(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: TobetoText.evaluationHeadlineTitle2,
        style: TobetoTextStyle.poppins(context).titlePurpleNormal24,
        children: <TextSpan>[
          TextSpan(
            text: TobetoText.evaluationHeadlineSubTitle2,
            style: TobetoTextStyle.poppins(context).titleGrayDarkNormal24,
          ),
        ],
      ),
    );
  }

  void _showCustomDialog(BuildContext context, UserExam exam) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${exam.exam.exam}\n',
                  style:
                      TobetoTextStyle.poppins(context).subtitleBlackSemiBold20,
                ),
                TextSpan(
                  text:
                      'Bu sınav 25 sorudan oluşmakta olup sınav süresi 30 dakikadır. Sınav çoktan seçmeli test şeklinde olup sınavı yarıda bıraktığınız taktirde çözdüğünüz kısım kadarıyla değerlendirileceksiniz.\n\n',
                  style: TobetoTextStyle.poppins(context).captionBlackNormal15,
                ),
                TextSpan(
                  text:
                      'Sınav Süresi : ${exam.exam.duration} Dakika Soru\nSayısı : ${exam.exam.duration}\nSoru Tipi : ${exam.exam.numberOfQuestion}',
                  style:
                      TobetoTextStyle.poppins(context).captionBlackSemiBold15,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            CustomReviewButton(
              buttonText: TobetoText.evaluationCardButton,
              backgroundColor: TobetoColor.purple,
              style: TobetoTextStyle.poppins(context).captionWhiteBold12,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AreaExamScreen(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
