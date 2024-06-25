import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobile_app/model/calendar_model.dart';

class CalendarRepository {
  final CalendarService service;

  CalendarRepository(this.service);

  Future<List<Lesson>> fetchLessons() {
    return service.fetchLessons();
  }
}

class CalendarService {
  Future<List<Lesson>> fetchLessons() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firestore.collection('lessons').get();
    print('Fetched ${snapshot.docs.length} lessons from Firestore');
    return snapshot.docs
        .map((doc) => Lesson.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
