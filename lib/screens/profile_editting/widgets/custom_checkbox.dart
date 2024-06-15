import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';

class CustomCheckbox extends StatelessWidget {
  final Function(bool?) onChanged;
  final bool value;
  final TextEditingController controller;

  const CustomCheckbox({super.key, required this.onChanged, this.value = false, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: TobetoColor.purple,
      checkColor: TobetoColor.button.white,
      value: value,
      onChanged: onChanged,
    );
  }
}
