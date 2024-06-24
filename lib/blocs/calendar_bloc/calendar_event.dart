import 'package:equatable/equatable.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object> get props => [];
}

class FetchLessons extends CalendarEvent {}

class SelectDate extends CalendarEvent {
  final DateTime date;

  const SelectDate(this.date);

  @override
  List<Object> get props => [date];
}
