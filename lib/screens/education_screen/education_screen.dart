// TO DO : Zehra Karaca <3
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import '/blocs/course_bloc/course_bloc.dart';
import '/model/course_model.dart';
import 'education_widgets/course_card.dart';

class EducationScreen extends StatefulWidget {
  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> with SingleTickerProviderStateMixin {
  TextEditingController _searchController = TextEditingController();
  List<Course> _filteredCourses = [];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterCourses);
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCourses);
    _searchController.dispose();
    _tabController?.dispose();
    super.dispose();
  }

  void _filterCourses() {
    final query = _searchController.text.toLowerCase();
    final courses = (context.read<CourseBloc>().state as CoursesLoaded).courses;
    setState(() {
      _filteredCourses = courses.where((course) {
        return course.title.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _navigateToEmptyPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EmptyPage()));
  }

  void _navigateToEducationPage(BuildContext context, String title, String imagePath) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EducationPage(title: title, imagePath: imagePath)));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(180.0),
          child: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                TobetoText.mainEducation,
                style: TextStyle(fontSize: 28.0),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              labelText: TobetoText.mainSearch,
                              hintText: TobetoText.mainSearch,
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(color: TobetoColor.purple),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              _navigateToEmptyPage(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(ImagePath.purpleFilter, width: 24, height: 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TabBar(
                      tabs: [
                        Tab(
                          child: Text(
                            TobetoText.mainEducation,
                            style: TobetoTextStyle.poppins.bodyGrayLightLight16,
                          ),
                        ),
                        Tab(
                          child: Text(
                            TobetoText.mainContinue,
                            style: TobetoTextStyle.poppins.bodyGrayLightLight16,
                          ),
                        ),
                        Tab(
                          child: Text(
                            TobetoText.mainComplated,
                            style: TobetoTextStyle.poppins.bodyGrayLightLight16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  if (state is CoursesLoaded) {
                    final coursesToShow = _searchController.text.isEmpty ? state.courses : _filteredCourses;
                    return TabBarView(
                      children: [
                        _buildCourseList(coursesToShow),
                        _buildCourseList(coursesToShow.where((course) => course.status == 'ongoing').toList()),
                        _buildCourseList(coursesToShow.where((course) => course.status == 'completed').toList()),
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseList(List<Course> courses) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return GestureDetector(
          onTap: () {
            _navigateToEducationPage(context, course.title, course.image);
          },
          child: CourseCard(course: course),
        );
      },
    );
  }
}

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtre Sayfası'),
      ),
      body: Center(
        child: Text('Filtre ekranı'),
      ),
    );
  }
}

class EducationPage extends StatelessWidget {
  final String title;
  final String imagePath;

  EducationPage({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            SizedBox(height: 20),
            Text(
              '$title Sayfasına Hoşgeldiniz!',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
