// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_bloc.dart';
// import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_event.dart';
// import 'package:tobeto_mobile_app/blocs/calendar_bloc/calendar_state.dart';
// import 'package:tobeto_mobile_app/services/calendar_service.dart';

// class CalendarScreen extends StatelessWidget {
//   const CalendarScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Takvim'),
//       ),
//       body: BlocProvider(
//         create: (context) =>
//             LessonBloc(LessonRepository())..add(LessonsLoadRequested()),
//         child: const CalendarView(),
//       ),
//     );
//   }
// }

// class CalendarView extends StatelessWidget {
//   const CalendarView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       children: [
//         CalendarWidget(),
//         Expanded(child: LessonDetailView()),
//       ],
//     );
//   }
// }

// class CalendarWidget extends StatelessWidget {
//   const CalendarWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LessonBloc, LessonState>(
//       builder: (context, state) {
//         if (state is LessonLoadInProgress) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is LessonLoadSuccess) {
//           return TableCalendar(
//             focusedDay: DateTime.now(),
//             firstDay: DateTime.utc(2020, 10, 16),
//             lastDay: DateTime.utc(2030, 3, 14),
//             eventLoader: (day) {
//               return state.lessons
//                   .where((lesson) => isSameDay(lesson.date, day))
//                   .toList();
//             },
//             onDaySelected: (selectedDay, focusedDay) {
//               final selectedLessons = state.lessons
//                   .where((lesson) => isSameDay(lesson.date, selectedDay))
//                   .toList();
//               if (selectedLessons.isNotEmpty) {
//                 context
//                     .read<LessonBloc>()
//                     .add(LessonSelectedEvent(selectedLessons.first));
//               }
//             },
//             calendarBuilders: CalendarBuilders(
//               markerBuilder: (context, date, lessons) {
//                 if (lessons.isNotEmpty) {
//                   return ListView.builder(
//                     shrinkWrap:
//                         true, // Use shrinkWrap to prevent infinite height error
//                     itemCount: lessons.length,
//                     itemBuilder: (context, index) {
//                       final colorString = lessons[index].color;
//                       final colorValue = colorString.startsWith('#')
//                           ? int.parse(colorString.replaceFirst('#', '0xFF'))
//                           : int.parse('0xFF$colorString');
// // 
//                       return Container(
//                         margin: const EdgeInsets.all(1.0),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Color(colorValue),
//                         ),
//                         width: 7.0,
//                         height: 7.0,
//                       );
//                     },
//                   );
//                 }
//                 return const SizedBox();
//               },
//             ),
//           );
//         } else {
//           return const Center(child: Text('Dersler yüklenemedi.'));
//         }
//       },
//     );
//   }
// }

// class LessonDetailView extends StatelessWidget {
//   const LessonDetailView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LessonBloc, LessonState>(
//       builder: (context, state) {
//         if (state is LessonSelected) {
//           final lesson = state.selectedLesson;
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Ders: ${lesson.title}',
//                     style: const TextStyle(fontSize: 20)),
//                 const SizedBox(height: 8),
//                 Text('Eğitmen: ${lesson.instructor}'),
//                 const SizedBox(height: 8),
//                 Text('Saat: ${lesson.startTime} - ${lesson.endTime}'),
//                 const SizedBox(height: 8),
//                 Text('Tarih: ${lesson.date.toLocal()}'),
//               ],
//             ),
//           );
//         }
//         return const Center(child: Text('Bir ders seçin'));
//       },
//     );
//   }
// }
