import 'package:tobeto_mobile_app/model/exam_model.dart';

abstract class ExamState {}

class InitialState extends ExamState {}

class ExamLoading extends ExamState {}

class ExamLoaded extends ExamState {
  final List<Exam> exams;

  ExamLoaded(this.exams);
}

class ExamError extends ExamState {
  final String message;

  ExamError(this.message);
}
