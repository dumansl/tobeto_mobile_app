abstract class ExamEvent {}

class FetchExams extends ExamEvent {}

class SaveExamResult extends ExamEvent {
  final int correctCount;
  final int incorrectCount;
  final int unansweredCount;
  final double score;
  final bool isCompleted;
  final String examId;

  SaveExamResult({
    required this.correctCount,
    required this.incorrectCount,
    required this.unansweredCount,
    required this.score,
    required this.isCompleted,
    required this.examId,
  });
}

class FetchExamResult extends ExamEvent {
  final String examId;

  FetchExamResult(this.examId);
}
