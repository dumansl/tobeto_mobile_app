abstract class BusinessSuccessEvent {}

class FetchBusinessSuccess extends BusinessSuccessEvent {}

class SaveQuizResult extends BusinessSuccessEvent {
  final double score;
  final bool isCompleted;

  SaveQuizResult(this.score, this.isCompleted);
}

class FetchQuizResult extends BusinessSuccessEvent {}
