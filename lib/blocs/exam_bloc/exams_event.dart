abstract class ExamEvent {}

class FetchExams extends ExamEvent {}

class UpdateExamResult extends ExamEvent {
  final String userExamId;
  final int totalScore;

  UpdateExamResult(this.userExamId, this.totalScore);
}
