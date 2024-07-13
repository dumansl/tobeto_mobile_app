import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';

class VerticalPadding extends StatelessWidget {
  const VerticalPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: ScreenPadding.padding30px));
  }
}

class PaddedText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final EdgeInsets padding;

  const PaddedText({
    super.key,
    required this.text,
    required this.style,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: style,
        textAlign: TextAlign.start,
      ),
    );
  }
}
