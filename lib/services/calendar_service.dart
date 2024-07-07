import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/calendar_model.dart';
import 'package:tobeto_mobile_app/services/firebase_service.provider.dart';
import 'package:tobeto_mobile_app/services/handler_errors.dart';

class CalendarService {
  FirebaseFirestore get firestore => FirebaseServiceProvider().firestore;

  CalendarService();

  Future<List<Lesson>> fetchLessons() async {
    return handleErrors(
      operation: () async {
        QuerySnapshot snapshot = await firestore.collection('lessons').get();
        debugPrint('Fetched ${snapshot.docs.length} lessons from Firestore');
        return snapshot.docs
            .map((doc) => Lesson.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
      },
      onError: (e) {
        debugPrint('Error fetching lessons: $e');
        throw Exception('Error fetching lessons: $e');
      },
    );
  }
}
