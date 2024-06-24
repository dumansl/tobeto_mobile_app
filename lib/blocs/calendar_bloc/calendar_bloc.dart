import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/services/calendar_service.dart';
import 'calendar_event.dart';
import 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final CalendarRepository repository;

  CalendarBloc(this.repository) : super(CalendarLoading()) {
    on<FetchLessons>((event, emit) async {
      try {
        final lessons = await repository.fetchLessons();
        emit(CalendarLoaded(lessons: lessons, selectedDate: DateTime.now()));
      } catch (_) {
        emit(CalendarError());
      }
    });

    on<SelectDate>((event, emit) {
      if (state is CalendarLoaded) {
        emit((state as CalendarLoaded).copyWith(selectedDate: event.date));
      }
    });

    add(FetchLessons());
  }
}
