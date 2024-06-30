import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:tobeto_mobile_app/blocs/catalog_bloc/catalog_event.dart';
import 'package:tobeto_mobile_app/blocs/catalog_bloc/catalog_state.dart';
import 'package:tobeto_mobile_app/model/catalog_model.dart';
import 'package:tobeto_mobile_app/screens/catalog_screen/catalog_details.dart';
import 'package:tobeto_mobile_app/screens/catalog_screen/widget/course_card.dart';
import 'package:tobeto_mobile_app/screens/catalog_screen/widget/course_card_big.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/services/catalog_service.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String selectedCourse = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatalogBloc(courseRepository: CourseRepository())..add(Fetch()),
      child: Scaffold(
        appBar: FixedAppbar(
          title: Text(
            "Katalog",
            style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28,
          ),
        ),
        body: BlocBuilder<CatalogBloc, CatalogState>(
          builder: (context, state) {
            if (state is CatalogNotLoaded) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CatalogLoaded) {
              final List<CatalogCourse> courses = state.catalogCourse;
              courses.sort((a, b) => b.rank.compareTo(a.rank));
              final List<Widget> boxWidgets = courses.map((course) {
                return CatalogCourseCardsmall(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CatalogDetails(catalogCourse: course),
                      ),
                    );
                  },
                  courseName: course.courseName,
                  courseTeacher: course.courseTeacher,
                  rank: course.rank.toString(),
                  imagePath: course.imagePath,
                );
              }).toList();

              return ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          TobetoText.catalogHeadline1,
                          style: TobetoTextStyle.poppins(context).headlineBlackNormal32,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          height: ScreenUtil.getHeight(context) * 0.2,
                          child: ListView.builder(
                            itemCount: boxWidgets.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return boxWidgets[index];
                            },
                          ),
                        ),
                      ),
                      Text(
                        TobetoText.catalogCategory,
                        style: TobetoTextStyle.poppins(context).headlineBlackNormal32,
                      ),

                      // Assuming you also want to display big cards from the fetched data
                      for (var course in courses)
                        if (course.courseName == selectedCourse)
                          CatalogCourseCardBig(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CatalogDetails(catalogCourse: course),
                                  ));
                            },
                            courseName: course.courseName,
                            courseTeacher: course.courseTeacher,
                            rank: course.rank.toString(),
                            width: ScreenUtil.getWidth(context) * 1,
                            imagePath: course.imagePath,
                            height: ScreenUtil.getHeight(context) * 0.28,
                          )
                        else
                          CatalogCourseCardBig(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CatalogDetails(catalogCourse: course),
                                  ));
                            },
                            courseName: course.courseName,
                            courseTeacher: course.courseTeacher,
                            rank: course.rank.toString(),
                            width: ScreenUtil.getWidth(context) * 1,
                            imagePath: course.imagePath,
                            height: ScreenUtil.getHeight(context) * 0.28,
                          )
                    ],
                  ),
                ],
              );
            } else {
              return const Center(child: Text('Something went wrong!'));
            }
          },
        ),
      ),
    );
  }
}
