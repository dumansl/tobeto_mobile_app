import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class GeneralTab extends StatefulWidget {
  const GeneralTab({super.key});

  @override
  State<GeneralTab> createState() => _GeneralTabState();
}

class _GeneralTabState extends State<GeneralTab> {
  final _formKey = GlobalKey<FormState>();
  late ImagePath imagepath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenPadding.padding12px),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(ImagePath.profilePhoto),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: TobetoColor.card.shadowColor,
                      blurRadius: 6,
                      spreadRadius: 0,
                      offset: const Offset(
                        0,
                        3,
                      ),
                    )
                  ]),
              child: const InputText(),
            ),
            const SizedBox(
              height: 20,
            ),
            IntlPhoneField(
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.purple, width: 2.0),
                ),
                labelText: 'Telefon Numaranız',
                labelStyle: TextStyle(
                  color: TobetoColor.card.grey,
                  fontSize: 20,
                ),
                // contentPadding: EdgeInsets.only(left: 20),
                floatingLabelStyle: TobetoTextStyle.poppins.titlePurpleNormal24,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              initialCountryCode: 'TR',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Soyadınız'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen soyadınızı girin';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Doğum Tarihi'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen doğum tarihinizi girin';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Bilgiler kaydedildi')));
                }
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
