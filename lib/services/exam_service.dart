import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/exam_model.dart';
import 'package:tobeto_mobile_app/services/firebase_service.provider.dart';
import 'package:tobeto_mobile_app/services/handler_errors.dart';

class ExamService {
  FirebaseFirestore get _firestore => FirebaseServiceProvider().firestore;
  FirebaseAuth get _auth => FirebaseServiceProvider().auth;

  Future<List<ExamModel>> fetchReviewData() async {
    return handleErrors(
      operation: () async {
        QuerySnapshot snapshot = await _firestore.collection('reviews').get();
        return snapshot.docs.map((doc) {
          return ExamModel.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();
      },
      onError: (e) {
        debugPrint('Error fetching review data: $e');
        throw Exception('Error fetching review data: $e');
      },
    );
  }

  Future<void> saveExamResult({
    required int correctCount,
    required int incorrectCount,
    required int unansweredCount,
    required double score,
    required bool isCompleted,
    required String examId,
  }) async {
    return handleErrors(
      operation: () async {
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
      },
      onError: (e) {
        debugPrint('Failed to save quiz result: $e');
        throw Exception('Failed to save quiz result: $e');
      },
    );
  }

  Future<ExamResult> fetchExamResults({required String examId}) async {
    return handleErrors(
      operation: () async {
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
            debugPrint("Fetched exam result: $result");
            return result;
          } else {
            throw Exception('Document does not exist');
          }
        } else {
          throw Exception('No authenticated user');
        }
      },
      onError: (e) {
        debugPrint('Failed to fetch quiz results: $e');
        throw Exception('Failed to fetch quiz results: $e');
      },
    );
  }
}
