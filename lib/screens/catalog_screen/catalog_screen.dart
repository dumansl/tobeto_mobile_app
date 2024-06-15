import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:tobeto_mobile_app/blocs/catalog_bloc/catalog_state.dart';
import 'package:tobeto_mobile_app/model/catalog_model.dart';
import 'package:tobeto_mobile_app/screens/catalog_screen/widget/catalog_search_bar.dart';
import 'package:tobeto_mobile_app/screens/catalog_screen/widget/category_card.dart';
import 'package:tobeto_mobile_app/screens/catalog_screen/widget/course_card.dart';
import 'package:tobeto_mobile_app/screens/catalog_screen/widget/course_card_big.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(builder: (context, state) {
      if (state is CatalogLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is CatalogLoaded) {
        List<CatalogModel> data = state.catalogModel;
        final List<Widget> boxWidgets = [
          CatalogCourseCardsmall(
            courseName: data[0].educationName,
            courseTeacher: 'Gürkan İŞİTEN',
            rank: '4.5',
            width: ScreenUtil.getWidth(context) * 0.43,
            imagePath: ImagePath.howToTraining,
            height: ScreenUtil.getHeight(context) * 0.2,
          ),
          CatalogCourseCardsmall(
            courseName: 'Ağ ve Güvenlik',
            courseTeacher: 'Gürkan İŞİTEN',
            rank: '4.1',
            width: ScreenUtil.getWidth(context) * 0.43,
            imagePath: ImagePath.biz3,
            height: ScreenUtil.getHeight(context) * 0.2,
          ),
          CatalogCourseCardsmall(
            courseName: 'Web Tasarımı',
            courseTeacher: 'Gürkan İŞİTEN',
            rank: '4.5',
            width: ScreenUtil.getWidth(context) * 0.43,
            imagePath: ImagePath.biz2,
            height: ScreenUtil.getHeight(context) * 0.2,
          )
        ];

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenPadding.padding12px),
          child: Scaffold(
            appBar: const FixedAppbar(
              title: 'Catalog',
            ),
            body: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CategorySearchBar(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        TobetoText.catalogHeadline1,
                        style: TobetoTextStyle.poppins.headlineBlackNormal32,
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.getHeight(context) * 0.2,
                      child: ListView.builder(
                        itemCount: boxWidgets.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return boxWidgets[index]; // Belirlenen Box widget'larını kullan
                        },
                      ),
                    ),
                    Text(
                      TobetoText.catalogCategory,
                      style: TobetoTextStyle.poppins.headlineBlackNormal32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const CategoryCard(
                          categoryText: 'Java',
                        ),
                        const CategoryCard(
                          categoryText: 'Flutter',
                        ),
                        const CategoryCard(
                          categoryText: 'SQL',
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            TobetoText.catalogSeeAll,
                            style: TobetoTextStyle.poppins.captionBlackBold15,
                          ),
                        ),
                      ],
                    ),
                    CatalogCourseCardBig(
                        courseName: 'Veri Bilimi',
                        courseTeacher: 'Gürkan İŞİTEN',
                        rank: '4.9',
                        width: ScreenUtil.getWidth(context) * 1,
                        imagePath: ImagePath.blog1,
                        height: ScreenUtil.getHeight(context) * 0.28),
                    CatalogCourseCardBig(
                        courseName: 'Veri Bilimi',
                        courseTeacher: 'Gürkan İŞİTEN',
                        rank: '4.9',
                        width: ScreenUtil.getWidth(context) * 1,
                        imagePath: ImagePath.blog2,
                        height: ScreenUtil.getHeight(context) * 0.28),
                    CatalogCourseCardBig(
                        courseName: 'Veri Bilimi',
                        courseTeacher: 'Gürkan İŞİTEN',
                        rank: '4.9',
                        width: ScreenUtil.getWidth(context) * 1,
                        imagePath: ImagePath.blog3,
                        height: ScreenUtil.getHeight(context) * 0.28),
                  ],
                ),
              ],
            ),
          ),
        );
      } else if (state is CatalogError) {
        return Center(child: Text('Error: ${state.message}'));
      } else {
        return const Center(child: Text('Bir hata oluştu.'));
      }
    });
  }
}
