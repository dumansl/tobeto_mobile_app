import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ReviewsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ReviewsAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TobetoColor.purple,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: TobetoTextStyle.poppins.subtitleWhiteSemiBold20,
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.clear,
            color: TobetoColor.icon.white,
            size: IconSize.size25px,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
