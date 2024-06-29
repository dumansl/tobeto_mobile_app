class ExamModel {
  String exam;
  int examDuration;
  int numberOfQuestions;
  String questionType;
  List<Map<String, dynamic>> questions;

  ExamModel({
    required this.exam,
    required this.examDuration,
    required this.numberOfQuestions,
    required this.questionType,
    required this.questions,
  });

  factory ExamModel.fromMap(Map<String, dynamic> map) {
    List<Map<String, dynamic>> questions =
        List<Map<String, dynamic>>.from(map['questions'] ?? []);
    return ExamModel(
      exam: map['exam'] ?? '',
      examDuration: map['exam_duration'] ?? 0,
      numberOfQuestions: map['number_of_question'] ?? 0,
      questionType: map['question_type'] ?? '',
      questions: questions,
    );
  }
}

class ExamResult {
  final double? score;
  final bool? isCompleted;

  ExamResult({
    this.score,
    this.isCompleted,
  });

  factory ExamResult.fromMap(Map<String, dynamic> map) {
    return ExamResult(
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
    return 'ExamResult{score: $score, isCompleted: $isCompleted}';
  }
}
