import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/communication_screen/widgets/communication_text_field.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/communication_screen/widgets/side_title_and_comment.dart';
import 'package:tobeto_mobile_app/screens/login_screen/login_screen.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CommunicationScreen extends StatelessWidget {
  const CommunicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TobetoColor.card.cream,
        title: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding24px),
          child: Image.asset(ImagePath.greyTobeto),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(ImagePath.purpleBack),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(ImagePath.profilePhoto),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  TobetoText.tcommunucationTitle1,
                  style: TobetoTextStyle.poppins(context).titleBlackBold24,
                ),
              ),
              const SizedBox(height: 10),
              sideTitleAndComment(TobetoText.tcommunucationSideTitle1, TobetoText.tcommunucationComment1),
              sideTitleAndComment(TobetoText.tcommunucationSideTitle2, TobetoText.tcommunucationComment2),
              sideTitleAndComment(TobetoText.tcommunucationSideTitle3, TobetoText.tcommunucationComment3),
              sideTitleAndComment(TobetoText.tcommunucationSideTitle4, TobetoText.tcommunucationComment4),
              sideTitleAndComment(TobetoText.tcommunucationSideTitle5, TobetoText.tcommunucationComment5),
              sideTitleAndComment(TobetoText.tcommunucationSideTitle6, TobetoText.tcommunucationComment6),
              sideTitleAndComment(TobetoText.tcommunucationSideTitle7, TobetoText.tcommunucationComment7),
              sideTitleAndComment(TobetoText.tcommunucationSideTitle8, TobetoText.tcommunucationComment8),
              sideTitleAndComment(TobetoText.tcommunucationSideTitle9, TobetoText.tcommunucationComment9),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  TobetoText.tcommunucationTitle2,
                  style: TobetoTextStyle.poppins(context).subtitleBlackBold20,
                ),
              ),
              const SizedBox(height: 10),
              communicationTextField(TobetoText.tcommunucationNameBox, 1),
              communicationTextField(TobetoText.tcommunucationMailBox, 1),
              communicationTextField(TobetoText.tcommunucationMessageBox, 5),
              const SizedBox(height: 20),
              Text(
                TobetoText.tcommunucationSubtitle,
                style: TobetoTextStyle.poppins(context).captionLightGrayNormal12,
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TobetoColor.purple,
                    textStyle: TobetoTextStyle.poppins(context).bodyWhiteBold16,
                  ),
                  child: Text(TobetoText.tcommunucationSendButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
