import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class TobetoSuccesScreen extends StatelessWidget {
  const TobetoSuccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(ScreenUtil.getHeight(context).toString());
    return Scaffold(
      backgroundColor: TobetoColor.background.lightGrey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 15, child: Center(child: _tobetoSuccesHeadline())),
            Expanded(
              flex: 85,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
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
                                style: TobetoTextStyle
                                    .poppins.bodyGrayDarkNormal16,
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 16),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Table(
                                    border: TableBorder.all(color: Colors.grey),
                                    columnWidths: {
                                      0: FlexColumnWidth(1.0),
                                      1: FlexColumnWidth(4.0),
                                    },
                                    children: [
                                      TableRow(children: [
                                        _tableCell('--'),
                                        _tableCell(
                                            'Bu konuda hiç ama hiç iyi değilim'),
                                      ]),
                                      TableRow(children: [
                                        _tableCell('-'),
                                        _tableCell('Bu konuda pek iyi değilim'),
                                      ]),
                                      TableRow(children: [
                                        _tableCell('0'),
                                        _tableCell(
                                            'Bu konuda ortalama düzeydeyim, ne iyi ne kötü'),
                                      ]),
                                      TableRow(children: [
                                        _tableCell('+'),
                                        _tableCell('Bu konuda iyiyim'),
                                      ]),
                                      TableRow(children: [
                                        _tableCell('++'),
                                        _tableCell(
                                            'Bu konuda çok ama çok iyiyim.'),
                                      ]),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tobetoSuccesHeadline() {
    return Text(
      TobetoText.evaluationCard1Title,
      style: TobetoTextStyle.poppins.titlePurpleBold24,
    );
  }

  Widget _startEvaluateButton(BuildContext context) {
    return InkWell(
      onTap: () {},
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
            TobetoText.evaluationCard5,
            style: TobetoTextStyle.poppins.captionWhiteNormal14,
          ),
        ),
      ),
    );
  }

  Widget _tableCell(String text) {
    return Padding(
      padding: EdgeInsets.all(ScreenPadding.padding8px),
      child: Text(text, style: TobetoTextStyle.poppins.captionGrayDarkLight15),
    );
  }
}
