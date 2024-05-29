import 'package:flutter/material.dart';
import '/model/course_model.dart';
import '../education_screen.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EducationPage(
                title: course.title,
                imagePath: course.image,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Image.asset(course.image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                course.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EducationPage(
                      title: course.title,
                      imagePath: course.image,
                    ),
                  ),
                );
              },
              child: Text('Eğitime Git'),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCardList extends StatefulWidget {
  final List<Course> courses;

  CourseCardList({required this.courses});

  @override
  _CourseCardListState createState() => _CourseCardListState();
}

class _CourseCardListState extends State<CourseCardList> {
  TextEditingController _searchController = TextEditingController();
  List<Course> _filteredCourses = [];

  @override
  void initState() {
    super.initState();
    _filteredCourses = widget.courses;
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
    setState(() {
      _filteredCourses = widget.courses.where((course) {
        return course.title.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kurslar'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Ara',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCourses.length,
              itemBuilder: (context, index) {
                return CourseCard(course: _filteredCourses[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
