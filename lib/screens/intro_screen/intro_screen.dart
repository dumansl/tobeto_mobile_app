import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/intro_model.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

import '../../utils/themes/text_style.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<IntroModel> introData = [
    IntroModel(
        image: ImagePath.intro1,
        introHeadline: TobetoText.introHeadline1,
        introContent: TobetoText.introContent1),
    IntroModel(
        image: ImagePath.intro2,
        introHeadline: TobetoText.introHeadline2,
        introContent: TobetoText.introContent2),
    IntroModel(
        image: ImagePath.intro3,
        introHeadline: TobetoText.introHeadline3,
        introContent: TobetoText.introContent3)
  ];

  void _onSkip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void _onNext() {
    if (_currentIndex == introData.length - 1) {
      _onSkip();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              flex: 70,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(
                    () {
                      _currentIndex = index;
                    },
                  );
                },
                itemCount: introData.length,
                itemBuilder: (context, index) {
                  return _introview(
                    image: introData[index].image,
                    headLine: introData[index].introHeadline,
                    content: introData[index].introContent,
                  );
                },
              ),
            ),
            Expanded(
              flex: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  introData.length,
                  (index) => _buildDot(index),
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentIndex == introData.length - 1
                      ? const SizedBox()
                      : _skipButton(
                          onPressed: _onSkip, text: TobetoText.introSkipButton),
                  _nextButton(
                    onPressed: _onNext,
                    text: _currentIndex == introData.length - 1
                        ? TobetoText.introLoginButton
                        : TobetoText.introNextButton,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: ScreenPadding.padding8px),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color:
            _currentIndex == index ? TobetoColor.purple : TobetoColor.icon.grey,
        borderRadius: BorderRadius.circular(SizeRadius.radius5px),
      ),
    );
  }

  Widget _introview(
      {required String image,
      required String headLine,
      required String content}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Spacer(flex: 15),
        Image.asset(
          height: ScreenUtil.getHeight(context) * 0.35,
          width: ScreenUtil.getWidth(context) * 0.55,
          image,
          fit: BoxFit.fitHeight,
        ),
        const Spacer(flex: 10),
        Text(
          headLine,
          textAlign: TextAlign.center,
          style: TobetoTextStyle.inter(context).titlePurpleSemiBold24,
        ),
        const Spacer(flex: 10),
        Text(
          content,
          textAlign: TextAlign.center,
          style: TobetoTextStyle.inter(context).captionGrayMediumNormal15,
        ),
        const Spacer(flex: 15),
      ],
    );
  }

  Widget _nextButton({
    required VoidCallback onPressed,
    required String text,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            TobetoColor.purple.withOpacity(0.5),
            TobetoColor.purple,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(SizeRadius.radius16px),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: TobetoTextStyle.inter(context).bodyWhiteSemiBold16,
        ),
      ),
    );
  }

  Widget _skipButton({
    required VoidCallback onPressed,
    required String text,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TobetoTextStyle.inter(context).bodyPurpleSemiBold16,
      ),
    );
  }
}
