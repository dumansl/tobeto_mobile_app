import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class InputText extends StatelessWidget {
  final Widget child;
  const InputText({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white, boxShadow: [
          BoxShadow(
            color: TobetoColor.card.shadowColor,
            blurRadius: 4,
            offset: const Offset(
              0,
              2,
            ),
          )
        ]),
        child: child,
      ),
    );
  }
}
