// review_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final bool isCompleted;
  final double score;
  final Map<String, dynamic> answers;
  final List<dynamic> questions;

  Review({
    required this.isCompleted,
    required this.score,
    required this.answers,
    required this.questions,
  });

  factory Review.fromFirestore(DocumentSnapshot doc) {
    return Review(
      isCompleted: doc['isCompleted'],
      score: doc['isCompleted'],
      answers: Map<String, dynamic>.from(doc['answers']),
      questions: List<dynamic>.from(doc['question']),
    );
  }
}
