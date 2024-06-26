import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/exam_model.dart';

class ExamService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  Future<List<UserExam>> getExamData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('my_exams')
          .get();

      if (snapshot.docs.isNotEmpty) {
        List<UserExam> exams = [];

        for (var doc in snapshot.docs) {
          var data = doc.data();
          data['id'] = doc.id;

          if (data.containsKey('exam') && data['exam'] is DocumentReference) {
            DocumentSnapshot<Map<String, dynamic>> examSnapshot =
                await (data['exam'] as DocumentReference).get()
                    as DocumentSnapshot<Map<String, dynamic>>;
            data['exam'] = examSnapshot.data();
          }

          exams.add(UserExam.fromMap(data, doc.id));
        }

        return exams;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint("Error getting exam data: $e");
      return [];
    }
  }

  Future<void> updateExamStatus(String examId, bool isCompleted) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('my_exams')
          .doc(examId)
          .update({'isCompleted': isCompleted});
    } catch (e) {
      debugPrint("Error updating exam status: $e");
    }
  }

  Future<void> updateExamScore(String examId, Map<String, int> score) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('my_exams')
          .doc(examId)
          .update({'score': score});
    } catch (e) {
      debugPrint("Error updating exam score: $e");
    }
  }
}
