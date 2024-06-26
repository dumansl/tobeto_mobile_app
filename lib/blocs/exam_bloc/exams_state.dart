import 'package:tobeto_mobile_app/model/exam_model.dart';

abstract class ExamState {}

class ExamInitialState extends ExamState {}

class ExamLoading extends ExamState {}

class ExamLoaded extends ExamState {
  final List<UserExam> exams;

  ExamLoaded(this.exams);
}

class ExamUpdated extends ExamState {
  final List<UserExam> exams;

  ExamUpdated(this.exams);
}

class ExamUpdatedError extends ExamState {
  final String message;

  ExamUpdatedError(this.message);
}

class ExamError extends ExamState {
  final String message;

  ExamError(this.message);
}
