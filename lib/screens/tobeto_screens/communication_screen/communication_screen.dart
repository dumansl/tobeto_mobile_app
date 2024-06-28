import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/widgets/communication_text_field.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/widgets/side_title_and_comment.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CommunicationScreen extends StatelessWidget {
  const CommunicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FixedAppbar(
        isLeading: false,
        isTobetoScreen: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding16px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: ScreenPadding.padding10px),
                child: Center(
                  child: Text(
                    TobetoText.tcommunucationTitle1,
                    style: TobetoTextStyle.poppins(context).titleBlackBold24,
                  ),
                ),
              ),
              sideTitleAndComment(context, TobetoText.tcommunucationSideTitle1, TobetoText.tcommunucationComment1),
              sideTitleAndComment(context, TobetoText.tcommunucationSideTitle2, TobetoText.tcommunucationComment2),
              sideTitleAndComment(context, TobetoText.tcommunucationSideTitle3, TobetoText.tcommunucationComment3),
              sideTitleAndComment(context, TobetoText.tcommunucationSideTitle4, TobetoText.tcommunucationComment4),
              sideTitleAndComment(context, TobetoText.tcommunucationSideTitle5, TobetoText.tcommunucationComment5),
              sideTitleAndComment(context, TobetoText.tcommunucationSideTitle6, TobetoText.tcommunucationComment6),
              sideTitleAndComment(context, TobetoText.tcommunucationSideTitle7, TobetoText.tcommunucationComment7),
              sideTitleAndComment(context, TobetoText.tcommunucationSideTitle8, TobetoText.tcommunucationComment8),
              sideTitleAndComment(context, TobetoText.tcommunucationSideTitle9, TobetoText.tcommunucationComment9),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding20px, bottom: ScreenPadding.padding10px),
                child: Center(
                  child: Text(
                    TobetoText.tcommunucationTitle2,
                    style: TobetoTextStyle.poppins(context).subtitleBlackBold20,
                  ),
                ),
              ),
              communicationTextField(context, TobetoText.tcommunucationNameBox, 1),
              communicationTextField(context, TobetoText.tcommunucationMailBox, 1),
              communicationTextField(context, TobetoText.tcommunucationMessageBox, 5),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding10px),
                child: Text(
                  TobetoText.tcommunucationSubtitle,
                  style: TobetoTextStyle.poppins(context).captionGrayNormal12,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TobetoColor.purple,
                      textStyle: TobetoTextStyle.poppins(context).bodyWhiteBold16,
                    ),
                    child: Text(TobetoText.tcommunucationSendButton),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
