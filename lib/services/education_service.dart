import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/services/handler_errors.dart';
import '/model/course_model.dart';
import 'firebase_service.provider.dart';

class EducationService {
  FirebaseFirestore get _firestore => FirebaseServiceProvider().firestore;

  Future<List<Course>> fetchCourses() async {
    return handleErrors(
      operation: () async {
        QuerySnapshot snapshot =
            await _firestore.collection('educations').get();
        List<Course> courses = [];
        for (var doc in snapshot.docs) {
          QuerySnapshot asyncSnapshot =
              await doc.reference.collection('asynchronous_educations').get();
          for (var asyncDoc in asyncSnapshot.docs) {
            DocumentSnapshot aboutDoc = await asyncDoc.reference
                .collection('about')
                .doc('details')
                .get();
            courses.add(Course.fromFirestore(aboutDoc));
          }
        }
        return courses;
      },
      onError: (e) {
        debugPrint('Error fetching courses: $e');
        throw Exception('Error fetching courses: $e');
      },
    );
  }

  Future<Course> fetchCourseVideo(
      String educationId, String asyncEducationId, String videoId) async {
    return handleErrors(
      operation: () async {
        DocumentSnapshot courseSnapshot = await _firestore
            .collection('educations')
            .doc(educationId)
            .collection('asynchronous_educations')
            .doc(asyncEducationId)
            .collection('videos')
            .doc(videoId)
            .get();

        if (!courseSnapshot.exists) {
          throw Exception('Video not found');
        }

        return Course.fromFirestore(courseSnapshot);
      },
      onError: (e) {
        debugPrint('Error fetching course video: $e');
        throw Exception('Error fetching course video: $e');
      },
    );
  }

  Future<bool> checkUserStatus(String userId) async {
    return handleErrors(
      operation: () async {
        QuerySnapshot userSnapshot = await _firestore
            .collection('users')
            .doc(userId)
            .collection('my_appeal')
            .get();
        for (var doc in userSnapshot.docs) {
          if (doc['status'] == 'Kabul Edildi') {
            return true;
          }
        }
        return false;
      },
      onError: (e) {
        debugPrint('Error checking user status: $e');
        throw Exception('Error checking user status: $e');
      },
    );
  }
}
