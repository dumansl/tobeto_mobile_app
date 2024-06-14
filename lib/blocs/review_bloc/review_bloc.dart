import 'package:bloc/bloc.dart';
import 'package:tobeto_mobile_app/blocs/review_bloc/review_event.dart';
import 'package:tobeto_mobile_app/blocs/review_bloc/review_state.dart';
import 'package:tobeto_mobile_app/model/review_model.dart';
import 'package:tobeto_mobile_app/services/review_service.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ReviewService reviewService = ReviewService();

  ReviewBloc() : super(InitialState()) {
    on<FetchReviews>(fetchReviews);
    on<UpdateReviewStatus>(updateReviewStatus);
  }

  Future<void> fetchReviews(
      FetchReviews event, Emitter<ReviewState> emit) async {
    emit(ReviewLoading());
    try {
      final Review reviews = await reviewService.getReviews();
      emit(ReviewLoaded(reviews));
    } catch (e) {
      emit(ReviewError(e.toString()));
    }
  }

  Future<void> updateReviewStatus(
      UpdateReviewStatus event, Emitter<ReviewState> emit) async {
    try {
      await reviewService.updateReviewCompletionStatus(event.averageScore);
      emit(ReviewUpdated());
    } catch (e) {
      emit(ReviewError(e.toString()));
    }
  }
}
