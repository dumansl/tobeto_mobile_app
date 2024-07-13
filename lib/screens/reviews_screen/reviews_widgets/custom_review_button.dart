import 'package:flutter/material.dart';

class CustomReviewButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final TextStyle style;
  final VoidCallback onPressed;
  final Color foregroundColor;

  const CustomReviewButton({
    super.key,
    required this.buttonText,
    required this.backgroundColor,
    required this.style,
    required this.onPressed,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor, foregroundColor: foregroundColor),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: style,
      ),
    );
  }
}
