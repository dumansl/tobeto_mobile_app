import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/login_screen/login_widgets/custom_logo.dart';
import 'package:tobeto_mobile_app/screens/login_screen/password_reset_screen.dart';
import 'package:tobeto_mobile_app/screens/login_screen/register_screen.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/horizontal_page_route.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

import 'login_widgets/custom_button.dart';
import 'login_widgets/custom_text_button.dart';
import 'login_widgets/input_text_form_field.dart';
import 'login_widgets/custom_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<bool> _selectedUserRole = <bool>[true, false];
  bool _showPassword = false;

  List<Widget> userRole = <Widget>[
    const Text('Öğrenci'),
    const Text('Eğitmen'),
  ];

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
              children: [
                Expanded(
                  flex: 10,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: _buildUserRoleToggleButtons(),
                  ),
                ),
                const Expanded(
                  flex: 15,
                  child: CustomLogo(),
                ),
                Expanded(
                  flex: 40,
                  child: _loginContent(),
                ),
                Expanded(
                  flex: 35,
                  child: _anotherLogin(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserRoleToggleButtons() {
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < _selectedUserRole.length; i++) {
            _selectedUserRole[i] = i == index;
          }
        });
      },
      borderRadius: BorderRadius.all(
        Radius.circular(SizeRadius.radius16px),
      ),
      selectedBorderColor: TobetoColor.purple,
      selectedColor: Theme.of(context).colorScheme.primary,
      fillColor: TobetoColor.purple,
      color: TobetoColor.purple,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.055,
        minWidth: MediaQuery.of(context).size.width * 0.2,
      ),
      isSelected: _selectedUserRole,
      children: userRole,
    );
  }

  Widget _loginContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InputTextFormField(
          hintText: TobetoText.loginUserEmail,
        ),
        InputTextFormField(
          hintText: TobetoText.loginUserPassword,
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
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              createHorizontalPageRoute(const PasswordResetScreen()),
            );
          },
          child: Text(
            TobetoText.loginForgotPassword,
            style: TobetoTextStyle.inter.captionGrayDarkSemiBold15,
          ),
        ),
        CustomButton(
          onPressed: () {},
          text: TobetoText.loginButton,
        ),
      ],
    );
  }

  Widget _anotherLogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginTitleDivider(
          text: TobetoText.loginAlternative,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: ScreenPadding.screenpadding),
          child: Column(
            children: [
              _customframe(
                onTap: () {},
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenPadding.padding16px),
                      child: Image.asset(ImagePath.visitorIcon),
                    ),
                    Text(
                      TobetoText.loginGuestButton,
                      style: TobetoTextStyle.inter.captionGrayLightNormal15,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding8px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _customframe(
                      width: ScreenUtil.getWidth(context) * 0.35,
                      onTap: () {},
                      child: Image.asset(ImagePath.googleIcon),
                    ),
                    _customframe(
                      width: ScreenUtil.getWidth(context) * 0.35,
                      onTap: () {},
                      child: Image.asset(ImagePath.facebookIcon),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        CustomTextButton(
          text: TobetoText.loginSubtitle,
          textbold: TobetoText.loginRegisterButton,
          onPressed: () {
            Navigator.push(
              context,
              createHorizontalPageRoute(const RegisterScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _loginTitleDivider({required String text}) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: TobetoColor.frame.lightGrey,
            thickness: 2,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenPadding.padding8px),
          child: Text(
            text,
            style: TobetoTextStyle.inter.captionGrayDarkSemiBold15,
          ),
        ),
        Expanded(
          child: Divider(
            color: TobetoColor.frame.lightGrey,
            thickness: 2,
          ),
        ),
      ],
    );
  }

  Widget _customframe(
      {required Widget child, required VoidCallback onTap, double? width}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: ScreenUtil.getHeight(context) * 0.08,
        width: width,
        padding: EdgeInsets.symmetric(
          vertical: ScreenPadding.padding8px,
        ),
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeRadius.radius8px),
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
        child: child,
      ),
    );
  }
}
