import 'package:equatable/equatable.dart';
import 'package:tobeto_mobile_app/model/calendar_model.dart';


abstract class LessonEvent extends Equatable {
  const LessonEvent();

  @override
  List<Object> get props => [];
}

class LessonsLoadRequested extends LessonEvent {}

class LessonSelectedEvent extends LessonEvent {
  final Lesson selectedLesson;

  const LessonSelectedEvent(this.selectedLesson);

  @override
  List<Object> get props => [selectedLesson];
}
