import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_event.dart';
import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_state.dart';
import 'package:tobeto_mobile_app/services/calendar_service.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonRepository repository;

  LessonBloc(this.repository) : super(LessonInitial());

  @override
  Stream<LessonState> mapEventToState(LessonEvent event) async* {
    if (event is LessonsLoadRequested) {
      yield* _mapLessonsLoadRequestedToState();
    } else if (event is LessonSelectedEvent) {
      yield LessonSelected(event.selectedLesson);
    }
  }

  Stream<LessonState> _mapLessonsLoadRequestedToState() async* {
    yield LessonLoadInProgress();
    try {
      final lessons = await repository.getLessons().first;
      yield LessonLoadSuccess(lessons);
    } catch (_) {
      yield LessonLoadFailure();
    }
  }
}
