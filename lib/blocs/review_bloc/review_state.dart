import 'package:tobeto_mobile_app/model/review_model.dart';

abstract class ReviewState {}

class InitialState extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewLoaded extends ReviewState {
  final Review reviews;

  ReviewLoaded(this.reviews);
}

class ReviewUpdated extends ReviewState {}

class ReviewError extends ReviewState {
  final String message;

  ReviewError(this.message);
}
