import 'package:cloud_firestore/cloud_firestore.dart';
import '/model/course_model.dart';

class EducationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Future<List<Course>> fetchCourseVideo(String educationId, String asyncEducationId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('educations')
          .doc(educationId)
          .collection('asynchronous_educations')
          .doc(asyncEducationId)
          .collection('videos')
          .get();

      return snapshot.docs.map((doc) => Course.fromFirestore(doc)).toList();
    } catch (e) {
      throw Exception('Error fetching course videos: $e');
    }
  }

  Future<void> updateWatchStatus(String educationId, String asyncEducationId, String videoId, bool isWatched) async {
    await _firestore
        .collection('educations')
        .doc(educationId)
        .collection('asynchronous_educations')
        .doc(asyncEducationId)
        .collection('videos')
        .doc(videoId)
        .set({'isWatched': isWatched}, SetOptions(merge: true));
  }

  Future<bool> getWatchStatus(String educationId, String asyncEducationId, String videoId) async {
    DocumentSnapshot doc = await _firestore
        .collection('educations')
        .doc(educationId)
        .collection('asynchronous_educations')
        .doc(asyncEducationId)
        .collection('videos')
        .doc(videoId)
        .get();

    if (doc.exists) {
      return doc['isWatched'] ?? false;
    }
    return false;
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
