import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/model/course_model.dart';
import 'package:tobeto_mobile_app/services/education_service.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final EducationService _educationService = EducationService();

  CourseBloc() : super(CourseInitial()) {
    on<LoadCourses>((event, emit) async {
      try {
        final List<Course> courses = await _educationService.fetchCourses();
        emit(CoursesLoaded(courses: courses));
      } catch (e) {
        emit(CourseLoadFailure(error: e.toString()));
      }
    });

    on<LoadCourseVideos>((event, emit) async {
      try {
        final List<Course> videos = await _educationService.fetchCourseVideo(event.educationId, event.asyncEducationId);
        emit(CourseVideosLoaded(videos: videos));
      } catch (e) {
        emit(CourseLoadFailure(error: e.toString()));
      }
    });

    on<UpdateCourseStatus>((event, emit) async {
      try {
        await _educationService.updateCourseCompletionStatus(event.userId, event.educationId, event.asyncEducationId);
        final List<Course> courses = await _educationService.fetchCourses();
        emit(CoursesLoaded(courses: courses));
      } catch (e) {
        emit(CourseLoadFailure(error: e.toString()));
      }
    });
  }
}
