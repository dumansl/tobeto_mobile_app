import 'package:flutter/material.dart';

class VerticalPadding extends StatelessWidget {
  const VerticalPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.only(top: 30));
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
