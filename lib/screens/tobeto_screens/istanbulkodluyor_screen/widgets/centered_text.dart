import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const CenteredText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: style,
    );
  }
}
