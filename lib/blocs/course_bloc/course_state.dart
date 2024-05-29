part of 'course_bloc.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class CoursesLoaded extends CourseState {
  final List<Course> courses;

  const CoursesLoaded({required this.courses});

  @override
  List<Object> get props => [courses];
}
