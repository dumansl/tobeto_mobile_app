import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomDropDownInput extends StatelessWidget {
  const CustomDropDownInput({
    super.key,
    required this.onChanged,
    required this.items,
    required this.title,
    required this.controller,
    this.labelText,
  });
  final Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final String title;
  final String? labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: const Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 25,
        ),
      ),
      items: items,
      style: TobetoTextStyle.poppins(context).bodyBlackBold16,
      hint: Text(
        title,
        style: controller.text.isNotEmpty
            ? TobetoTextStyle.poppins(context).bodyBlackBold16
            : TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
      ),
      onChanged: (String? value) {
        controller.text = value ?? '';
        onChanged?.call(value);
      },
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: controller.text.isNotEmpty
            ? TobetoTextStyle.poppins(context).bodyGrayLightNormal16
            : TobetoTextStyle.poppins(context).captionPurpleNormal18,
        floatingLabelStyle: controller.text.isNotEmpty
            ? TobetoTextStyle.poppins(context).captionPurpleNormal18
            : const TextStyle(color: Colors.transparent),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(12),
        )),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
