import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto_mobile_app/screens/login_screen/login_widgets/custom_leading.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/horizontal_page_route.dart';
import 'package:tobeto_mobile_app/utils/snack_bar.dart';

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
  final formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  String _name = "";
  String _lastName = "";

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.outline,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ),
            );
          } else if (state is LoginError) {
            snackBar(
              context,
              TobetoText.registerError,
            );
          }
        },
        child: Stack(
          children: [
            const CustomBackground(),
            const CustomLeading(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenPadding.screenpadding * 2,
                vertical: ScreenPadding.screenpadding * 2,
              ),
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CustomLogo(
                      width: ScreenUtil.getWidth(context) * 0.65,
                      height: ScreenUtil.getHeight(context) * 0.07,
                    ),
                    const SizedBox(height: 20),
                    _registerContent(),
                    const SizedBox(height: 10),
                    _loginScreenNavigator(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerContent() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InputTextFormField(
              hintText: TobetoText.signUpName,
              focusNode: _nameFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_lastNameFocusNode);
              },
              onSaved: (newValue) {
                _name = newValue!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return TobetoText.registerValidatorName;
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InputTextFormField(
              hintText: TobetoText.signUpSurname,
              focusNode: _lastNameFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_emailFocusNode);
              },
              onSaved: (newValue) {
                _lastName = newValue!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return TobetoText.registerValidatorSurname;
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InputTextFormField(
              keyboardType: TextInputType.emailAddress,
              hintText: TobetoText.signUpEmail,
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
                  return TobetoText.registerValidatorEmail;
                } else if (!value.contains('@')) {
                  return TobetoText.registerValidatorEmailV2;
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InputTextFormField(
              hintText: TobetoText.signUpPassword,
              focusNode: _passwordFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
              },
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return TobetoText.registerValidatorPassword;
                } else if (value.length < 6) {
                  return TobetoText.registerValidatorPasswordV2;
                }
                return null;
              },
              obscureText: !_showPassword,
              onSaved: (newValue) {
                _password = newValue!;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InputTextFormField(
              hintText: TobetoText.signUpPasswordAgain,
              focusNode: _confirmPasswordFocusNode,
              textInputAction: TextInputAction.done,
              obscureText: !_showConfirmPassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _showConfirmPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.surfaceContainer,
                ),
                onPressed: () {
                  setState(() {
                    _showConfirmPassword = !_showConfirmPassword;
                  });
                },
              ),
              onSaved: (newValue) {
                _confirmPassword = newValue!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return TobetoText.registerValidatorConfirmPassword;
                }
                return null;
              },
            ),
          ),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                if (_password != _confirmPassword) {
                  snackBar(context, TobetoText.registerConfirmPasswordError);
                  return;
                }
                context.read<AuthBloc>().add(
                      RegisterEvent(
                        email: _email,
                        password: _password,
                        name: _name,
                        lastName: _lastName,
                      ),
                    );
              }
            },
            text: TobetoText.loginRegisterButton,
          ),
        ],
      ),
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
