import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/snack_bar.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final _formKey = GlobalKey<FormState>();
  String _oldPassword = "";
  String _password = "";
  String _confirmPassword = "";

  final FocusNode _oldPasswordFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          CustomTitle(title: TobetoText.profileEditSettings),
          InputText(
            child: CustomTextField(
              focusNode: _oldPasswordFocusNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen bir şifre girin';
                } else if (value.length < 6) {
                  return 'Şifreniz en az 6 karakter olmalıdır';
                }
                return null;
              },
              onSaved: (newValue) {
                _oldPassword = newValue!;
              },
              title: TobetoText.profileEditSettingsOldPassword,
            ),
          ),
          InputText(
            child: CustomTextField(
              focusNode: _passwordFocusNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen bir şifre girin';
                } else if (value.length < 6) {
                  return 'Şifreniz en az 6 karakter olmalıdır';
                }
                return null;
              },
              onSaved: (newValue) {
                _password = newValue!;
              },
              title: TobetoText.profileEditSettingsNewPassword,
            ),
          ),
          InputText(
            child: CustomTextField(
              focusNode: _confirmPasswordFocusNode,
              onSaved: (newValue) {
                _confirmPassword = newValue!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen şifrenizi tekrar girin';
                }
                return null;
              },
              title: TobetoText.profileEditSettingsOldPasswordAgain,
            ),
          ),
          CustomElevatedButton(
            text: TobetoText.profileEditSaveButton,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (_password != _confirmPassword) {
                  snackBar(context, 'Parolalar uyuşmuyor');
                  return;
                }
                context.read<AuthBloc>().add(
                      ChangePasswordEvent(
                        currentPassword: _oldPassword,
                        newPassword: _password,
                      ),
                    );
              }
            },
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is DeleteAccountSuccess) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              } else if (state is DeleteAccountError) {
                snackBar(
                  context,
                  'Hesap silinirken hata oluştu: ${state.errorMessage}',
                  bgColor: TobetoColor.state.error,
                );
              }
            },
            builder: (context, state) {
              if (state is DeleteAccountProgress) {
                return const Center(child: CircularProgressIndicator());
              }
              return CustomElevatedButton(
                text: TobetoText.profileEditSettingsFinalButton,
                onPressed: () {
                  _showDeleteConfirmationDialog(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            TobetoText.profileEditSettingsFinalButton,
            style: const TextStyle(color: Colors.black),
          ),
          content: const Text(
            'Üyeliği sonlandırmak istediğinize emin misiniz?',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'İptal',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(const DeleteAccountEvent());
                Navigator.of(context).pop();
              },
              child: const Text(
                'Evet',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
