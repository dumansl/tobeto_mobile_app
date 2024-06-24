import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_event.dart';
import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_state.dart';
import 'package:tobeto_mobile_app/model/calendar_model.dart';
import 'package:tobeto_mobile_app/services/calendar_service.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalendarBloc(CalendarRepository(CalendarService())),
      child: CalendarView(),
    );
  }
}

class CalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Takvim'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              // Filtre işlemleri
            },
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<CalendarBloc, CalendarState>(
            builder: (context, state) {
              if (state is CalendarLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is CalendarLoaded) {
                return Column(
                  children: [
                    TableCalendar(
                      firstDay: DateTime.utc(2020, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: state.selectedDate,
                      selectedDayPredicate: (day) => isSameDay(state.selectedDate, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        context.read<CalendarBloc>().add(SelectDate(selectedDay));
                      },
                      calendarBuilders: CalendarBuilders(
                        markerBuilder: (context, date, events) {
                          List<Lesson> lessons = state.lessons.where((lesson) => isSameDay(lesson.date, date)).toList();
                          if (lessons.isNotEmpty) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: lessons
                                  .map((lesson) => Container(
                                        margin: EdgeInsets.symmetric(horizontal: 1.5),
                                        width: 5.0,
                                        height: 5.0,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                      ))
                                  .toList(),
                            );
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.lessons.length,
                        itemBuilder: (context, index) {
                          Lesson lesson = state.lessons[index];
                          return Card(
                            color: Colors.red,
                            child: ListTile(
                              title: Text(lesson.time),
                              subtitle: Text(lesson.instructor),
                              leading: Text(lesson.title),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: Text('Veri yüklenemedi.'));
              }
            },
          ),
        ],
      ),
    );
  }
}
