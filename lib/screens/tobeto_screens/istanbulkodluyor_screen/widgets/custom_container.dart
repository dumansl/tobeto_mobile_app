import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final List<Widget> children;
  final List<BoxShadow>? boxShadow;

  const CustomContainer({
    super.key,
    required this.backgroundColor,
    this.borderRadius,
    required this.children,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      width: double.infinity,
      child: Column(
        children: children,
      ),
    );
  }
}
