import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/login_screen/login_screen.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/horizontal_page_route.dart';

import 'login_widgets/custom_background.dart';
import 'login_widgets/custom_button.dart';
import 'login_widgets/custom_logo.dart';
import 'login_widgets/custom_text_button.dart';
import 'login_widgets/input_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBackground(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenPadding.screenpadding,
              vertical: ScreenPadding.screenpadding * 2,
            ),
            child: Column(
              children: [
                const Expanded(
                  flex: 20,
                  child: CustomLogo(),
                ),
                Expanded(
                  flex: 70,
                  child: _registerContent(),
                ),
                Expanded(
                  flex: 10,
                  child: Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: _loginScreenNavigator()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _registerContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InputTextFormField(
          hintText: TobetoText.signUpName,
        ),
        InputTextFormField(
          hintText: TobetoText.signUpSurname,
        ),
        InputTextFormField(
          hintText: TobetoText.signUpEmail,
        ),
        InputTextFormField(
          hintText: TobetoText.signUpPassword,
          obscureText: !_showPassword,
          suffixIcon: IconButton(
            icon: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            onPressed: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
          ),
        ),
        InputTextFormField(
          hintText: TobetoText.signUpPasswordAgain,
          obscureText: !_showPassword,
          suffixIcon: IconButton(
            icon: Icon(
              _showConfirmPassword ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            onPressed: () {
              setState(() {
                _showConfirmPassword = !_showConfirmPassword;
              });
            },
          ),
        ),
        CustomButton(
          onPressed: () {},
          text: TobetoText.loginRegisterButton,
        ),
      ],
    );
  }

  Widget _loginScreenNavigator() {
    return CustomTextButton(
      text: TobetoText.signUpSubtitle,
      textbold: TobetoText.registerLoginButton,
      onPressed: () {
        Navigator.push(
          context,
          createHorizontalPageRoute(const LoginScreen()),
        );
      },
    );
  }
}
