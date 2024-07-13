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
          var course = Course.fromFirestore(aboutDoc);
          course = course.copyWith(
            educationId: doc.id,
            asyncEducationId: asyncDoc.id,
          );
          courses.add(course);
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

  Future<void> updateWatchStatus(
      String userId, String videoId, String educationId, String asyncEducationId, bool isWatched) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('videos')
        .doc(videoId)
        .set({
          'educationId': educationId,
          'asyncEducationId': asyncEducationId,
          'isWatched': isWatched,
        }, SetOptions(merge: true))
        .then((_) {})
        .catchError((error) {});
    await updateCourseCompletionStatus(userId, educationId, asyncEducationId);
  }

  Future<void> updateCourseCompletionStatus(String userId, String educationId, String asyncEducationId) async {
    QuerySnapshot videoSnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('videos')
        .where('educationId', isEqualTo: educationId)
        .where('asyncEducationId', isEqualTo: asyncEducationId)
        .get();

    bool allVideosWatched = videoSnapshot.docs.every((doc) => doc['isWatched'] == true);

    await _firestore
        .collection('users')
        .doc(userId)
        .collection('completed_videos')
        .doc(asyncEducationId)
        .set({'isCompleted': allVideosWatched}, SetOptions(merge: true))
        .then((_) {})
        .catchError((error) {});
  }

  Future<bool> getWatchStatus(String userId, String videoId) async {
    DocumentSnapshot doc = await _firestore.collection('users').doc(userId).collection('videos').doc(videoId).get();

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

  Future<void> updateFavoriteStatus(String userId, String asyncEducationId, bool isLiked) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(asyncEducationId)
        .set({'isLiked': isLiked});
  }

  Future<bool> getFavoriteStatus(String userId, String asyncEducationId) async {
    final doc = await _firestore.collection('users').doc(userId).collection('favorites').doc(asyncEducationId).get();
    return doc.exists ? doc['isLiked'] : false;
  }

  Future<void> updateBookmarkStatus(String userId, String asyncEducationId, bool isBookmarked) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('bookmarks')
        .doc(asyncEducationId)
        .set({'isBookmarked': isBookmarked});
  }

  Future<bool> getBookmarkStatus(String userId, String asyncEducationId) async {
    final doc = await _firestore.collection('users').doc(userId).collection('bookmarks').doc(asyncEducationId).get();
    return doc.exists ? doc['isBookmarked'] : false;
  }
}
