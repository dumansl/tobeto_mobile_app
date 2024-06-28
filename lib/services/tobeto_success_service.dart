import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/tobeto_success_model.dart';

class TobetoSuccessService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  TobetoSuccessService({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

  Future<Map<String, dynamic>> fetchBusinessSuccessData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await _firestore
          .collection('tobeto_business_success')
          .doc('tobeto_business_success')
          .get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> tobetoSuccess = documentSnapshot.data()!;
        // debugPrint(tobetoSuccess.toString());
        return tobetoSuccess;
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<void> saveQuizResult(double score, bool isCompleted) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('my_reviews')
            .add({
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

  Future<List<QuizResult>> fetchQuizResults() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('my_reviews')
            .get();

        List<QuizResult> result = querySnapshot.docs
            .map((doc) => QuizResult.fromMap(doc.data()))
            .toList();
        debugPrint(result.toString());
        return result;
      } else {
        throw Exception('No authenticated user');
      }
    } catch (e) {
      throw Exception('Failed to fetch quiz results: $e');
    }
  }
}
