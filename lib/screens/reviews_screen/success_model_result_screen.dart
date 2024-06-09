import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/reviews_screen/reviews_widgets/custom_headline_text.dart';
import 'package:tobeto_mobile_app/screens/reviews_screen/reviews_widgets/spider_chart.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class SuccessModelResultScreen extends StatefulWidget {
  const SuccessModelResultScreen({super.key});

  @override
  State<SuccessModelResultScreen> createState() =>
      _SuccessModelResultScreenState();
}

class _SuccessModelResultScreenState extends State<SuccessModelResultScreen> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TobetoColor.background.lightGrey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomHeadlineText(),
                  _subHeadlineText(),
                ],
              ),
            ),
            Expanded(
              flex: 85,
              child: _successModelContent(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subHeadlineText() {
    return Text(
      TobetoText.evaluationHeadlineSubTitle3,
      style: TobetoTextStyle.poppins.titleGrayMediumBold24,
    );
  }

  Widget _successModelContent(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: ScreenPadding.padding32px,
          horizontal: ScreenPadding.padding32px),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(SizeRadius.radius30px),
          right: Radius.circular(SizeRadius.radius30px),
        ),
      ),
      child: Column(
        children: [
          _purpleDivider(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenPadding.padding24px,
                    ),
                    child: const SpiderChart(
                      values: [0.9, 0.65, 0.5, 0.95, 0.97, 1, 0.8, 0.75],
                    ),
                  ),
                  _spiderDescription(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenPadding.padding16px,
                    ),
                    child: _successModelDescription(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _purpleDivider(BuildContext context) {
    return Container(
      height: ScreenUtil.getHeight(context) * 0.016,
      decoration: ShapeDecoration(
        color: TobetoColor.purple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeRadius.radius5px)),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
    );
  }

  Widget _spiderDescription() {
    return Column(
      children: [
        _spiderChartDescription(
          color: TobetoColor.card.turquoise,
          score: 4.2,
          text: TobetoText.evaluationspiderChartDescription1,
        ),
        _spiderChartDescription(
          color: TobetoColor.card.darkGreen,
          score: 4.2,
          text: TobetoText.evaluationspiderChartDescription2,
        ),
        _spiderChartDescription(
          color: TobetoColor.card.yellow,
          score: 4.2,
          text: TobetoText.evaluationspiderChartDescription3,
        ),
        _spiderChartDescription(
          color: TobetoColor.card.darkPurple,
          score: 4.2,
          text: TobetoText.evaluationspiderChartDescription4,
        ),
        _spiderChartDescription(
          color: TobetoColor.card.pink,
          score: 4.2,
          text: TobetoText.evaluationspiderChartDescription5,
        ),
        _spiderChartDescription(
          color: TobetoColor.card.lightBrown,
          score: 4.2,
          text: TobetoText.evaluationspiderChartDescription6,
        ),
        _spiderChartDescription(
          color: TobetoColor.card.fuchsia,
          score: 4.2,
          text: TobetoText.evaluationspiderChartDescription7,
        ),
        _spiderChartDescription(
          color: TobetoColor.card.peach,
          score: 4.2,
          text: TobetoText.evaluationspiderChartDescription8,
        ),
      ],
    );
  }

  Widget _spiderChartDescription(
      {required Color color, required double score, required String text}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 25,
              width: 35,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(
                  Radius.circular(SizeRadius.radius5px),
                ),
              ),
              child: Center(
                child: Text(
                  "$score",
                  style: TobetoTextStyle.poppins.captionWhiteNormal12,
                ),
              ),
            ),
            SizedBox(
              width: ScreenPadding.padding8px,
            ),
            Expanded(
              child: Text(
                text,
                style: TobetoTextStyle.poppins.captionGrayNormal12,
              ),
            ),
          ],
        ),
        SizedBox(height: SizeRadius.radius8px),
      ],
    );
  }

  Widget _successModelDescription() {
    return Column(
      children: [
        _successModelDescriptionTitle(
          title: TobetoText.evaluationspiderChartDescription1,
          score: 4,
        ),
        Padding(
          padding: EdgeInsets.only(
              top: ScreenPadding.padding16px, bottom: ScreenPadding.padding8px),
          child: _successModelDescriptionTitleContent(
              title: "Bu yetkinlik nedir ve neden önemli?",
              description:
                  "Tobeto ‘İşte Başarı Modeli’nin son yetkinliği yeni dünya ile ilgilidir. Bu yetkinlik, diğer yedi yetkinlikten farklı olarak, yeni dünya ile ilgili farkındalık yaratmak ve herkesin kendisini olabildiğince buna hazırlaması konusunda yönlendirici olması için modele eklenmiştir. Zira içinde bulunduğumuz zamanlar önemli bir geçiş sürecine işaret etmektedir. Dijital teknolojilerle birlikte yaşanan dönüşümler hayatın her alanını yeninden şekillendirmektedir. İş dünyası ve şirketler de bu dönüşümün hem lokomotifi hem de etkilenenidir. Teknolojinin bu kadar yaygınlaşması ve karmaşık hale gelmesi, onu kullanabilecek nitelikte donanımlı insanlar gerektirmektedir. Birçok araştırma göstermektedir ki, hızlı teknolojik gelişmeler karşısında gereken yetenek altyapısı oluşturulamamıştır. Bu yüzden birçok şirket, özellikle teknoloji yoğun pozisyonlarda yetenek açığı çekmektedir. Bu açığı kapatmak için kendi içinde gelişim programları düzenleyen pek çok şirket var. İşin daha dramatik boyutu, bazı meslekler artık kendini tamamen teknolojiye bırakmış durumda ve artık bu meslek alanlarında çalışanların kendilerini başka alanlarda çalışacak şekilde geliştirmesi bir zorunluluk.Tüm bu dönüşüm süreci içinde; yeni dünyayı anlamış, bu dünyada başarılı olabilecek dijital ve teknoloji yetkinliklerine sahip adayların istihdamı kuşkusuz daha kolay. Bu konudaki gelişim ihtiyacı sadece istihdamla ilgili de değil çünkü bu beceriler gündelik yaşamda da çok önemli hale gelmiş durumda. İnterneti iyi kullanan, aradığı tüm bilgilere ulaşabilen, ihtiyacına göre dijital uygulamaları arayıp bulan, siber dünyada güvenliğini koruyabilen tüm bireyler birçok alanda öne çıkıyor. Ayrıca bu dünya fırsatlar dünyasıdır. Yeni mecralar, yeni işler, yeni para kazanma biçimleri ortaya çıkarken bu fırsatları ancak yeterli donanıma sahip bireyler yakalayabilecek. Tüm bu açılardan bakıldığında bu yetkinlik, diğer tüm yetkinliklerin gücünü artırması açısından önemli. "),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: ScreenPadding.padding16px, top: ScreenPadding.padding8px),
          child: _successModelDescriptionTitleContent(
              title: "Bu yetkinlik nedir ve neden önemli?",
              description:
                  "Tobeto ‘İşte Başarı Modeli’nin son yetkinliği yeni dünya ile ilgilidir. Bu yetkinlik, diğer yedi yetkinlikten farklı olarak, yeni dünya ile ilgili farkındalık yaratmak ve herkesin kendisini olabildiğince buna hazırlaması konusunda yönlendirici olması için modele eklenmiştir. Zira içinde bulunduğumuz zamanlar önemli bir geçiş sürecine işaret etmektedir. Dijital teknolojilerle birlikte yaşanan dönüşümler hayatın her alanını yeninden şekillendirmektedir. İş dünyası ve şirketler de bu dönüşümün hem lokomotifi hem de etkilenenidir. Teknolojinin bu kadar yaygınlaşması ve karmaşık hale gelmesi, onu kullanabilecek nitelikte donanımlı insanlar gerektirmektedir. Birçok araştırma göstermektedir ki, hızlı teknolojik gelişmeler karşısında gereken yetenek altyapısı oluşturulamamıştır. Bu yüzden birçok şirket, özellikle teknoloji yoğun pozisyonlarda yetenek açığı çekmektedir. Bu açığı kapatmak için kendi içinde gelişim programları düzenleyen pek çok şirket var. İşin daha dramatik boyutu, bazı meslekler artık kendini tamamen teknolojiye bırakmış durumda ve artık bu meslek alanlarında çalışanların kendilerini başka alanlarda çalışacak şekilde geliştirmesi bir zorunluluk.Tüm bu dönüşüm süreci içinde; yeni dünyayı anlamış, bu dünyada başarılı olabilecek dijital ve teknoloji yetkinliklerine sahip adayların istihdamı kuşkusuz daha kolay. Bu konudaki gelişim ihtiyacı sadece istihdamla ilgili de değil çünkü bu beceriler gündelik yaşamda da çok önemli hale gelmiş durumda. İnterneti iyi kullanan, aradığı tüm bilgilere ulaşabilen, ihtiyacına göre dijital uygulamaları arayıp bulan, siber dünyada güvenliğini koruyabilen tüm bireyler birçok alanda öne çıkıyor. Ayrıca bu dünya fırsatlar dünyasıdır. Yeni mecralar, yeni işler, yeni para kazanma biçimleri ortaya çıkarken bu fırsatları ancak yeterli donanıma sahip bireyler yakalayabilecek. Tüm bu açılardan bakıldığında bu yetkinlik, diğer tüm yetkinliklerin gücünü artırması açısından önemli. "),
        ),
      ],
    );
  }

  Widget _successModelDescriptionTitle(
      {required String title, required double score}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TobetoTextStyle.poppins.captionPurpleBold12,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: ScreenPadding.padding12px,
            horizontal: ScreenPadding.padding8px,
          ),
          decoration: BoxDecoration(
            color: TobetoColor.purple,
            borderRadius: BorderRadius.all(
              Radius.circular(SizeRadius.radius10px),
            ),
          ),
          child: Text(
            "${TobetoText.evaluationScore} : $score",
            style: TobetoTextStyle.poppins.captionWhiteBold12,
          ),
        ),
      ],
    );
  }

  Widget _successModelDescriptionTitleContent({
    required String title,
    required String description,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            padding: EdgeInsets.all(ScreenPadding.padding8px),
            width: double.infinity,
            decoration: BoxDecoration(
              color: TobetoColor.card.lightPurple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeRadius.radius16px),
                topRight: Radius.circular(SizeRadius.radius16px),
                bottomLeft: _isExpanded
                    ? const Radius.circular(0)
                    : Radius.circular(SizeRadius.radius16px),
                bottomRight: _isExpanded
                    ? const Radius.circular(0)
                    : Radius.circular(SizeRadius.radius16px),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TobetoTextStyle.poppins.captionPurpleBold12,
                ),
                Icon(
                  _isExpanded
                      ? Icons.arrow_drop_down_rounded
                      : Icons.arrow_right_rounded,
                  size: IconSize.size35px,
                  color: TobetoColor.purple,
                ),
              ],
            ),
          ),
        ),
        _isExpanded
            ? Container(
                padding: EdgeInsets.all(ScreenPadding.padding16px),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: TobetoColor.card.cream,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(SizeRadius.radius16px),
                    bottomLeft: Radius.circular(SizeRadius.radius16px),
                  ),
                ),
                child: Text(
                  description,
                  style: TobetoTextStyle.poppins.captionGrayBold12,
                  textAlign: TextAlign.justify,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
