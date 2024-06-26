import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      style: TobetoTextStyle.poppins(context).bodyBlackBold16,
      controller: controller,
      invalidNumberMessage: null,
      cursorColor: TobetoColor.card.grey,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: InputBorder.none,
        counterText: "",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TobetoColor.background.transparent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(SizeRadius.radius10px)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(SizeRadius.radius10px)),
          borderSide: const BorderSide(color: TobetoColor.purple, width: 2.0),
        ),
        labelText: TobetoText.profileEditPhoneNumber,
        labelStyle: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
        floatingLabelStyle: TobetoTextStyle.poppins(context).captionPurpleNormal18,
      ),
      initialCountryCode: 'TR',
      onChanged: (phone) {
        debugPrint(phone.completeNumber);
      },
    );
  }
}
