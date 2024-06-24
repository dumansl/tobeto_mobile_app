import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/profile_photo_bloc/profile_photo_bloc.dart';
import 'package:tobeto_mobile_app/blocs/profile_photo_bloc/profile_photo_state.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class FixedAppbar extends StatelessWidget implements PreferredSizeWidget {
  const FixedAppbar({
    super.key,
    this.bottom,
    this.height = 75,
    required this.title,
  });
  final TabBar? bottom;
  final double height;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: ScreenUtil.getHeight(context) * 0.090,
      title: Text(
        title,
        style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          color: TobetoColor.purple,
          size: IconSize.size35px,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        BlocBuilder<ProfilePhotoBloc, ProfilePhotoState>(builder: (context, state) {
          if (state is ProfilePhotoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfilePhotoLoaded) {
            return Padding(
              padding: EdgeInsets.only(right: ScreenPadding.padding12px),
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  width: ScreenUtil.getWidth(context) * 0.16,
                  height: ScreenUtil.getHeight(context) * 0.16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        TobetoColor.purple,
                        TobetoColor.rainbow.lineargreen,
                        TobetoColor.rainbow.linaergreenv2,
                        TobetoColor.rainbow.linearyellow,
                        TobetoColor.purple,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    radius: IconSize.size30px,
                    foregroundImage: state.imageUrl.isNotEmpty
                        ? NetworkImage(state.imageUrl)
                        : const AssetImage(ImagePath.defaultProfilePhoto),
                  ),
                ),
              ]),
            );
          } else if (state is ProfilePhotoError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No profile photo loaded.'));
          }
        })
      ],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
