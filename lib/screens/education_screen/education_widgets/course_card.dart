import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import '/model/course_model.dart';
import '../education_about.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onTertiaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EducationAbout(course: course),
            ),
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: Image.network(
                course.imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                course.title,
                style: TobetoTextStyle.poppins(context).captionBlackNormal18,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                pushWithoutNavBar(context, MaterialPageRoute(builder: (context) => EducationAbout(course: course)));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: TobetoColor.purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 7),
                textStyle: const TextStyle(fontSize: 14),
              ),
              child: Text(TobetoText.mainGoEducation),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCardList extends StatefulWidget {
  final List<Course> courses;
  final String? selectedProducer;

  const CourseCardList({super.key, required this.courses, this.selectedProducer});

  @override
  State<CourseCardList> createState() => _CourseCardListState();
}

class _CourseCardListState extends State<CourseCardList> {
  final TextEditingController _searchController = TextEditingController();
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
        final matchesTitle = course.title.toLowerCase().contains(query);
        final matchesProducer =
            widget.selectedProducer == null || course.producer.toLowerCase() == widget.selectedProducer!.toLowerCase();
        return matchesTitle && matchesProducer;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TobetoText.catalogCategory),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: TobetoText.mainSearch,
                border: const OutlineInputBorder(),
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
