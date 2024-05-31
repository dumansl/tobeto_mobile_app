import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class BottomAppbarIcon extends StatelessWidget {
  final int currentTab;
  final void Function() onPressed;
  final int pageIndex;
  final String activeIcon;
  final String inactiveIcon;
  final String iconName;
  const BottomAppbarIcon({
    super.key,
    required this.currentTab,
    required this.onPressed,
    required this.pageIndex,
    required this.iconName,
    required this.activeIcon,
    required this.inactiveIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: TobetoColor.background.white,
          padding: EdgeInsets.symmetric(horizontal: ScreenPadding.padding18px),
          shadowColor: TobetoColor.background.transparent,
          backgroundColor: TobetoColor.background.transparent),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          currentTab == pageIndex
              ? Image.asset(activeIcon, width: IconSize.size35px, height: IconSize.size35px)
              : Opacity(
                  opacity: 0.5, child: Image.asset(inactiveIcon, width: IconSize.size35px, height: IconSize.size35px)),
          Text(
            iconName,
            style: currentTab == pageIndex
                ? TobetoTextStyle.poppins.captionPurpleBold12
                : TobetoTextStyle.poppins.captionGrayNormal12,
          ),
        ],
      ),
    );
  }
}
