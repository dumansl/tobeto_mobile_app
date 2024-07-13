import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import 'package:video_player/video_player.dart';

class WhoAreWeScreen extends StatefulWidget {
  const WhoAreWeScreen({super.key});

  @override
  WhoAreWeState createState() => WhoAreWeState();
}

class WhoAreWeState extends State<WhoAreWeScreen> {
  late VideoPlayerController _controller;
  bool _isFullScreen = false;
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(ImagePath.bizkimiz)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
  }

  void toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0 : 1);
    });
  }

  void togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FixedAppbar(
        isTobetoScreen: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding30px),
          child: Column(
            children: [
              _buildVideoSection(),
              // _buildImageSection(ImagePath.biz2),
              //const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                child: _buildRichTextSection(
                  text1: TobetoText.twawRich1,
                  boldText: TobetoText.twawRich2,
                  text2: TobetoText.twawRich3,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                child: _buildRichTextSection(
                  text1: TobetoText.twawRich4,
                  boldText: TobetoText.twawRich5,
                  text2: TobetoText.twawRich6,
                ),
              ),
              //const SizedBox(height: 30),
              //_buildImageSection(ImagePath.biz3),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                child: _buildImageSection(ImagePath.biz4),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                child: _buildRichTextSection(
                  text1: TobetoText.twawRich7,
                  boldText: TobetoText.twawRich8,
                  text2: TobetoText.twawRich9,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                child: _buildInfoCard(TobetoText.twawTobeto, TobetoText.twawTobetoWho, [
                  _buildTextSection(TobetoText.twawTobetoOnline),
                  _buildTextSection(TobetoText.twawTobetoArea),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding20px),
                child: Center(
                  child: Text(
                    TobetoText.twawTeams,
                    style: TobetoTextStyle.poppins(context).captionBlackBold24,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                child:
                    _buildTeamMemberCard(TobetoText.elifKilic, TobetoText.twawTeamsCard1Subtitle, ImagePath.elifKilic),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                child: _buildTeamMemberCard(
                    TobetoText.kaderYavuz, TobetoText.twawTeamsCard2Subtitle, ImagePath.kaderYavuz),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                child: _buildTeamMemberCard(
                    TobetoText.gurkanIlisen, TobetoText.twawTeamsCard4Subtitle, ImagePath.gurkanIlisen),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                child: _buildTeamMemberCard(
                    TobetoText.pelinBatir, TobetoText.twawTeamsCard3Subtitle, ImagePath.pelinBatir),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                child:
                    _buildTeamMemberCard(TobetoText.aliSeyhan, TobetoText.twawTeamsCard5Subtitle, ImagePath.aliSeyhan),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                child: _buildOfficeInfoCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        gradient: LinearGradient(
          colors: [
            TobetoColor.card.white,
            TobetoColor.card.white,
            TobetoColor.rainbow.linearpurple,
            TobetoColor.rainbow.linearpurple,
            TobetoColor.card.white,
            TobetoColor.card.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(ScreenPadding.padding4px),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: ScreenPadding.padding20px),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: ScreenPadding.padding30px),
                      child:
                          SizedBox(width: ScreenUtil.getWidth(context) * 0.33, child: Image.asset(ImagePath.tTobeto)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ScreenPadding.padding10px),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: TobetoText.twawCard1Body1,
                                style: TobetoTextStyle.poppins(context).subtitleBlackBold20),
                            TextSpan(
                                text: TobetoText.twawCard1Body11,
                                style: TobetoTextStyle.poppins(context).subtitleBlackBold20),
                            TextSpan(
                                text: TobetoText.twawCard1Body1,
                                style: TobetoTextStyle.poppins(context).subtitleBlackBold20),
                            TextSpan(
                              text: TobetoText.twawCard1Body2,
                              style: TobetoTextStyle.poppins(context).subtitlePurpleBold20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(ScreenPadding.padding20px),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        VideoPlayer(_controller),
                        Positioned(
                          bottom: 10,
                          child: GestureDetector(
                            onTap: togglePlayPause,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                                  child: Container(
                                    padding: EdgeInsets.all(ScreenPadding.padding8px),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                    child: Icon(
                                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                      color: TobetoColor.icon.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 15,
                          child: GestureDetector(
                            onTap: toggleMute,
                            child: Container(
                              padding: EdgeInsets.all(ScreenPadding.padding8px),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              child: Icon(
                                _isMuted ? Icons.volume_off : Icons.volume_up,
                                color: TobetoColor.icon.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 15,
                          child: GestureDetector(
                            onTap: toggleFullScreen,
                            child: Container(
                              padding: EdgeInsets.all(ScreenPadding.padding8px),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              child: Icon(
                                _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                                color: TobetoColor.icon.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildRichTextSection({required String text1, required String boldText, required String text2}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 16.0,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        children: <TextSpan>[
          TextSpan(text: text1, style: TobetoTextStyle.poppins(context).captionBlackNormal15),
          TextSpan(text: boldText, style: TobetoTextStyle.poppins(context).captionBlackBold15),
          TextSpan(text: text2, style: TobetoTextStyle.poppins(context).captionBlackNormal15),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title1, String title2, List<Widget> content) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        gradient: LinearGradient(
          colors: [
            TobetoColor.card.white,
            TobetoColor.card.white,
            TobetoColor.rainbow.linearpurple,
            TobetoColor.rainbow.linearpurple,
            TobetoColor.card.white,
            TobetoColor.card.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(ScreenPadding.padding4px),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: Theme.of(context).colorScheme.tertiary,
          ),
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding20px),
                child: Center(
                  child: Text(
                    title1,
                    style: TobetoTextStyle.poppins(context).captionBlackBold24,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: ScreenPadding.padding10px),
                child: Center(
                  child: Text(
                    title2,
                    style: TobetoTextStyle.poppins(context).captionBlackBold24,
                  ),
                ),
              ),
              ...content,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextSection(String text) {
    return SizedBox(
      height: ScreenUtil.getHeight(context) * 0.08,
      width: ScreenUtil.getWidth(context) * 0.55,
      child: Text(
        text,
        style: TobetoTextStyle.poppins(context).bodyBlackNormal16,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTeamMemberCard(String name, String role, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        gradient: LinearGradient(
          colors: [
            TobetoColor.card.white,
            TobetoColor.card.white,
            TobetoColor.rainbow.linearpurple,
            TobetoColor.rainbow.linearpurple,
            TobetoColor.card.white,
            TobetoColor.card.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(ScreenPadding.padding4px),
        child: Container(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(30), color: Theme.of(context).colorScheme.tertiary),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding20px),
                child: ClipOval(
                  child: Image.asset(
                    fit: BoxFit.cover,
                    imagePath,
                    height: ScreenUtil.getHeight(context) * 0.1,
                    width: ScreenUtil.getWidth(context) * 0.217,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding20px),
                child: Center(
                  child: Text(
                    name,
                    style: TobetoTextStyle.poppins(context).captionBlackBold18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding10px, bottom: ScreenPadding.padding52px),
                child: Center(
                  child: Text(
                    role,
                    style: TobetoTextStyle.poppins(context).captionGrayLightBold15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOfficeInfoCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        gradient: LinearGradient(
          colors: [
            TobetoColor.card.white,
            TobetoColor.card.white,
            TobetoColor.rainbow.linearpurple,
            TobetoColor.rainbow.linearpurple,
            TobetoColor.card.white,
            TobetoColor.card.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(ScreenPadding.padding4px),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: Theme.of(context).colorScheme.tertiary,
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: ScreenPadding.padding20px),
                child: Text(
                  TobetoText.twawTeamsCard6OfficeHeadline,
                  style: TobetoTextStyle.poppins(context).titleBlackBold24,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenPadding.padding40px,
                    bottom: ScreenPadding.padding80px,
                    right: ScreenPadding.padding30px,
                    left: ScreenPadding.padding30px),
                child: Text(
                  TobetoText.twawTeamsCard6OfficeBody,
                  style: TobetoTextStyle.poppins(context).bodyGrayMediumNormal16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
