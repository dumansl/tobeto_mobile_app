import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_mobile_app/model/review_model.dart';

class ReviewService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  Future<Review> getReviews() async {
    DocumentReference userReviewRef = firestore
        .collection('users')
        .doc(userId)
        .collection('my_reviews')
        .doc('cUibAXvAfcAVX8D6jvnS');

    try {
      DocumentSnapshot documentSnapshot = await userReviewRef.get();

      if (documentSnapshot.exists) {
        bool isCompleted = documentSnapshot['isCompleted'];
        DocumentReference reviewRef = documentSnapshot['review'];
        double score = documentSnapshot['score'];

        DocumentSnapshot reviewSnapshot = await reviewRef.get();

        if (reviewSnapshot.exists) {
          Map<String, dynamic> answers = reviewSnapshot['answers'];
          List<dynamic> questions = reviewSnapshot['question'];

          Review review = Review(
            isCompleted: isCompleted,
            score: score,
            answers: answers,
            questions: questions,
          );

          return review;
        } else {
          throw Exception('Review does not exist.');
        }
      } else {
        throw Exception('My review does not exist.');
      }
    } catch (error) {
      throw Exception("Failed to get my review: $error");
    }
  }

  Future<void> updateReviewCompletionStatus(double averageScore) async {
    DocumentReference userReviewRef = firestore
        .collection('users')
        .doc('oSnY5kwmb3ggcrwKginND1kPwk92')
        .collection('my_reviews')
        .doc('cUibAXvAfcAVX8D6jvnS');

    try {
      await userReviewRef.update({
        'isCompleted': true,
        'score': averageScore,
      });
    } catch (error) {
      throw Exception("Failed to update review status: $error");
    }
  }
}
