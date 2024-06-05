import 'package:flutter/material.dart';

class CustomReviewButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final TextStyle style;
  final VoidCallback onPressed;
  const CustomReviewButton(
      {super.key,
      required this.buttonText,
      required this.backgroundColor,
      required this.style,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: style,
      ),
    );
  }
}
