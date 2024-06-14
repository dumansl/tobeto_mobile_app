import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_event.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';
import 'package:tobeto_mobile_app/screens/login_screen/login_widgets/custom_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/services/user_repository.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import 'package:date_format_field/date_format_field.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  final _formKey = GlobalKey<FormState>();
  final userRepository = UserRepository();
  PlatformFile? pickedfile;

  // final fileExtension = pickedfile!.extension;
  //   if (fileExtension != 'pdf' && fileExtension != 'docx') {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text("Sadece .pdf ve .docx dosyaları yüklenebilir"),
  //       ),
  //     );
  //     return;
  //   }
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Hata: ${state.message}')),
          );
        } else if (state is UserFileUploaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Dosya başarıyla yüklendi')),
          );
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return Form(
              key: _formKey,
              child: ListView(
                children: [
                  InputText(
                    child: CustomTextField(
                      title: TobetoText.profileEditCertificatesName,
                      onSaved: (value) {},
                      controller:
                          userRepository.profileEditCertificatesNameController,
                    ),
                  ),
                  InputText(
                    child: DateFormatField(
                      controller: userRepository.certificateDateController,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: TobetoColor.purple, width: 2.0),
                        ),
                        labelText: TobetoText.profileEditStartJobDate,
                        labelStyle: TobetoTextStyle.poppins(context)
                            .bodyGrayLightNormal16,
                        floatingLabelStyle: TobetoTextStyle.poppins(context)
                            .captionPurpleNormal18,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      type: DateFormatType.type2,
                      onComplete: (date) {
                        debugPrint(date.toString());
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: TobetoColor.card.cream,
                    ),
                    onPressed: () async {
                      await userRepository.selectFile();
                      setState(() {
                        pickedfile = userRepository.pickedfile;
                      });
                    },
                    child: Text(
                      'Dosya Yükle',
                      style: TobetoTextStyle.poppins(context).titlePurpleBold24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomButton(
                      text: TobetoText.profileEditSaveButton,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<UserBloc>(context)
                              .add(UploadUserDAte(context));
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is UserError) {
            return Center(child: Text('Hata: ${state.message}'));
          } else {
            return const Center(child: Text('Kullanıcı durumu bilinmiyor.'));
          }
        },
      ),
    );
  }
}
