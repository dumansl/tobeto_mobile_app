import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';

class CustomCheckbox extends StatelessWidget {
  CustomCheckbox({
    super.key,
    required this.onChanged,
    required this.isChecked,
  });

  final Function(bool?) onChanged;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: TobetoColor.purple,
      checkColor: TobetoColor.button.white,
      value: isChecked,
      onChanged: onChanged,
    );
  }
}
