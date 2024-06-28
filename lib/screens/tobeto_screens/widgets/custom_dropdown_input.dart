import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomDropDownInput extends StatelessWidget {
  const CustomDropDownInput({
    super.key,
    required this.onChanged,
    required this.items,
    required this.title,
  });
  final Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: Padding(
        padding: EdgeInsets.only(right: ScreenPadding.padding10px),
        child: const Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 30,
        ),
      ),
      items: items,
      style: TobetoTextStyle.poppins(context).bodyBlackBold16,
      hint: Text(
        title,
        style: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
        ),
        labelStyle: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
        floatingLabelStyle: TobetoTextStyle.poppins(context).captionPurpleNormal18,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(12),
        )),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
