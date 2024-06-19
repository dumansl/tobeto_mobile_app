import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto_mobile_app/screens/login_screen/login_screen.dart';
import 'package:tobeto_mobile_app/screens/login_screen/login_widgets/custom_button.dart';
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
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          // InputText(
          //   child: CustomTextField(
          //     title: TobetoText.profileEditSettingsOldPassword,
          //   ),
          // ),
          // InputText(
          //   child: CustomTextField(
          //     title: TobetoText.profileEditSettingsNewPassword,
          //   ),
          // ),
          // InputText(
          //   child: CustomTextField(
          //     title: TobetoText.profileEditSettingsOldPasswordAgain,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 10),
          //   child: CustomButton(
          //     text: TobetoText.profileEditSaveButton,
          //     onPressed: () {},
          //   ),
          // ),
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
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _showDeleteConfirmationDialog(context);
                      },
                      child: const Text(
                        'Hesabımı Sil',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomButton(
              text: TobetoText.profileEditSettingsFinalButton,
              onPressed: () {
                _showDeleteConfirmationDialog(context);
              },
            ),
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
            'Hesabı silmek istediğinize emin misiniz?',
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
