import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_event.dart';
import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_state.dart';
import 'package:tobeto_mobile_app/services/calendar_service.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final CalendarService repository;

  CalendarBloc(this.repository) : super(CalendarLoading()) {
    on<FetchLessons>((event, emit) async {
      try {
        final lessons = await repository.fetchLessons();
        debugPrint('Fetched lessons in BLoC: ${lessons.length}');
        emit(CalendarLoaded(lessons: lessons, selectedDate: DateTime.now()));
      } catch (error) {
        debugPrint('Error fetching lessons in BLoC: $error');
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
