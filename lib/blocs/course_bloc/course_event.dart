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

  const LoadCourseVideos({required this.educationId, required this.asyncEducationId});

  @override
  List<Object> get props => [educationId, asyncEducationId];
}

class UpdateCourseStatus extends CourseEvent {
  final String userId;
  final String educationId;
  final String asyncEducationId;

  const UpdateCourseStatus(this.userId, this.educationId, this.asyncEducationId);

  @override
  List<Object> get props => [userId, educationId, asyncEducationId];
}
