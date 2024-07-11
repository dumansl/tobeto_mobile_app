import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/widgets/communication_text_field.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/widgets/side_title_and_comment.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CommunicationScreen extends StatefulWidget {
  const CommunicationScreen({super.key});

  @override
  State<CommunicationScreen> createState() => _CommunicationScreenState();
}

class _CommunicationScreenState extends State<CommunicationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Future<void> sendMessage(context) async {
    // Check if all fields are filled
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lütfen ilgili yerleri doldurun'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Check if email is valid
    if (!isValidEmail(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Geçerli bir e-posta adresi girin'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('messages').add({
        'name': nameController.text,
        'email': emailController.text,
        'message': messageController.text,
        'timestamp': Timestamp.now(),
      });

      // Clear text fields after successful message send
      setState(() {
        nameController.text = '';
        emailController.text = '';
        messageController.text = '';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mesajınız başarıyla iletildi!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Mesajınız gönderilemedi: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FixedAppbar(
        isTobetoScreen: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ScreenPadding.padding16px),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                TobetoText.tcommunucationTitle1,
                style: TobetoTextStyle.poppins(context).titleBlackBold24,
              ),
            ),
            SizedBox(height: ScreenPadding.padding10px),
            sideTitleAndComment(
              context,
              TobetoText.tcommunucationSideTitle1,
              TobetoText.tcommunucationComment1,
            ),
            sideTitleAndComment(
              context,
              TobetoText.tcommunucationSideTitle2,
              TobetoText.tcommunucationComment2,
            ),
            sideTitleAndComment(
              context,
              TobetoText.tcommunucationSideTitle3,
              TobetoText.tcommunucationComment3,
            ),
            sideTitleAndComment(
              context,
              TobetoText.tcommunucationSideTitle4,
              TobetoText.tcommunucationComment4,
            ),
            sideTitleAndComment(
              context,
              TobetoText.tcommunucationSideTitle5,
              TobetoText.tcommunucationComment5,
            ),
            sideTitleAndComment(
              context,
              TobetoText.tcommunucationSideTitle6,
              TobetoText.tcommunucationComment6,
            ),
            sideTitleAndComment(
              context,
              TobetoText.tcommunucationSideTitle7,
              TobetoText.tcommunucationComment7,
            ),
            sideTitleAndComment(
              context,
              TobetoText.tcommunucationSideTitle8,
              TobetoText.tcommunucationComment8,
            ),
            sideTitleAndComment(
              context,
              TobetoText.tcommunucationSideTitle9,
              TobetoText.tcommunucationComment9,
            ),
            SizedBox(height: ScreenPadding.padding20px),
            Center(
              child: Text(
                TobetoText.tcommunucationTitle2,
                style: TobetoTextStyle.poppins(context).subtitleBlackBold20,
              ),
            ),
            SizedBox(height: ScreenPadding.padding10px),
            communicationTextField(
              context,
              TobetoText.tcommunucationNameBox,
              1,
              textEditingController: nameController,
            ),
            communicationTextField(
              context,
              TobetoText.tcommunucationMailBox,
              1,
              textEditingController: emailController,
            ),
            communicationTextField(
              context,
              TobetoText.tcommunucationMessageBox,
              5,
              textEditingController: messageController,
            ),
            SizedBox(height: ScreenPadding.padding10px),
            Text(
              TobetoText.tcommunucationSubtitle,
              style: TobetoTextStyle.poppins(context).captionGrayNormal12,
            ),
            SizedBox(height: ScreenPadding.padding30px),
            Center(
              child: ElevatedButton(
                onPressed: () => sendMessage(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: TobetoColor.purple,
                  textStyle: TobetoTextStyle.poppins(context).bodyWhiteBold16,
                ),
                child: Text(TobetoText.tcommunucationSendButton),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
