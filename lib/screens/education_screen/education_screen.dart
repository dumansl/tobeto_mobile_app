// TO DO : Zehra Karaca <3
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/screens/education_screen/education_widgets/course_card.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import '/blocs/course_bloc/course_bloc.dart';
import '/model/course_model.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  List<Course> _filteredCourses = [];
  TabController? _tabController;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterCourses);
    _tabController = TabController(length: 3, vsync: this);
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCourses);
    _searchController.dispose();
    _tabController?.dispose();
    _focusNode.dispose();
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => const EmptyPage()));
  }

  void _navigateToEducationPage(BuildContext context, String title, String imagePath) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EducationPage(title: title, imagePath: imagePath)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourseBloc>(
      create: (context) => CourseBloc()..add(LoadCourses()),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(180.0),
            child: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  'Eğitimlerim',
                  style: TobetoTextStyle.poppins.captionBlackNormal24,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80.0),
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
                              focusNode: _focusNode,
                              decoration: InputDecoration(
                                hintText: _focusNode.hasFocus ? '' : 'Arama',
                                prefixIcon: const Icon(Icons.search),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                ),
                                focusedBorder: const OutlineInputBorder(
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
                                child: Image.asset(ImagePath.purpleFilter, width: 36, height: 36),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TabBar(
                        isScrollable: true,
                        indicatorColor: TobetoColor.purple,
                        tabs: [
                          Tab(
                            child: Text(
                              TobetoText.mainEducation,
                              style: TobetoTextStyle.poppins.captionBlackNormal12,
                              textAlign: TextAlign.center,
                              //overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Tab(
                            child: Text(
                              TobetoText.mainContinue,
                              style: TobetoTextStyle.poppins.captionBlackNormal12,
                              textAlign: TextAlign.center,
                              //overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Tab(
                            child: Text(
                              TobetoText.mainComplated,
                              style: TobetoTextStyle.poppins.captionBlackNormal12,
                              textAlign: TextAlign.center,
                              //overflow: TextOverflow.ellipsis,
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
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
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
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtre Sayfası'),
      ),
      body: const Center(
        child: Text('Filtre ekranı'),
      ),
    );
  }
}

class EducationPage extends StatelessWidget {
  final String title;
  final String imagePath;

  const EducationPage({super.key, required this.title, required this.imagePath});

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
            const SizedBox(height: 20),
            Text(
              '$title Sayfasına Hoşgeldiniz!',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
