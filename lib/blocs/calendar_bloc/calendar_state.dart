import 'package:equatable/equatable.dart';
import 'package:tobeto_mobile_app/model/calendar_model.dart';

abstract class CalendarState extends Equatable {
  const CalendarState();

  @override
  List<Object> get props => [];
}

class CalendarLoading extends CalendarState {}

class CalendarLoaded extends CalendarState {
  final List<Lesson> lessons;
  final DateTime selectedDate;

  const CalendarLoaded({required this.lessons, required this.selectedDate});

  CalendarLoaded copyWith({List<Lesson>? lessons, DateTime? selectedDate}) {
    return CalendarLoaded(
      lessons: lessons ?? this.lessons,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }

  @override
  List<Object> get props => [lessons, selectedDate];
}

class CalendarError extends CalendarState {}
