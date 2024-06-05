import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class IstanbulKodluyorScreen extends StatelessWidget {
  const IstanbulKodluyorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TobetoColor.card.cream,
        title: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding24px),
          child: Image.asset(ImagePath.greyTobeto),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(ImagePath.purpleBack),
          onPressed: () {},
        ),
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
      ),
      backgroundColor: TobetoColor.card.cream,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF1E0F41),
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(
                      ImagePath.ikLogoLight,
                      width: 290,
                      height: 120,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'İlk Kampüs Buluşması \n Gerçekleşti',
                      textAlign: TextAlign.center,
                      style: TobetoTextStyle.poppins.subtitleWhiteLight20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Aradığın ',
                            style: TobetoTextStyle.poppins.subtitleWhiteBold20,
                          ),
                          const TextSpan(
                              text: '“', style: TextStyle(color: Color.fromARGB(255, 0, 231, 170), fontSize: 20)),
                          TextSpan(text: 'İş', style: TobetoTextStyle.poppins.subtitleWhiteBold20),
                          const TextSpan(
                            text: '”',
                            style: TextStyle(color: Color.fromARGB(255, 0, 231, 170), fontSize: 20),
                          ),
                          TextSpan(
                            text: ' Burada!',
                            style: TobetoTextStyle.poppins.subtitleWhiteBold20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
                  color: Color.fromARGB(255, 0, 231, 170)),
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'Türkiye’nin İlk Sosyal Etki Tahvili: “İstanbul Kodluyor” Projesi',
                      style: TobetoTextStyle.poppins.subtitleWhiteBold20,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      'Sanayi ve Teknoloji Bakanlığı Kalkınma Ajansları Genel Müdürlüğü koordinasyonunda İstanbul Kalkınma Ajansı (İSTKA) ve İngiltere merkezli Bridges Outcomes Partnerships iş birliğinde başladı!',
                      style: TobetoTextStyle.poppins.bodyWhiteBold16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: TobetoColor.purple),
                        onPressed: () {},
                        child: Text(
                          'Sıkça Sorulan \n Sorular',
                          style: TobetoTextStyle.poppins.captionWhiteBold12,
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: TobetoColor.purple),
                      onPressed: () {},
                      child: Text(
                        'Platforma Git',
                        style: TobetoTextStyle.poppins.captionWhiteBold12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                    color: Color.fromARGB(255, 0, 231, 170)),
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF1E0F41),
                            borderRadius:
                                BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))),
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                'İstanbul Kodluyor Projesi Hakkında',
                                style: TobetoTextStyle.poppins.captionWhiteBold18,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Color.fromARGB(255, 0, 231, 170)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Text(
                        'Yazılım ve teknoloji alanında meslek sahibi olmak isteyen genç yetişkinlere, ücretsiz ve kapsamlı eğitimlerle gerekli bilgi ve becerileri kazandıran, Türkiye’nin önde gelen kurumlarında işe yerleşmelerini  sağlayan bir projedir. Teknoloji alanında nitelikli insan kaynağını geliştirmeyi amaçlayan bu proje, aynı zamanda kadınların sektördeki temsiliyetini artırmayı da hedeflemektedir.',
                        style: TobetoTextStyle.poppins.bodyWhiteBold16,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color(0xFF1E0F41),
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'SÜREÇ',
                      style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 0, 231, 170), fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: const Color.fromARGB(255, 0, 231, 170)),
                                      color: TobetoColor.card.white),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      '1',
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(255, 0, 231, 170),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Başvuru ve Ön Değerlendirme',
                                style: TobetoTextStyle.poppins.bodyWhiteBold16,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: const Color.fromARGB(255, 0, 231, 170)),
                                      color: TobetoColor.card.white),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      '2',
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(255, 0, 231, 170),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '"Herkes için Kodlama" Eğitimleri',
                                style: TobetoTextStyle.poppins.bodyWhiteBold16,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: const Color.fromARGB(255, 0, 231, 170)),
                                      color: TobetoColor.card.white),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      '3',
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(255, 0, 231, 170),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Seçme ve Değerlendirme',
                                style: TobetoTextStyle.poppins.bodyWhiteBold16,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: const Color.fromARGB(255, 0, 231, 170)),
                                      color: TobetoColor.card.white),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      '4',
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(255, 0, 231, 170),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Mesleki ve Profesyonel Eğitimler',
                                style: TobetoTextStyle.poppins.bodyWhiteBold16,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: const Color.fromARGB(255, 0, 231, 170)),
                                      color: TobetoColor.card.white),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      '5',
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(255, 0, 231, 170),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'İstihdam',
                                style: TobetoTextStyle.poppins.bodyWhiteBold16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
                  color: Color.fromARGB(255, 0, 231, 170)),
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFF1E0F41),
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))),
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(255, 0, 231, 170)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Text(
                              'İstihtama Giden Yol',
                              style: TobetoTextStyle.poppins.subtitleWhiteBold20,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 20),
                        child: Text(
                          'Yazılım ve Teknoloji Alanında Meslek \nEdinmeye Yönelik Eğitimler',
                          style: TobetoTextStyle.poppins.captionWhiteBold18,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Text(
                        'Mesleki Eğitimler',
                        style: TobetoTextStyle.poppins.captionWhiteBold18,
                      ),
                      Text(
                        '•  Online Canlı Dersler\n'
                        '•  Video İçerikler\n'
                        '•  İstanbul’da Kampüs Buluşmaları\n'
                        '•  Proje Uygulamaları',
                        style: TobetoTextStyle.poppins.bodyWhiteNormal16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 140),
                        child: Icon(
                          Icons.add,
                          color: TobetoColor.card.white,
                          size: 60,
                        ),
                      ),
                      Text(
                        'Profesyonel Gelişim Eğitimleri',
                        style: TobetoTextStyle.poppins.captionWhiteBold18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          '•  İşte Başarı Eğitimleri\n'
                          '•  Sektör Buluşmaları ve Webinarlar\n'
                          '•  Kariyer Gelişim Desteği\n'
                          '•  Mentörlük',
                          style: TobetoTextStyle.poppins.bodyWhiteNormal16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'ÖNE ÇIKAN EĞİTİMLER',
                style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 0, 231, 170), fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 130,
                  width: 130,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(ImagePath.siber),
                  ),
                ),
                SizedBox(
                  height: 130,
                  width: 130,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(ImagePath.uiux),
                  ),
                ),
                SizedBox(
                  height: 130,
                  width: 130,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(ImagePath.oyun),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                children: [
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(ImagePath.yazilim),
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(ImagePath.mobil),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 130,
                  width: 130,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(ImagePath.dijital),
                  ),
                ),
                SizedBox(
                  height: 130,
                  width: 130,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(ImagePath.veri),
                  ),
                ),
                SizedBox(
                  height: 130,
                  width: 130,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(ImagePath.ag),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                    color: Color.fromARGB(255, 0, 231, 170)),
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF1E0F41),
                            borderRadius:
                                BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))),
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 90),
                              child: Text(
                                'Sende Hemen Başvur!',
                                style: TobetoTextStyle.poppins.captionWhiteBold18,
                              ),
                            ),
                            const SizedBox(
                              width: 55,
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Color.fromARGB(255, 0, 231, 170)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        'Yazılım ve Teknoloji Alanında',
                        style: TobetoTextStyle.poppins.subtitleWhiteBold20,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '1',
                                style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(230, 31, 127, 10),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '    Profesyonel Yetkinlikler Kazan!',
                                style: TobetoTextStyle.poppins.bodyWhiteBold16,
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '2',
                                style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(230, 31, 127, 10),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '    Profesyonel Yetkinlikler Kazan!',
                                style: TobetoTextStyle.poppins.bodyWhiteBold16,
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '3',
                                style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(230, 31, 127, 10),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '    Yeni Mesleğinle İşe Başla!',
                                style: TobetoTextStyle.poppins.bodyWhiteBold16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Emraha not: tobeto yeşili text yok
// Şuleye not: tobeto laciverti yok, tobeto yeşili yok 
// Kendime not: textleri ekle
