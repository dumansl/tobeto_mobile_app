import 'package:tobeto_mobile_app/model/exam_model.dart';

abstract class ExamState {}

class ExamInitialState extends ExamState {}

class ExamLoading extends ExamState {}

class ExamLoaded extends ExamState {
  final List<ExamModel> exams;

  ExamLoaded(this.exams);
}

class ExamResultSaved extends ExamState {}

class ExamResultError extends ExamState {
  final String message;

  ExamResultError(this.message);
}

class ExamError extends ExamState {
  final String message;

  ExamError(this.message);
}

class ExamResultInitial extends ExamState {}

class ExamResultLoading extends ExamState {}

class ExamResultLoaded extends ExamState {
  final ExamResult examResult;

  ExamResultLoaded(this.examResult);
}
