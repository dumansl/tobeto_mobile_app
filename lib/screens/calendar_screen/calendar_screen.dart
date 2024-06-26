import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_event.dart';
import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_state.dart';
import 'package:tobeto_mobile_app/model/calendar_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/services/calendar_service.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalendarBloc(CalendarService()),
      child: Scaffold(
        appBar: FixedAppbar(
          title: Text(TobetoText.calendarAppBar, style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28),
          isLeading: false,
        ),
        body: BlocBuilder<CalendarBloc, CalendarState>(
          builder: (context, state) {
            if (state is CalendarLoading) {
              debugPrint('CalendarLoading state');
              return const Center(child: CircularProgressIndicator());
            } else if (state is CalendarLoaded) {
              debugPrint('CalendarLoaded state with ${state.lessons.length} lessons');
              return Column(
                children: [
                  TableCalendar(
                    headerStyle: const HeaderStyle(formatButtonVisible: false),
                    calendarStyle: CalendarStyle(
                        todayDecoration: ShapeDecoration(
                            color: const Color.fromARGB(255, 0, 221, 7).withOpacity(0.4), shape: const CircleBorder()),
                        selectedDecoration: const ShapeDecoration(color: TobetoColor.purple, shape: CircleBorder())),
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
                                      margin: const EdgeInsets.symmetric(horizontal: 1.5),
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: Color(lesson.color),
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
                      itemCount: state.lessons.where((lesson) => isSameDay(lesson.date, state.selectedDate)).length,
                      itemBuilder: (context, index) {
                        Lesson lesson =
                            state.lessons.where((lesson) => isSameDay(lesson.date, state.selectedDate)).toList()[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: Color(lesson.color),
                              ),
                              borderRadius: BorderRadius.circular(SizeRadius.radius12px)),
                          color: Color(lesson.color).withOpacity(0.4),
                          child: ListTile(
                              title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      child: Icon(
                                    Icons.access_alarm_rounded,
                                    size: ScreenUtil.getHeight(context) * 0.038,
                                  )),
                                  SizedBox(width: ScreenUtil.getWidth(context) * 0.04),
                                  Text(lesson.time),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.menu_book_outlined,
                                    size: ScreenUtil.getHeight(context) * 0.038,
                                  ),
                                  SizedBox(width: ScreenUtil.getWidth(context) * 0.04),
                                  Text(lesson.instructor),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_rounded,
                                    size: ScreenUtil.getHeight(context) * 0.038,
                                  ),
                                  SizedBox(width: ScreenUtil.getWidth(context) * 0.04),
                                  Text(lesson.title),
                                ],
                              )
                            ],
                          )),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is CalendarError) {
              debugPrint('CalendarError state');
              return const Center(child: Text('Veri yüklenemedi.'));
            } else {
              debugPrint('Unknown state: $state');
              return const Center(child: Text('Bilinmeyen bir hata oluştu.'));
            }
          },
        ),
      ),
    );
  }
}
