// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class NestedScroll extends StatelessWidget {
  const NestedScroll({
    super.key,
    required ScrollController scrollController,
    required bool isTopRight,
    required this.bucket,
    required this.currentScreen,
  })  : _scrollController = scrollController,
        _isTopRight = isTopRight;

  final ScrollController _scrollController;
  final bool _isTopRight;
  final PageStorageBucket bucket;
  final Widget currentScreen;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: TobetoColor.background.white,
            expandedHeight: ScreenUtil.getHeight(context) * 0.28,
            toolbarHeight: ScreenUtil.getHeight(context) * 0.090,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: SizedBox(
                child: Stack(
                  children: [
                    Container(
                      padding: _isTopRight
                          ? EdgeInsets.only(top: ScreenPadding.padding32px, right: ScreenPadding.padding12px)
                          : EdgeInsets.symmetric(vertical: ScreenPadding.padding32px),
                      alignment: _isTopRight ? Alignment.centerRight : Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: _isTopRight ? IconSize.size30px : IconSize.size60px,
                        backgroundImage: const AssetImage(ImagePath.profilePhoto),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: ScreenPadding.padding32px),
                      alignment: _isTopRight ? Alignment.center : Alignment.bottomCenter,
                      child: RichText(
                        text: TextSpan(style: TobetoTextStyle.poppins.captionBlackBold18, children: <TextSpan>[
                          TextSpan(text: "TOBETO", style: TobetoTextStyle.poppins.captionPurpleBold18),
                          const TextSpan(
                            text: "'ya hoş geldin Enes",
                          ),
                        ]),
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
  }
}
