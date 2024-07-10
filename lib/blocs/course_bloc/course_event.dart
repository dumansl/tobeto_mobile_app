part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

class LoadCourses extends CourseEvent {}

class LoadCourseVideos extends CourseEvent {
  final String educationId;
  final String asyncEducationId;

  const LoadCourseVideos({
    required this.educationId,
    required this.asyncEducationId,
  });

  @override
  List<Object> get props => [educationId, asyncEducationId];
}
