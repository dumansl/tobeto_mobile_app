import 'package:equatable/equatable.dart';
import 'package:tobeto_mobile_app/model/calendar_model.dart';


abstract class LessonState extends Equatable {
  const LessonState();

  @override
  List<Object> get props => [];
}

class LessonInitial extends LessonState {}

class LessonLoadInProgress extends LessonState {}

class LessonLoadSuccess extends LessonState {
  final List<Lesson> lessons;

  const LessonLoadSuccess([this.lessons = const []]);

  @override
  List<Object> get props => [lessons];
}

class LessonLoadFailure extends LessonState {}

class LessonSelected extends LessonState {
  final Lesson selectedLesson;

  const LessonSelected(this.selectedLesson);

  @override
  List<Object> get props => [selectedLesson];
}
