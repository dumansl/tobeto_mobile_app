abstract class ReviewEvent {}

class FetchReviews extends ReviewEvent {}

class UpdateReviewStatus extends ReviewEvent {
  final double averageScore;

  UpdateReviewStatus(this.averageScore);
}
