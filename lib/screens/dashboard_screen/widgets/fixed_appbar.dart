import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/profile_photo_bloc/profile_photo_bloc.dart';
import 'package:tobeto_mobile_app/blocs/profile_photo_bloc/profile_photo_state.dart';

import 'package:tobeto_mobile_app/screens/login_screen/login_screen.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_event.dart';
import 'package:tobeto_mobile_app/blocs/auth_bloc/auth_state.dart';

class FixedAppbar extends StatelessWidget implements PreferredSizeWidget {
  const FixedAppbar({
    super.key,
    this.bottom,
    this.height = 75,
    this.title,
    this.isLeading = true,
    this.isTobetoScreen = false,
  });
  final TabBar? bottom;
  final double height;
  final Widget? title;
  final bool isLeading;
  final bool isTobetoScreen;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.light;
    final assetImagePath = isDarkMode
        ? 'assets/images/grey-tobeto.png'
        : 'assets/images/white-tobeto.png';
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is NotAuthenticated) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false,
          );
        }
      },
      child: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        iconTheme: const IconThemeData(
          color: TobetoColor.purple,
        ),
        toolbarHeight: ScreenUtil.getHeight(context) * 0.090,
        title: isTobetoScreen
            ? Padding(
                padding: EdgeInsets.all(ScreenPadding.padding24px),
                child: Image.asset(assetImagePath),
              )
            : title,
        centerTitle: true,
        leading: isLeading
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: TobetoColor.purple,
                  size: IconSize.size35px,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
        actions: [
          BlocBuilder<ProfilePhotoBloc, ProfilePhotoState>(
              builder: (context, state) {
            if (state is ProfilePhotoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfilePhotoLoaded) {
              return Padding(
                padding: EdgeInsets.only(right: ScreenPadding.padding12px),
                child: Stack(alignment: Alignment.center, children: [
                  Container(
                    width: ScreenUtil.getWidth(context) * 0.155,
                    height: ScreenUtil.getHeight(context) * 0.155,
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
                  PopupMenuButton<String>(
                    color: Theme.of(context).colorScheme.onSurface,
                    onSelected: (value) {
                      if (value == 'logout') {
                        context.read<AuthBloc>().add(const LogoutEvent());
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<String>(
                          value: 'logout',
                          child: Row(
                            children: [
                              Icon(
                                Icons.exit_to_app_rounded,
                                size: IconSize.size25px,
                              ),
                              const SizedBox(width: 8),
                              Text(TobetoText.exit),
                            ],
                          ),
                        ),
                      ];
                    },
                    icon: CircleAvatar(
                      radius: ScreenUtil.getWidth(context) * 0.075,
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
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
