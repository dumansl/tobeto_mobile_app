class BusinessSuccessModel {
  final List<String> questions;
  final Map<String, int> answers;

  BusinessSuccessModel({
    required this.questions,
    required this.answers,
  });

  factory BusinessSuccessModel.fromJson(Map<String, dynamic> json) {
    return BusinessSuccessModel(
      questions: List<String>.from(json['question'] ?? []),
      answers: Map<String, int>.from(json['answers'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questions': questions,
      'answers': answers,
    };
  }

  @override
  String toString() {
    return 'BusinessSuccessModel{questions: $questions, answers: $answers}';
  }
}

class QuizResult {
  final double? score;
  final bool? isCompleted;

  QuizResult({
    this.score,
    this.isCompleted,
  });

  factory QuizResult.fromMap(Map<String, dynamic> map) {
    return QuizResult(
      score: map['score'] ?? 0,
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'score': score,
      'isCompleted': isCompleted,
    };
  }

  @override
  String toString() {
    return 'QuizResult{score: $score, isCompleted: $isCompleted}';
  }
}
