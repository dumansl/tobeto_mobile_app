import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/model/course_model.dart';

class EducationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<Course>> fetchCourses() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('educations').get();
      List<Course> courses = [];
      for (var doc in snapshot.docs) {
        QuerySnapshot asyncSnapshot = await doc.reference.collection('asynchronous_educations').get();
        for (var asyncDoc in asyncSnapshot.docs) {
          DocumentSnapshot aboutDoc = await asyncDoc.reference.collection('about').doc('details').get();
          courses.add(Course.fromFirestore(aboutDoc));
        }
      }
      return courses;
    } catch (e) {
      throw Exception('Error fetching courses: $e');
    }
  }

  Future<Course> fetchCourseVideo(String educationId, String asyncEducationId, String videoId) async {
    try {
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
    } catch (e) {
      throw Exception('Error fetching course video: $e');
    }
  }

  Future<bool> checkUserStatus(String userId) async {
    try {
      QuerySnapshot userSnapshot = await _firestore.collection('users').doc(userId).collection('my_appeal').get();
      for (var doc in userSnapshot.docs) {
        if (doc['status'] == 'Kabul Edildi') {
          return true;
        }
      }
      return false;
    } catch (e) {
      throw Exception('Error checking user status: $e');
    }
  }
}
