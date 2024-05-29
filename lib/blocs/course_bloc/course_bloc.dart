import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/model/course_model.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<LoadCourses>((event, emit) {
      emit(CoursesLoaded(courses: [
        Course(title: 'Flutter Eğitimi', image: 'assets/images/ecmel_ayral.jpg'),
        Course(title: 'React Native Eğitimi', image: 'assets/images/ecmel_ayral.jpg'),
        Course(title: 'Swift Eğitimi', image: 'assets/images/ecmel_ayral.jpg'),
      ]));
    });
  }
}
