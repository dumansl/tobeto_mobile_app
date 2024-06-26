import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/exam_model.dart';

class ExamService {
  Future<List<Exam>> getExams() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance
              .collection('reviews')
              .doc('exams')
              .get();

      List<Exam> exams = [];
      List<dynamic> examTypes = documentSnapshot.data()?['exam_type'] ?? [];

      for (var examType in examTypes) {
        exams.add(Exam.fromJson(examType));
      }
      return exams;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
