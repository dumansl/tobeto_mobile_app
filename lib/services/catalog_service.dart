import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/catalog_model.dart';
import 'package:tobeto_mobile_app/services/handler_errors.dart';
import 'firebase_service.provider.dart';

class CourseRepository {
  FirebaseFirestore get _firestore => FirebaseServiceProvider().firestore;

  Future<List<CatalogCourse>> fetchLessons() async {
    return handleErrors(
      operation: () async {
        DocumentSnapshot snapshot = await _firestore
            .collection('educations')
            .doc('HRp6G8T2HcpZMjQMApaA')
            .collection('general_educations')
            .doc('flutter')
            .get();

        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
          List<CatalogCourse> courses = [];

          // Her kursu gezmek (alanların 'course1', 'course2' vb. olarak adlandırıldığını varsayarak)
          data.forEach((key, value) {
            if (value is Map<String, dynamic>) {
              courses.add(CatalogCourse.fromMap(value));
            }
          });

          return courses;
        } else {
          throw Exception('Document does not exist');
        }
      },
      onError: (e) {
        debugPrint('Error fetching lessons: $e');
        throw Exception('Error fetching lessons: $e');
      },
    );
  }
}
