import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/snack_bar.dart';
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
  final formKey = GlobalKey<FormState>();
  String _email = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            snackBar(
              context,
              "Şifre sıfırlama e-postası gönderildi. Lütfen emailinizi kontrol edin.",
            );
          } else if (state is ResetPasswordError) {
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
                horizontal: ScreenPadding.screenpadding * 2,
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
      ),
    );
  }

  Widget _passwordRegisterScreenContent() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TobetoText.passwordResetTitle,
            style: TobetoTextStyle.inter(context).headlineGrayMediumBold32,
          ),
          InputTextFormField(
            hintText: TobetoText.passwordResetBoxText,
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) {
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
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<AuthBloc>().add(ResetPasswordEvent(email: _email));
              }
            },
            text: TobetoText.passwordResetButtonText,
          ),
        ],
      ),
    );
  }
}
