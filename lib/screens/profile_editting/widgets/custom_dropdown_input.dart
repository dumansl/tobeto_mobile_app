import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomDropDownInput extends StatelessWidget {
  const CustomDropDownInput({
    super.key,
    required this.onChanged,
    required this.items,
    required this.title,
    required this.controller,
  });
  final Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final String title;
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
      onChanged: onChanged,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(12),
        )),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
