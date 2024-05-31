import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import '/model/course_model.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<LoadCourses>((event, emit) {
      emit(CoursesLoaded(courses: [
        Course(title: 'Flutter Eğitimi', image: ImagePath.ecmelAyral, status: 'ongoing'),
        Course(title: 'React Native Eğitimi', image: ImagePath.ecmelAyral, status: 'completed'),
        Course(title: 'Swift Eğitimi', image: ImagePath.ecmelAyral, status: 'ongoing'),
      ]));
    });
  }
}
