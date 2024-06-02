import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

import 'login_widgets/custom_background.dart';
import 'login_widgets/custom_button.dart';
import 'login_widgets/custom_logo.dart';
import 'login_widgets/input_text_form_field.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const CustomBackground(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenPadding.screenpadding,
              vertical: ScreenPadding.screenpadding * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 25,
                  child: CustomLogo(),
                ),
                Expanded(
                  flex: 35,
                  child: _passwordRegisterScreenContent(),
                ),
                const Expanded(
                  flex: 45,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _passwordRegisterScreenContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TobetoText.passwordResetTitle,
          style: TobetoTextStyle.inter.headlineGrayMediumBold32,
        ),
        InputTextFormField(
          hintText: TobetoText.passwordResetBoxText,
        ),
        CustomButton(
          onPressed: () {},
          text: TobetoText.passwordResetButtonText,
        ),
      ],
    );
  }
}
