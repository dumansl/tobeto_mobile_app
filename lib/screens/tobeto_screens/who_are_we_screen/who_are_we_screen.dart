import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
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
      backgroundColor: TobetoColor.card.cream,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              _buildVideoSection(),
              const SizedBox(height: 30),
              // _buildImageSection(ImagePath.biz2),
              //const SizedBox(height: 30),
              _buildRichTextSection(
                text1:
                    'Yeni nesil mesleklerdeki yetenek açığının mevcut yüksek deneyim ve beceri beklentisinden uzaklaşıp yeteneği keşfederek ve onları en iyi versiyonlarına ulaştırarak çözülebileceğine inanıyoruz. Tobeto; yetenekleri potansiyellerine göre değerlendirir, onları en uygun alanlarda geliştirir ve değer yaratacak projelerle eşleştirir. ',
                boldText: 'YES (Yetiş-Eşleş-Sürdür) ',
                text2:
                    'ilkesini benimseyen herkese Tobeto Ailesi\'ne katılmaya davet ediyor.',
              ),
              const SizedBox(height: 30),
              _buildRichTextSection(
                text1:
                    'Günümüzde meslek hayatında yer almak ve kariyerinde yükselmek için en önemli unsurların başında ',
                boldText: 'dijital beceri sahibi olmak ',
                text2:
                    'geliyor. Bu ihtiyaçların tamamını karşılamak için içeriklerimizi Tobeto Platform’da birleştirdik.',
              ),
              //const SizedBox(height: 30),
              //_buildImageSection(ImagePath.biz3),
              const SizedBox(height: 30),
              _buildImageSection(ImagePath.biz4),
              const SizedBox(height: 30),
              _buildRichTextSection(
                text1: 'Öğrencilerin teoriyi anlamalarını önemsemekle beraber ',
                boldText: 'uygulamayı \nmerkeze alan ',
                text2:
                    'bir öğrenme yolculuğu sunuyoruz. Öğrenciyi sürekli gelişim, geri bildirim döngüsünde tutarak yetenek ve beceri kazanımını hızlandırıyoruz.',
              ),
              const SizedBox(
                height: 30,
              ),
              _buildInfoCard('TOBETO FARKI', 'NEDİR?', [
                _buildTextSection('Online ve canlı derslerle hibrit yaklaşım'),
                _buildTextSection('Alanında uzman eğitmenlerle canlı dersler'),
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    TobetoText.twawTeams,
                    style: TobetoTextStyle.poppins(context).captionBlackBold24,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _buildTeamMemberCard('Elif KILIÇ',
                  TobetoText.twawTeamsCard1Subtitle, ImagePath.elifKilic),
              const SizedBox(height: 30),
              _buildTeamMemberCard('Kader YAVUZ',
                  TobetoText.twawTeamsCard2Subtitle, ImagePath.kaderYavuz),
              const SizedBox(height: 30),
              _buildTeamMemberCard('Gürkan İLİŞEN',
                  TobetoText.twawTeamsCard4Subtitle, ImagePath.gurkanIlisen),
              const SizedBox(height: 30),
              _buildTeamMemberCard('Pelin BATIR',
                  TobetoText.twawTeamsCard3Subtitle, ImagePath.pelinBatir),
              const SizedBox(height: 30),
              _buildTeamMemberCard('Ali SEYHAN',
                  TobetoText.twawTeamsCard5Subtitle, ImagePath.aliSeyhan),
              const SizedBox(height: 30),
              _buildOfficeInfoCard(),
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
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: TobetoColor.card.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.asset(ImagePath.tTobeto)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Yeni Nesil\n',
                                style: TobetoTextStyle.poppins(context)
                                    .subtitleBlackBold20),
                            TextSpan(
                                text: 'Mesleklere\n',
                                style: TobetoTextStyle.poppins(context)
                                    .subtitleBlackBold20),
                            TextSpan(
                                text: 'Yeni Nesil\n',
                                style: TobetoTextStyle.poppins(context)
                                    .subtitleBlackBold20),
                            TextSpan(
                              text: TobetoText.twawCard1Body2,
                              style: TobetoTextStyle.poppins(context)
                                  .subtitlePurpleBold20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
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
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                    child: Icon(
                                      _controller.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
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
                              padding: const EdgeInsets.all(8),
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
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              child: Icon(
                                _isFullScreen
                                    ? Icons.fullscreen_exit
                                    : Icons.fullscreen,
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

  Widget _buildRichTextSection(
      {required String text1,
      required String boldText,
      required String text2}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 16.0,
          color: TobetoColor.text.black,
        ),
        children: <TextSpan>[
          TextSpan(
              text: text1,
              style: TobetoTextStyle.poppins(context).captionBlackNormal15),
          TextSpan(
              text: boldText,
              style: TobetoTextStyle.poppins(context).captionBlackBold15),
          TextSpan(
              text: text2,
              style: TobetoTextStyle.poppins(context).captionBlackNormal15),
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
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: TobetoColor.card.white,
          ),
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    title1,
                    style: TobetoTextStyle.poppins(context).captionBlackBold24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
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
      height: 70,
      width: 250,
      child: Text(
        text,
        style: TobetoTextStyle.poppins(context).bodyBlackNormal16,
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
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: TobetoColor.card.white),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ClipOval(
                  child: Image.asset(
                    imagePath,
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  name,
                  style: TobetoTextStyle.poppins(context).captionBlackBold18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 50),
                child: Center(
                  child: Text(
                    role,
                    style:
                        TobetoTextStyle.poppins(context).captionGrayLightBold15,
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
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: TobetoColor.card.white,
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  TobetoText.twawTeamsCard6OfficeHeadline,
                  style: TobetoTextStyle.poppins(context).titleBlackBold24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 80, right: 30, left: 30),
                child: Text(
                  TobetoText.twawTeamsCard6OfficeBody,
                  style:
                      TobetoTextStyle.poppins(context).bodyGrayMediumNormal16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
