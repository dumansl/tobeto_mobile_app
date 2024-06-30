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
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
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
