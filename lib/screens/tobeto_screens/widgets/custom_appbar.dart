import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';

class TobetoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isLeading;
  const TobetoAppBar({super.key, this.isLeading = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: TobetoColor.purple,
      ),
      title: Padding(
        padding: EdgeInsets.all(ScreenPadding.padding24px),
        child: Image.asset(ImagePath.greyTobeto),
      ),
      centerTitle: true,
      leading: isLeading
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: TobetoColor.purple,
                size: IconSize.size25px,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(ImagePath.profilePhoto),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
