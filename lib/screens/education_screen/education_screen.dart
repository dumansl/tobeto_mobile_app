// TO DO : Zehra Karaca <3
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/course_bloc/course_bloc.dart';
import '/model/course_model.dart';
import 'education_widgets/course_card.dart';

class EducationScreen extends StatefulWidget {
  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Course> _filteredCourses = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterCourses);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCourses);
    _searchController.dispose();
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Eğitimlerim'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Arama',
                      hintText: 'Arama',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue),
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
                      child: Image.asset('assets/images/ecmel_ayral.jpg', width: 24, height: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                if (state is CoursesLoaded) {
                  final coursesToShow = _searchController.text.isEmpty ? state.courses : _filteredCourses;
                  return ListView.builder(
                    itemCount: coursesToShow.length,
                    itemBuilder: (context, index) {
                      final course = coursesToShow[index];
                      return GestureDetector(
                        onTap: () {
                          _navigateToEducationPage(context, course.title, course.image);
                        },
                        child: CourseCard(course: course),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
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
