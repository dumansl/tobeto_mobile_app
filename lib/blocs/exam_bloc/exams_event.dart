abstract class ExamEvent {}

class FetchExams extends ExamEvent {}

class SaveExamResult extends ExamEvent {
  final double score;
  final bool isCompleted;

  SaveExamResult(this.score, this.isCompleted);
}

class FetchExamResult extends ExamEvent {}
