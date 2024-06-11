import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import '/model/course_model.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<LoadCourses>((event, emit) {
      emit(const CoursesLoaded(courses: [
        Course(
          title: 'Dr. Ecmel Ayral\'dan Hoşgeldin Mesajı',
          image: ImagePath.ecmelAyral,
          status: 'completed',
          duration: 10,
          points: 100,
          language: 'Türkçe',
          content: 'Bu eğitimde İstanbul Kodluyor hakkında temel bilgiler edineceksiniz.',
        ),
        Course(
          title: 'Eğitimlere Nasıl Katılırım?',
          image: ImagePath.howToTraining,
          status: 'ongoing',
          duration: 20,
          points: 150,
          language: 'Türkçe',
          content: 'Bu eğitimde eğitimlere nasıl katılacağınızı öğreneceksiniz.',
        ),
        Course(
          title: 'Flutter Eğitimi',
          image: ImagePath.ecmelAyral,
          status: 'ongoing',
          duration: 30,
          points: 200,
          language: 'Türkçe',
          content: 'Bu eğitimde Flutter hakkında ileri seviye bilgiler edineceksiniz.',
        ),
      ]));
    });
  }
}
