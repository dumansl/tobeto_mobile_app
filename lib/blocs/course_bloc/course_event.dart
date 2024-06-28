part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

class LoadCourses extends CourseEvent {}

class LoadCourseVideo extends CourseEvent {
  final String educationId;
  final String asyncEducationId;
  final String videoId;

  const LoadCourseVideo({
    required this.educationId,
    required this.asyncEducationId,
    required this.videoId,
  });

  @override
  List<Object> get props => [educationId, asyncEducationId, videoId];
}
