import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_state.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              "Kayıt olurken yaparken bir hata oluştu! Lütfen tekrar deneyin.",
            );
          }
        },
        child: Stack(
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
                    child: Align(alignment: AlignmentDirectional.topCenter, child: _loginScreenNavigator()),
                  ),
                ],
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
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InputTextFormField(
            hintText: TobetoText.signUpName,
            onSave: (newValue) {
              _name = newValue!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Lütfen adınızı girin';
              }
              return null;
            },
          ),
          InputTextFormField(
            hintText: TobetoText.signUpSurname,
            onSave: (newValue) {
              _lastName = newValue!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Lütfen soyadınızı girin';
              }
              return null;
            },
          ),
          InputTextFormField(
            keyboardType: TextInputType.emailAddress,
            hintText: TobetoText.signUpEmail,
            onSave: (newValue) {
              _email = newValue!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Lütfen e-posta adresinizi girin';
              } else if (!value.contains('@')) {
                return 'Geçerli bir e-posta adresi girin';
              }
              return null;
            },
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Lütfen bir şifre girin';
              } else if (value.length < 6) {
                return 'Şifreniz en az 6 karakter olmalıdır';
              }
              return null;
            },
            onSave: (newValue) {
              _password = newValue!;
            },
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
            onSave: (newValue) {
              _confirmPassword = newValue!;
            },
          ),
          CustomButton(
            onPressed: () {
              formKey.currentState!.save();
              if (_password == _confirmPassword) {
                context.read<AuthBloc>().add(
                      RegisterEvent(
                        email: _email,
                        password: _password,
                        name: _name,
                        lastName: _lastName,
                      ),
                    );
              } else {
                snackBar(
                  context,
                  "Parolalar uyuşmuyor",
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
