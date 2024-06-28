import 'package:tobeto_mobile_app/model/tobeto_success_model.dart';

abstract class BusinessSuccessState {}

class BusinessSuccessInitial extends BusinessSuccessState {}

class BusinessSuccessLoading extends BusinessSuccessState {}

class BusinessSuccessLoaded extends BusinessSuccessState {
  final BusinessSuccessModel businessSuccess;

  BusinessSuccessLoaded(this.businessSuccess);
}

class BusinessSuccessError extends BusinessSuccessState {
  final String message;

  BusinessSuccessError(this.message);
}

class QuizResultLoading extends BusinessSuccessState {}

class QuizResultLoaded extends BusinessSuccessState {
  final List<QuizResult> quizResults;

  QuizResultLoaded(this.quizResults);
}

class QuizResultSaved extends BusinessSuccessState {}

class QuizResultError extends BusinessSuccessState {
  final String message;

  QuizResultError(this.message);
}
