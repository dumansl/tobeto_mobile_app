import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/profile_photo_bloc/profile_photo_bloc.dart';
import 'package:tobeto_mobile_app/blocs/profile_photo_bloc/profile_photo_state.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';

import 'package:tobeto_mobile_app/screens/profile_editting/screen/personal_information.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class NestedScroll extends StatelessWidget {
  const NestedScroll({
    super.key,
    required this.scrollController,
    required this.isTopRight,
    required this.bucket,
    required this.currentScreen,
  });

  final ScrollController scrollController;
  final bool isTopRight;
  final PageStorageBucket bucket;
  final Widget currentScreen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          return NestedScrollView(
            controller: scrollController,
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: TobetoColor.background.white,
                  expandedHeight: MediaQuery.of(context).size.height * 0.28,
                  toolbarHeight: MediaQuery.of(context).size.height * 0.090,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: SizedBox(
                      child: Stack(
                        children: [
                          BlocBuilder<ProfilePhotoBloc, ProfilePhotoState>(builder: (context, state) {
                            if (state is ProfilePhotoLoading) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (state is ProfilePhotoLoaded) {
                              return Container(
                                padding: isTopRight
                                    ? EdgeInsets.only(top: ScreenPadding.padding32px, right: ScreenPadding.padding12px)
                                    : EdgeInsets.symmetric(vertical: ScreenPadding.padding32px),
                                alignment: isTopRight ? Alignment.centerRight : Alignment.bottomCenter,
                                child: Container(
                                  padding: const EdgeInsets.all(2.0),
                                  width: isTopRight ? IconSize.size30px * 2 : IconSize.size60px * 2,
                                  height: isTopRight ? IconSize.size30px * 2 : IconSize.size60px * 2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        TobetoColor.purple,
                                        TobetoColor.rainbow.lineargreen,
                                        TobetoColor.rainbow.linaergreenv2,
                                        TobetoColor.rainbow.linearyellow,
                                        TobetoColor.purple
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: isTopRight ? IconSize.size30px : IconSize.size60px,
                                    foregroundImage: state.imageUrl.isNotEmpty
                                        ? NetworkImage(state.imageUrl)
                                        : const AssetImage(ImagePath.defaultProfilePhoto),
                                  ),
                                ),
                              );
                            } else if (state is ProfilePhotoError) {
                              return Center(child: Text('Error: ${state.message}'));
                            } else {
                              return const Center(child: Text('No profile photo loaded.'));
                            }
                          }),
                          Container(
                            padding: EdgeInsets.only(top: ScreenPadding.padding32px),
                            alignment: isTopRight ? Alignment.centerLeft : Alignment.bottomCenter,
                            child: RichText(
                              text: TextSpan(
                                style: TobetoTextStyle.poppins(context).captionBlackBold18,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "TOBETO",
                                    style: TobetoTextStyle.poppins(context).captionPurpleBold18,
                                  ),
                                  TextSpan(
                                    text: "'ya hoş geldin ${firstNameController.text}",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ];
            },
            body: PageStorage(
              bucket: bucket,
              child: currentScreen,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
