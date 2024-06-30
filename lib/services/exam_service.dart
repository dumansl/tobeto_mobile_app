import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/exam_model.dart';

class ExamService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ExamService({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

  Future<List<ExamModel>> fetchReviewData() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('reviews').get();
      return snapshot.docs.map((doc) {
        return ExamModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Error fetching review data: $e');
    }
  }

  Future<void> saveExamResult({
    required int correctCount,
    required int incorrectCount,
    required int unansweredCount,
    required double score,
    required bool isCompleted,
    required String examId,
  }) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('my_exams')
            .doc(examId)
            .set({
          'correctCount': correctCount,
          'incorrectCount': incorrectCount,
          'unansweredCount': unansweredCount,
          'score': score,
          'isCompleted': isCompleted,
        });
      } else {
        throw Exception('No authenticated user');
      }
    } catch (e) {
      throw Exception('Failed to save quiz result: $e');
    }
  }

  Future<ExamResult> fetchExamResults({required String examId}) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
            await _firestore
                .collection('users')
                .doc(user.uid)
                .collection('my_exams')
                .doc(examId)
                .get();

        // Check if the document exists
        if (documentSnapshot.exists) {
          ExamResult result = ExamResult.fromMap(documentSnapshot.data()!);
          debugPrint("Burada $result");
          return result;
        } else {
          throw Exception('Document does not exist');
        }
      } else {
        throw Exception('No authenticated user');
      }
    } catch (e) {
      throw Exception('Failed to fetch quiz results: $e');
    }
  }
}
