import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      style: TobetoTextStyle.poppins.bodyBlackSemiBold16,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.purple, width: 2.0),
        ),
        labelText: 'Adınız',
        labelStyle: TextStyle(
          color: TobetoColor.card.grey,
          fontSize: 20,
        ),
        // contentPadding: EdgeInsets.only(left: 20),
        floatingLabelStyle: TobetoTextStyle.poppins.titlePurpleNormal24,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(12),
        )),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Lütfen adınızı girin';
        }
        return null;
      },
    );
  }
}
