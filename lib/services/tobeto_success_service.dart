import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_mobile_app/model/tobeto_success_model.dart';
import 'package:tobeto_mobile_app/services/firebase_service.provider.dart';
import 'package:tobeto_mobile_app/services/handler_errors.dart';

class TobetoSuccessService {
  FirebaseFirestore get firestore => FirebaseServiceProvider().firestore;
  FirebaseAuth get auth => FirebaseServiceProvider().auth;

  Future<Map<String, dynamic>> fetchBusinessSuccessData() async {
    return handleErrors(
      operation: () async {
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
            await firestore
                .collection('tobeto_business_success')
                .doc('tobeto_business_success')
                .get();

        if (documentSnapshot.exists) {
          return documentSnapshot.data()!;
        } else {
          throw Exception('Document does not exist');
        }
      },
      onError: (e) {
        throw Exception('Failed to fetch data: $e');
      },
    );
  }

  Future<void> saveQuizResult(double score, bool isCompleted) async {
    return handleErrors(
      operation: () async {
        User? user = auth.currentUser;

        if (user != null) {
          await firestore
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
      },
      onError: (e) {
        throw Exception('Failed to save quiz result: $e');
      },
    );
  }

  Future<List<QuizResult>> fetchQuizResults() async {
    return handleErrors(
      operation: () async {
        User? user = auth.currentUser;

        if (user != null) {
          QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
              .collection('users')
              .doc(user.uid)
              .collection('my_reviews')
              .get();

          return querySnapshot.docs
              .map((doc) => QuizResult.fromMap(doc.data()))
              .toList();
        } else {
          throw Exception('No authenticated user');
        }
      },
      onError: (e) {
        throw Exception('Failed to fetch quiz results: $e');
      },
    );
  }
}
