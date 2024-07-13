import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/export_bloc.dart';

import 'package:tobeto_mobile_app/screens/login_screen/login_widgets/custom_logo.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/screens/tobeto_educator/dasboard-educator/dashboard_screen_educator.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/tobeto_screens.dart';
import 'package:tobeto_mobile_app/services/auth_service.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/horizontal_page_route.dart';
import 'package:tobeto_mobile_app/utils/snack_bar.dart';
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
  final AuthService _authService = AuthService();
  final List<bool> _selectedUserRole = <bool>[true, false];
  bool _showPassword = false;
  bool _educatorSwitch = false;

  final formKey = GlobalKey<FormState>();
  List<Widget> userRole = <Widget>[
    Text(TobetoText.loginStudent),
    Text(TobetoText.loginEducator),
  ];

  String _email = "";
  String _password = "";

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.outline,
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is LoginSuccess) {
            if (_authService.currentUser != null && _authService.currentUser!.emailVerified) {
              _educatorSwitch
                  ? Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const DashboardScreenEducator()))
                  : Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardScreen()),
                    );
            } else if (_authService.currentUser?.isAnonymous ?? false) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TobetoHomeScreen()),
              );
            } else {
              snackBar(context, 'E-posta adresiniz doğrulanmadı. Lütfen doğrulama e-postasını kontrol edin.');
              await FirebaseAuth.instance.signOut();
            }
          } else if (state is LoginError) {
            if (state.errorMessage != null) {
              snackBar(
                context,
                state.errorMessage!,
              );
            } else {
              snackBar(
                context,
                TobetoText.loginLoginError,
              );
            }
          }
        },
        child: Stack(
          children: [
            CustomBackground(educatorSwitch: _educatorSwitch),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenPadding.screenpadding * 2,
                vertical: ScreenPadding.screenpadding * 4,
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
                  Expanded(
                    flex: 15,
                    child: CustomLogo(
                      width: ScreenUtil.getWidth(context) * 0.65,
                    ),
                  ),
                  Expanded(
                    flex: 43,
                    child: _loginContent(),
                  ),
                  Expanded(
                    flex: 32,
                    child: _educatorSwitch ? const SizedBox() : _anotherLogin(),
                  ),
                ],
              ),
            ),
          ],
        ),
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
          if (index == 0) {
            _educatorSwitch = false;
          } else {
            _educatorSwitch = true;
          }
        });
      },
      borderRadius: BorderRadius.all(
        Radius.circular(SizeRadius.radius16px),
      ),
      selectedBorderColor: TobetoColor.purple,
      selectedColor: TobetoColor.text.white,
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
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InputTextFormField(
            hintText: TobetoText.loginUserEmail,
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocusNode,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            onSaved: (newValue) {
              _email = newValue!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return TobetoText.loginValidatorEmail;
              }

              return null;
            },
          ),
          InputTextFormField(
            hintText: TobetoText.loginUserPassword,
            obscureText: !_showPassword,
            focusNode: _passwordFocusNode,
            textInputAction: TextInputAction.done,
            suffixIcon: IconButton(
              icon: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
            ),
            onSaved: (newValue) {
              _password = newValue!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return TobetoText.loginValidatorPassword;
              }
              return null;
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                createHorizontalPageRoute(const PasswordResetScreen()),
              );
            },
            child: _educatorSwitch
                ? const SizedBox()
                : Text(
                    TobetoText.loginForgotPassword,
                    style: TobetoTextStyle.inter(context).captionGrayDarkSemiBold15,
                  ),
          ),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<AuthBloc>().add(LoginEvent(email: _email, password: _password));
              }
            },
            text: TobetoText.loginButton,
          ),
        ],
      ),
    );
  }

  Widget _anotherLogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: _loginTitleDivider(
            text: TobetoText.loginAlternative,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenPadding.screenpadding),
          child: Column(
            children: [
              _customframe(
                onTap: () {
                  context.read<AuthBloc>().add(const GuestLoginEvent());
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenPadding.padding16px),
                      child: Image.asset(ImagePath.visitorIcon),
                    ),
                    Text(
                      TobetoText.loginGuestButton,
                      style: TobetoTextStyle.inter(context).captionGrayLightNormal15,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding8px),
                child: _customframe(
                  onTap: () {
                    context.read<AuthBloc>().add(const GoogleLoginEvent());
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: ScreenPadding.padding16px),
                        child: Image.asset(ImagePath.googleIcon),
                      ),
                      Text(
                        TobetoText.loginGoogleButton,
                        style: TobetoTextStyle.inter(context).captionGrayLightNormal15,
                      ),
                    ],
                  ),
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
            style: TobetoTextStyle.inter(context).captionGrayDarkSemiBold15,
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

  Widget _customframe({required Widget child, required VoidCallback onTap, double? width}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: ScreenUtil.getHeight(context) * 0.08,
        width: width,
        padding: EdgeInsets.symmetric(
          vertical: ScreenPadding.padding8px,
        ),
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
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
