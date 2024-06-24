import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobile_app/model/calendar_model.dart';

class LessonRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Lesson>> getLessons() {
    return _firestore.collection('lessons').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Lesson.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }
}
