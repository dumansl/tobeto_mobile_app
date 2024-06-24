import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tobeto_mobile_app/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:tobeto_mobile_app/blocs/catalog_bloc/catalog_event.dart';
import 'package:tobeto_mobile_app/blocs/catalog_bloc/catalog_state.dart';
import 'package:tobeto_mobile_app/model/catalog_model.dart';
import 'package:tobeto_mobile_app/screens/catalog_screen/catalog_video.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/services/catalog_service.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CatalogDetails extends StatelessWidget {
  const CatalogDetails({
    super.key,
    required this.catalogCourse,
  });
  final CatalogCourse catalogCourse;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CatalogBloc(courseRepository: CourseRepository())..add(Fetch()),
      child: Scaffold(
        appBar: const FixedAppbar(title: 'Catalog'),
        body: BlocBuilder<CatalogBloc, CatalogState>(
          builder: (context, state) {
            if (state is CatalogNotLoaded) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CatalogLoaded) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: ScreenUtil.getWidth(context) * 0.92,
                          height: ScreenUtil.getHeight(context) * 0.23,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
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
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0, top: 5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width:
                                            ScreenUtil.getWidth(context) * 0.9,
                                        height: ScreenUtil.getHeight(context) *
                                            0.22,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  catalogCourse.imagePath),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(catalogCourse.courseName,
                            style: TobetoTextStyle.poppins(context)
                                .captionBlackBold24),
                        SizedBox(height: ScreenUtil.getHeight(context) * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InfoCard(
                              icon: Icons.access_time,
                              label: catalogCourse.time.toString(),
                              widht: ScreenUtil.getWidth(context) * 0.2,
                            ),
                            InfoCard(
                              icon: Icons.card_giftcard,
                              label: catalogCourse.certification.toString(),
                              widht: ScreenUtil.getWidth(context) * 0.25,
                            ),
                            InfoCard(
                              icon: Icons.language,
                              label: catalogCourse.language.toString(),
                              widht: ScreenUtil.getWidth(context) * 0.2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getHeight(context) * 0.03,
                        ),
                        Text('Eğitim İçeriği',
                            style: TobetoTextStyle.poppins(context)
                                .captionBlackBold18),
                        const Divider(),
                        const SizedBox(height: 8),
                        Stack(
                          children: [
                            Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not...',
                              style: TobetoTextStyle.poppins(context)
                                  .captionBlackThin18,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: ScreenUtil.getHeight(context) * 0.08,
                    right: 20,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
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
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CatalogVideo(
                                      catalogCourse: catalogCourse),
                                ),
                              ); // Eğitime git butonuna basıldığında yapılacak işlemler
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: TobetoColor.card.yellow
                                          .withOpacity(0.8),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(1, 1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                  color: TobetoColor.card.white,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                child: Center(
                                  child: Text(
                                    TobetoText.mainGoEducation,
                                    style: TobetoTextStyle.poppins(context)
                                        .bodyBlackBold16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('An error occurred'));
            }
          },
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final double widht;

  const InfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.widht,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widht,
      height: ScreenUtil.getHeight(context) * 0.075,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: TobetoColor.card.grey.withOpacity(0.16),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil.getHeight(context) * 0.01),
            child: Icon(icon, size: 32, color: Colors.black54),
          ),
          const SizedBox(height: 1),
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
