import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      invalidNumberMessage: null,
      cursorColor: TobetoColor.card.grey,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: InputBorder.none,
        counterText: "",
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
        ),
        labelText: TobetoText.profileEditPhoneNumber,
        labelStyle: TobetoTextStyle.poppins.bodyGrayLightNormal16,
        floatingLabelStyle: TobetoTextStyle.poppins.captionPurpleNormal18,
      ),
      initialCountryCode: 'TR',
      onChanged: (phone) {
        debugPrint(phone.completeNumber);
      },
    );
  }
}
