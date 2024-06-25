import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenPadding.padding2px, vertical: ScreenPadding.padding10px),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeRadius.radius12px),
            color: TobetoColor.card.white,
            boxShadow: [
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
