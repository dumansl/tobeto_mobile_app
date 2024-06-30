class ExamModel {
  String examId;
  String exam;
  int examDuration;
  int numberOfQuestions;
  String questionType;
  List<Map<String, dynamic>> questions;

  ExamModel({
    required this.examId,
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
      examId: map['examId'] ?? '',
      exam: map['exam'] ?? '',
      examDuration: map['exam_duration'] ?? 0,
      numberOfQuestions: map['number_of_question'] ?? 0,
      questionType: map['question_type'] ?? '',
      questions: questions,
    );
  }
}

class ExamResult {
  final int correctAnswers;
  final int incorrectAnswers;
  final int unansweredQuestions;
  final double score;
  final bool isCompleted;

  ExamResult({
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.unansweredQuestions,
    required this.score,
    required this.isCompleted,
  });

  factory ExamResult.fromMap(Map<String, dynamic> map) {
    return ExamResult(
      correctAnswers: map['correctCount'] ?? 0,
      incorrectAnswers: map['incorrectCount'] ?? 0,
      unansweredQuestions: map['unansweredCount'] ?? 0,
      score: map['score'] ?? 0.0,
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'correctAnswers': correctAnswers,
      'incorrectAnswers': incorrectAnswers,
      'unansweredQuestions': unansweredQuestions,
      'score': score,
      'isCompleted': isCompleted,
    };
  }

  @override
  String toString() {
    return 'ExamResult{correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, unansweredQuestions: $unansweredQuestions, score: $score, isCompleted: $isCompleted}';
  }
}
