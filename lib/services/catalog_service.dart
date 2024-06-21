import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobile_app/model/catalog_model.dart';

class CourseRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CatalogCourse>> fetchLessons() async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('educations')
          .doc('HRp6G8T2HcpZMjQMApaA')
          .collection('general_educations')
          .doc('flutter')
          .get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        List<CatalogCourse> courses = [];

        // Iterate through each course (assuming the fields are named 'course1', 'course2', etc.)
        data.forEach((key, value) {
          if (value is Map<String, dynamic>) {
            courses.add(CatalogCourse.fromMap(value));
          }
        });

        return courses;
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching lessons: $e');
    }
  }
}
